package net.socialgamer.cah.util;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentials;
import software.amazon.awssdk.auth.credentials.AwsSessionCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.core.SdkBytes;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.bedrockruntime.BedrockRuntimeClient;
import software.amazon.awssdk.services.bedrockruntime.model.InvokeModelRequest;
import software.amazon.awssdk.services.bedrockruntime.model.InvokeModelResponse;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

@Singleton
public class TranslationService {

  private static final Logger logger = Logger.getLogger(TranslationService.class);
  private static final int THREAD_POOL_SIZE = 10;
  private static final int BATCH_TIMEOUT_SECONDS = 30;

  private final BedrockRuntimeClient client;
  private final String modelId;
  private final ConcurrentHashMap<String, String> cache = new ConcurrentHashMap<>();
  private final ExecutorService executor = Executors.newFixedThreadPool(THREAD_POOL_SIZE);

  @Inject
  public TranslationService(final Properties properties) {
    final String accessKey = properties.getProperty("aws.accessKeyId", "");
    final String secretKey = properties.getProperty("aws.secretAccessKey", "");
    final String sessionToken = properties.getProperty("aws.sessionToken", "");
    final String region = properties.getProperty("aws.region", "us-east-1");
    this.modelId = properties.getProperty("aws.bedrock.modelId", "amazon.nova-micro-v1:0");

    final AwsCredentials credentials = (sessionToken != null && !sessionToken.trim().isEmpty())
        ? AwsSessionCredentials.create(accessKey, secretKey, sessionToken)
        : AwsBasicCredentials.create(accessKey, secretKey);

    this.client = BedrockRuntimeClient.builder()
        .region(Region.of(region))
        .credentialsProvider(StaticCredentialsProvider.create(credentials))
        .build();
  }

  public String translate(final String text, final String targetLang) {
    if (text == null || text.trim().isEmpty()) {
      return text;
    }
    final String cacheKey = targetLang + ":" + text;
    final String cached = cache.get(cacheKey);
    if (cached != null) {
      return cached;
    }
    try {
      final String translated = callBedrock(text, targetLang);
      cache.put(cacheKey, translated);
      return translated;
    } catch (final Exception e) {
      logger.warn("Translation failed, returning original: " + e.getMessage());
      return text;
    }
  }

  /**
   * Translates a list of texts in parallel. Returns results in the same order.
   * Falls back to the original text on error or timeout.
   */
  public List<String> translateBatch(final List<String> texts, final String targetLang) {
    final List<Future<String>> futures = new ArrayList<>(texts.size());
    for (final String text : texts) {
      final String t = text;
      futures.add(executor.submit(() -> translate(t, targetLang)));
    }
    final List<String> results = new ArrayList<>(texts.size());
    for (int i = 0; i < texts.size(); i++) {
      try {
        results.add(futures.get(i).get(BATCH_TIMEOUT_SECONDS, TimeUnit.SECONDS));
      } catch (final Exception e) {
        results.add(texts.get(i));
      }
    }
    return results;
  }

  @SuppressWarnings("unchecked")
  private String callBedrock(final String text, final String targetLang) throws Exception {
    final String prompt = "Translate the following text to pt-BR (Brazilian Portuguese). "
        + "Return ONLY the translated text, nothing else:\n\n" + text;

    // Amazon Nova messages format
    final JSONObject contentItem = new JSONObject();
    contentItem.put("text", prompt);
    final JSONArray contentArray = new JSONArray();
    contentArray.add(contentItem);

    final JSONObject message = new JSONObject();
    message.put("role", "user");
    message.put("content", contentArray);

    final JSONArray messages = new JSONArray();
    messages.add(message);

    final JSONObject inferenceConfig = new JSONObject();
    inferenceConfig.put("max_new_tokens", 512L);
    inferenceConfig.put("temperature", 0.0);

    final JSONObject requestBody = new JSONObject();
    requestBody.put("messages", messages);
    requestBody.put("inferenceConfig", inferenceConfig);

    final InvokeModelRequest request = InvokeModelRequest.builder()
        .modelId(modelId)
        .body(SdkBytes.fromUtf8String(requestBody.toJSONString()))
        .contentType("application/json")
        .accept("application/json")
        .build();

    final InvokeModelResponse response = client.invokeModel(request);
    final String responseBody = response.body().asUtf8String();

    final JSONParser parser = new JSONParser();
    final JSONObject responseJson = (JSONObject) parser.parse(responseBody);
    final JSONObject output = (JSONObject) responseJson.get("output");
    final JSONObject responseMessage = (JSONObject) output.get("message");
    final JSONArray content = (JSONArray) responseMessage.get("content");
    final JSONObject firstContent = (JSONObject) content.get(0);
    return ((String) firstContent.get("text")).trim();
  }
}
