import 'package:flutter/material.dart';
import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';

class promptpage extends StatefulWidget {
  const promptpage({Key? key}) : super(key: key);

  @override
  State<promptpage> createState() => _promptpageState();
}

class _promptpageState extends State<promptpage> {
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
                      print('pal');
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
