import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
    Contact("Kermit", "the Frog", "+43660123456", "test@test.com",
        "https://avatar.iran.liara.run/public"),
    Contact("Miss", "Piggy", "+43660123456", "test@test.com",
        "https://avatar.iran.liara.run/public"),
    Contact("Fozzie", "Bear", "+43660123456", "test@test.com",
        "https://avatar.iran.liara.run/public"),
    Contact("Gonzo", "the Great", "+43660123456", "test@test.com",
        "https://avatar.iran.liara.run/public"),
    Contact("Rowlf", "the Dog", "+43660123456", "test@test.com",
        "https://avatar.iran.liara.run/public"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: contacts.length, itemBuilder: buildListItem),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addContact,
          child: const Icon(Icons.add),
        ));
  }

  void addContact() {
    setState(() {
      contacts.add(Contact("Test", "Test", "+43660123456", "test@test.com",
          "https://avatar.iran.liara.run/public"));
    });
  }

  Widget buildListItem(BuildContext context, int index) {
    final contact = contacts[index];
    return ListTile(
      title: Text("${contact.firstName} ${contact.lastName}"),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(contact.profileUrl),
      ),
      trailing: SizedBox(
        width: 90,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.phone),
              onPressed: () => launchUrlString("tel://${contact.phone}"),
            ),
            IconButton(
              icon: const Icon(Icons.email),
              onPressed: () => launchUrlString("mailto://${contact.email}"),
            )
          ],
        ),
      ),
    );
  }
}

class Contact {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String profileUrl;

  Contact(
      this.firstName, this.lastName, this.phone, this.email, this.profileUrl);
}
