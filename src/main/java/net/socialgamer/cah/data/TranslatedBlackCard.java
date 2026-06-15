package net.socialgamer.cah.data;

public class TranslatedBlackCard extends BlackCard {

  private final BlackCard original;
  private final String translatedText;

  public TranslatedBlackCard(final BlackCard original, final String translatedText) {
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
  public int getDraw() {
    return original.getDraw();
  }

  @Override
  public int getPick() {
    return original.getPick();
  }
}
