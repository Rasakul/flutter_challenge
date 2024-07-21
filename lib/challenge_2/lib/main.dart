import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Challenge2Page(title: 'Challenge 2 Page'),
    );
  }
}

// Challenge 2: dynamic contact list
// Use the array of contacts to display within a list and a FloatingActionButton
// to add new entries to the list. Usa setState to reload the list and show the
// new contact
//
// Useful widgets: ListView.builder, ListTile, Column, Row, Center, Padding,
// Container, Center, FloatingActionButton, Image
//
// For showing images from the network, use Image.network("url") or NetworkImage("url").
// For usage of FloatingActionButton see the example.
// https://docs.flutter.dev/cookbook/lists/long-lists
//
// Note: to display network images in a browser, you need an additional
// run argument "--web-renderer html"
//
// Additional challenge: extent the Contact class by firstName, lastName,
// phone number and email address.
// Then add trailing icons for email & phone icons to email/call the contact.
// Use IconButton:
// IconButton(
//           icon: const Icon(Icons.email),
//           onPressed: () => launchUrlString("tel://21213123123"),
//         )

class Challenge2Page extends StatefulWidget {
  final String title;

  const Challenge2Page({super.key, required this.title});

  @override
  State<Challenge2Page> createState() => _Challenge2PageState();
}

class _Challenge2PageState extends State<Challenge2Page> {
  final contacts = [
    Contact("Kermit", "https://avatar.iran.liara.run/public"),
    Contact("Piggy", "https://avatar.iran.liara.run/public"),
    Contact("Fozzie", "https://avatar.iran.liara.run/public"),
    Contact("Gonzo", "https://avatar.iran.liara.run/public"),
    Contact("Rowlf", "https://avatar.iran.liara.run/public"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(),
    );
  }
}

class Contact {
  final String name;
  final String profileUrl;

  Contact(this.name, this.profileUrl);
}
