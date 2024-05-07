import 'package:flutter/material.dart';

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
                ElevatedButton(onPressed: () {}, child: Text('Prompt')),
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
