import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp Markdown to Telegram Markdown',
      home: MyInput(),
    );
  }
}

// Define a custom Form widget.
class MyInput extends StatefulWidget {
  @override
  _MyInputState createState() => _MyInputState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyInputState extends State<MyInput> {
  bool isLoaded;

  @override
  void initState() {
    // TO DO: implement initState
    super.initState();
  }

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  convertToTelegram(text) {
    text = text.replaceAll('_', '__');
    text = text.replaceAll('*', '**');
    return text;
  }

  // This function is triggered when the copy icon is pressed
  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: myController2.text));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Copied to clipboard'),
      behavior: SnackBarBehavior.floating,
      width: 280,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tes action2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(children: <Widget>[
            TextField(
              controller: myController,
              keyboardType: TextInputType.multiline,
              maxLines: 7,
              onChanged: (value) =>
                  myController2.text = convertToTelegram(myController.text),
            ),
            TextField(
              controller: myController2,
              keyboardType: TextInputType.multiline,
              maxLines: 7,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _copyToClipboard,
                child: Text('Copy'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
