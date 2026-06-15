package net.socialgamer.cah.data;

public class TranslatedWhiteCard extends WhiteCard {

  private final WhiteCard original;
  private final String translatedText;

  public TranslatedWhiteCard(final WhiteCard original, final String translatedText) {
    this.original = original;
    this.translatedText = translatedText;
  }

  @Override
  public int getId() {
    return original.getId();
  }

  @Override
  public String getText() {
    return translatedText;
  }

  @Override
  public String getWatermark() {
    return original.getWatermark();
  }

  @Override
  public boolean isWriteIn() {
    return original.isWriteIn();
  }
}
