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
    double size = getFontSize() + 5;
    return teleprompter.setFontSize(size);
  }

  reduceFontSize() {
    double size = getFontSize();
    return size < 6
        ? teleprompter.setFontSize(1.0)
        : teleprompter.setFontSize(size - 5);
  }

  getFontSize() {
    return teleprompter.getFontSize();
  }

  addSpeedText() {
    int speed = getSpeedText() + 5;
    return teleprompter.setSpeedText(speed);
  }

  reduceSpeedText() {
    int speed = getSpeedText();
    speed < 6
        ? teleprompter.setSpeedText(1)
        : teleprompter.setSpeedText(speed - 5);
  }

  getSpeedText() {
    return teleprompter.getSpeedText();
  }

  getDuration() {
    return teleprompter.getDuration();
  }

  getScrollController() {
    return teleprompter.getScrollController();
  }

  scrollText() {
    ScrollController scroll = teleprompter.getScrollController();
    return scroll.animateTo(scroll.position.maxScrollExtent,
        duration: Duration(seconds: getDuration()), curve: Curves.linear);
  }
}
