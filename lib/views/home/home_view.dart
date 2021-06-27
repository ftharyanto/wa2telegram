import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _HomeViewState extends State<HomeView> {
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
    text = text.replaceAll('~', '~~');
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
        title: Center(child: Text('WhatsApp Markdown to Telegram Markdown')),
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(300, 50, 300, 0),
        child: Center(
          child: Column(
            children: <Widget>[
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
              Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: InkWell(
                  child: Text('Source Code'),
                  onTap: () =>
                      launch('https://github.com/ftharyanto/wa2telegram'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
