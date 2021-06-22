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

  addFontSize(int size) {
    this.fontSize = this.fontSize + size;
  }

  reduceFontSize(int size) {
    this.fontSize < 6
        ? this.fontSize = 1.0
        : this.fontSize = this.fontSize - size;
  }

  getFontSize() {
    return this.fontSize;
  }

  addSpeedText(int speed) {
    this.speedText = this.speedText + speed;
  }

  reduceSpeedText(int speed) {
    this.speedText < 6
        ? this.speedText = 1
        : this.speedText = this.speedText - speed;
  }

  getSpeedText() {
    //return this.speedText < 1 ? 1 : this.speedText;
    return this.speedText;
  }

  getDuration() {
    this.duration = (this.scrollController.position.maxScrollExtent.round() -
            this.scrollController.position.pixels.round() +
            1) ~/
        getSpeedText();
    return this.duration < 1 ? 1 : this.duration;
  }

  scrollText() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: Duration(seconds: getDuration()), curve: Curves.linear);
  }

  getScrollController() {
    return this.scrollController;
  }
}
