import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserInputMobile extends StatefulWidget {
  const UserInputMobile({key}) : super(key: key);

  @override
  _UserInputMobileState createState() => _UserInputMobileState();
}

class _UserInputMobileState extends State<UserInputMobile> {
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController2.dispose();
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
      behavior: SnackBarBehavior.fixed,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Whatsapp',
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          controller: myController,
          keyboardType: TextInputType.multiline,
          maxLines: 10,
          onChanged: (value) =>
              myController2.text = convertToTelegram(myController.text),
        ),
        SizedBox(height: 60),
        TextField(
          decoration: InputDecoration(
            labelText: 'Telegram',
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          controller: myController2,
          keyboardType: TextInputType.multiline,
          maxLines: 10,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _copyToClipboard,
          child: Text('Copy'),
        ),
      ],
    );
  }
}
