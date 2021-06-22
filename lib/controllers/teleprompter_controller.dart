import 'package:flutter/widgets.dart';
import 'package:mini_teleprompter/models/teleprompter_model.dart';

class TeleprompterController {
  TeleprompterModel teleprompter;

  TeleprompterController() {
    teleprompter = new TeleprompterModel();
    teleprompter.fontSize = 40;
    teleprompter.speedText = 50;
    teleprompter.duration = 10;
    teleprompter.scrollController = new ScrollController();
  }

  addFontSize() {
    return teleprompter.addFontSize(5);
  }

  reduceFontSize() {
    return teleprompter.reduceFontSize(5);
  }

  getFontSize() {
    return teleprompter.getFontSize();
  }

  addSpeedText() {
    return teleprompter.addSpeedText(5);
  }

  reduceSpeedText() {
    return teleprompter.reduceSpeedText(5);
  }

  getSpeedText() {
    return teleprompter.getSpeedText();
  }

  getDuration() {
    return teleprompter.getDuration();
  }

  scrollText() {
    return teleprompter.scrollText();
  }

  getScrollController() {
    return teleprompter.getScrollController();
  }
}
