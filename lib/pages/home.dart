import 'package:flutter/material.dart';
import 'package:mini_teleprompter/pages/teleprompter.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  String _text;
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.deepOrangeAccent,
      title: Text('Mini Teleprompter'),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                limparTexto();
              },
              child: Icon(
                Icons.replay,
              ),
            )),
      ],
    );
  }

  SafeArea buildBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
            child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                counterText: '${this._controller.text.length} caracteres',
                hintText: "Digite ou cole o texto aqui",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              controller: this._controller,
              minLines: 3,
              maxLines: null,
              //autofocus: true,
              onChanged: (text) => setState(() {
                _text = text;
              }),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        )),
      ),
    );
  }

  limparTexto() {
    setState(() {
      this._controller.clear();
      this._text = null;
    });
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        if (_text != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelePrompter(text: _text)),
          );
        }
      },
      icon: Icon(Icons.check_box_rounded),
      label: Text('Apresentar'),
      backgroundColor: Colors.deepOrangeAccent,
    );
  }
}
