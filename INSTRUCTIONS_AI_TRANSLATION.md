# Instruções para Implementação de Tradução com IA (AWS Bedrock)

Este documento descreve os passos necessários para implementar a tradução automática de cartas no projeto **PretendYoureXyzzy** utilizando o AWS Bedrock. O objetivo é que cada sessão tenha uma mistura dinâmica de ~50% de cartas em Português e 50% em Inglês.

---

## Passo 1: Configuração de Dependências

Adicione as dependências do AWS SDK ao seu arquivo `pom.xml`:

```xml
<dependency>
  <groupId>software.amazon.awssdk</groupId>
  <artifactId>bedrockruntime</artifactId>
  <version>2.25.10</version>
</dependency>
```

---

## Passo 2: Configuração de Credenciais

No arquivo de propriedades do projeto (ex: `build.properties`), adicione as chaves de acesso da AWS:

```properties
aws.accessKeyId=YOUR_ACCESS_KEY
aws.secretAccessKey=YOUR_SECRET_KEY
aws.region=us-east-1
aws.bedrock.modelId=amazon.titan-text-express-v1
```

---

## Passo 3: Implementação do Serviço de Tradução

Crie a classe `TranslationService.java` para gerenciar as chamadas ao Bedrock e o cache de traduções.

```java
package net.socialgamer.cah.util;

import software.amazon.awssdk.services.bedrockruntime.BedrockRuntimeClient;
import java.util.concurrent.ConcurrentHashMap;

public class TranslationService {
    private final BedrockRuntimeClient client;
    private final ConcurrentHashMap<String, String> cache = new ConcurrentHashMap<>();

    public TranslationService(BedrockRuntimeClient client) {
        this.client = client;
    }

    public String translate(String text, String targetLang) {
        if (cache.containsKey(text)) return cache.get(text);
        
        // Lógica de chamada ao AWS Bedrock para traduzir 'text' para 'targetLang'
        // ...
        
        String translated = callBedrock(text, targetLang);
        cache.put(text, translated);
        return translated;
    }
}
```

---

## Passo 4: Criação de Decoradores de Cartas

Para evitar alterar as cartas originais no banco de dados, utilize o padrão *Decorator* para as sessões de jogo.

Crie `TranslatedWhiteCard.java` em `src/main/java/net/socialgamer/cah/data/`:

```java
package net.socialgamer.cah.data;

public class TranslatedWhiteCard extends WhiteCard {
    private final WhiteCard original;
    private final String translatedText;

    public TranslatedWhiteCard(WhiteCard original, String translatedText) {
        this.original = original;
        this.translatedText = translatedText;
    }

    @Override public String getText() { return translatedText; }
    @Override public int getId() { return original.getId(); }
    @Override public String getWatermark() { return original.getWatermark(); }
    @Override public boolean isWriteIn() { return original.isWriteIn(); }
}
```

(Repita o mesmo padrão para `TranslatedBlackCard`).

---

## Passo 5: Integração na Lógica do Jogo

No método `start()` da classe `Game.java`, adicione a lógica de escolha aleatória e tradução:

1. **Seleção de Cartas**: Após carregar os `cardSets`, percorra as cartas.
2. **Sorteio**: Use `Math.random() < 0.5` para decidir se a carta será traduzida.
3. **Substituição**: Substitua o objeto original do deck pela sua versão traduzida.

Exemplo conceitual em `Game.start()` (dentro de `PretendYoureXyzzy/src/main/java/net/socialgamer/cah/data/Game.java`):

```java
List<WhiteCard> allWhiteCards = ...;
List<WhiteCard> processedWhiteCards = new ArrayList<>();

for (WhiteCard card : allWhiteCards) {
    if (Math.random() < 0.5) {
        String translated = translationService.translate(card.getText(), "pt");
        processedWhiteCards.add(new TranslatedWhiteCard(card, translated));
    } else {
        processedWhiteCards.add(card);
    }
}
// Use processedWhiteCards para criar o WhiteDeck
```

---

## Passo 6: Persistência de Cache (Opcional, mas Recomendado)

Para economizar em custos de API e reduzir a latência, salve o cache de traduções em uma tabela no banco de dados `pyx.sqlite` ou em um arquivo JSON local.

---

## Passo 7: Verificação

1. Inicie o servidor e crie uma partida.
2. Verifique se aproximadamente metade das cartas na sua mão estão em Português.
3. Inicie outra partida e confirme que as cartas traduzidas são diferentes da partida anterior.
