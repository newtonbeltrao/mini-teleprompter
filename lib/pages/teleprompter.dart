import 'package:flutter/material.dart';
import 'package:mini_teleprompter/controllers/teleprompter_controller.dart';

class TelePrompter extends StatefulWidget {
  final text;

  TelePrompter({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  _TelePrompter createState() => _TelePrompter();
}

class _TelePrompter extends State<TelePrompter> {
  TeleprompterController teleprompter;

  @override
  void initState() {
    super.initState();
    teleprompter = new TeleprompterController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  sizedBox() {
    return SizedBox(
      height: 200,
    );
  }

  void debug() {
    print(teleprompter.getScrollController().position.maxScrollExtent);
    print(teleprompter.getScrollController().position.pixels.round());
    print(teleprompter.getFontSize());
    print(teleprompter.getSpeedText());
    print(teleprompter.getDuration());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFloatingActionButton(),
      bottomNavigationBar: buildBottomAppBar(),
    );
  }

  SafeArea buildBody() {
    return SafeArea(
      child: ListView(
        controller: teleprompter.getScrollController(),
        children: [
          sizedBox(),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              elevation: 0,
              child: Text(
                widget.text,
                style: TextStyle(fontSize: teleprompter.getFontSize()),
              ),
            ),
          ),
          sizedBox(),
        ],
      ),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.zoom_in),
            color: Colors.black,
            onPressed: () {
              setState(() {
                teleprompter.addFontSize();
                debug();
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.zoom_out_rounded),
            color: Colors.black,
            onPressed: () {
              setState(() {
                teleprompter.reduceFontSize();
                debug();
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.fast_rewind),
            color: Colors.black,
            onPressed: () {
              setState(() {
                teleprompter.reduceSpeedText();
                teleprompter.scrollText();
                debug();
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.fast_forward),
            color: Colors.black,
            onPressed: () {
              setState(() {
                teleprompter.addSpeedText();
                teleprompter.scrollText();
                debug();
              });
            },
          ),
        ],
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return new FloatingActionButton(
      mini: true,
      onPressed: () {
        setState(() {
          teleprompter.scrollText();
          debug();
        });
      },
      tooltip: 'Rolar texto',
      child: new Icon(Icons.play_arrow),
      backgroundColor: Colors.deepOrangeAccent,
    );
  }
}
