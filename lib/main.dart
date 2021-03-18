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
    DropdownMenuItem(child: Text("Lempel-Ziv-Welch"), value: 2),
    DropdownMenuItem(child: Text("Delta"), value: 3),
  ];

  TextEditingController input = TextEditingController();

  String codedText = "";
  // ignore: non_constant_identifier_names
  void RunLength() {
    String str = input.text;
    int n = str.length;
    codedText = "";
    for (int i = 0; i < n; i++) {
      int count = 1;
      while (i < n - 1 && str[i] == str[i + 1]) {
        count++;
        i++;
      }
      //print(str[i] + "" + count.toString());
      codedText += str[i] + "" + count.toString();
    }
  }

  void chooser() {
    if (value == 0) {
    } else if (value == 1) {
      RunLength();
    } else if (value == 2) {
    } else if (value == 3) {}
  }

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
                setState(() {
                  chooser();
                });
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
                  codedText,
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
