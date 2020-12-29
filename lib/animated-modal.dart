import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:rive/rive.dart';

class AnimatedModal extends StatefulWidget {

  AnimatedModal({Key key, this.animType}) : super(key: key);

  final String animType;

  @override
  _AnimatedModalState createState() => _AnimatedModalState();
}

class _AnimatedModalState extends State<AnimatedModal> {

  Artboard _artboard;
  final fileName = 'assets/rive/status-feedback.riv';

  @override
  void initState() {
    _loadAnimation();
    super.initState();
  }

  void _loadAnimation() async{

    final bytes = await rootBundle.load(fileName);
    final file = RiveFile();

    if (file.import(bytes)) {
      setState(() {
        _artboard = file.artboardByName(widget.animType)
        ..addController(
          SimpleAnimation('Show')
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 250,
            height: 250,
            child: _artboard != null
              ? Rive(
                artboard: _artboard
              )
              : Container()
          ),
          Text(widget.animType)
        ],
      ),
      actions: <Widget>[
        OutlinedButton(
          child: Text('CLOSE'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ]
    );
  }
}