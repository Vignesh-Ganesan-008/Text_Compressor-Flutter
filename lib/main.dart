import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int value = 0;
  static const List<DropdownMenuItem> items = [
    DropdownMenuItem(child: Text("Huffman"), value: 0),
    DropdownMenuItem(child: Text("Run-Length"), value: 1),
    DropdownMenuItem(child: Text("Variable-Length"), value: 2),
    DropdownMenuItem(child: Text("Lempel-Ziv-Welch"), value: 3),
    DropdownMenuItem(child: Text("Delta"), value: 4),
  ];

  TextEditingController input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Text Compressor",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text Compressor"),
        ),
        body: ListView(
          children: [
            Center(
              child: DropdownButton(
                  value: value,
                  items: items,
                  onChanged: (newvalue) {
                    setState(() {
                      value = newvalue;
                    });
                  }),
            ),
            TextField(
              controller: input,
              maxLines: 5,
              decoration: InputDecoration(labelText: "Enter text here:"),
              onChanged: (_) {
                setState(() {});
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0, bottom: 8),
              child: Center(
                child: Text(
                  "Coded Text",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Divider(
                height: 7,
                thickness: 5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Center(
                child: Text(
                  input.text,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
