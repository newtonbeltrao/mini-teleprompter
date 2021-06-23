import 'package:flutter/material.dart';

class TeleprompterModel {
  double fontSize;
  int speedText;
  int duration;
  ScrollController scrollController;

  TeleprompterModel() {
    fontSize = this.fontSize;
    speedText = this.speedText;
    duration = this.duration;
    scrollController = this.scrollController;
  }

  getFontSize() {
    return this.fontSize;
  }

  setFontSize(double size) {
    this.fontSize = size;
  }

  getSpeedText() {
    return this.speedText;
  }

  setSpeedText(int speed) {
    this.speedText = speed;
  }

  getDuration() {
    this.duration = (this.scrollController.position.maxScrollExtent.round() -
            this.scrollController.position.pixels.round() +
            1) ~/
        getSpeedText();
    return this.duration < 1 ? 1 : this.duration;
  }

  getScrollController() {
    return this.scrollController;
  }
}
