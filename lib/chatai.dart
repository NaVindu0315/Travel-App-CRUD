import 'package:flutter/material.dart';
import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:travelapp/consts.dart';

class promptpage extends StatefulWidget {
  const promptpage({Key? key}) : super(key: key);

  @override
  State<promptpage> createState() => _promptpageState();
}

class _promptpageState extends State<promptpage> {
  String msg = "";
  Future<void> genprmpot() async {
    try {
      final model = await _createGenerativeModel();
      final content = [Content.text(promptmsg)];
      final response = await model.generateContent(content);
      if (response != null) {
        msg = response.text!;

        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          title: 'Success',
          text: '$msg',
          autoCloseDuration: const Duration(seconds: 8),
        );
        print(msg);
      } else {
        print('Error: Response is null');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<GenerativeModel> _createGenerativeModel() async {
    return GenerativeModel(model: 'gemini-pro', apiKey: apikey);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Spacer(),
            Row(
              children: [
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      //print('pal');
                      genprmpot();
                    },
                    child: Text('Prompt')),
                Spacer(),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
