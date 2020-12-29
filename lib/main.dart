import 'package:basic_modal_indicators/animated-modal.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motionheim Animations',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        brightness: Brightness.dark
      ),
      home: MyHomePage(title: 'Basic Modal Indicators')
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              child: Text('Show Error Dialog'),
              onPressed: _showErrorDialog,
            ),
            OutlinedButton(
              child: Text('Show Information Dialog'),
              onPressed: _showInformationDialog,
            ),
            OutlinedButton(
              child: Text('Show Success Dialog'),
              onPressed: _showSuccessDialog,
            )
          ]
        )
      )
    );
  }

  _showErrorDialog() {
    showDialog(
      context: context,
      builder: (ctxt) {
        return AnimatedModal(
          animType: 'Error'
        );
      }
    );
  }

  _showInformationDialog() {
    showDialog(
      context: context,
      builder: (ctxt) {
        return AnimatedModal(
          animType: 'Information'
        );
      }
    );
  }

  _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (ctxt) {
        return AnimatedModal(
          animType: 'Success'
        );
      }
    );
  }

}