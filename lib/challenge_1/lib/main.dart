import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Challenge1Page(title: 'Challenge 1 Page'),
    );
  }
}

class Challenge1Page extends StatelessWidget {
  final String title;

  const Challenge1Page({super.key, required this.title});

  // Challenge 1: chess board
  // Build a simple layout containing a chess board with 5x5 black/white cells,
  // each 50x50 sized

  // Useful widgets: Column, Row, Center, Padding, Container, Center
  //
  // For coloring the cells, use a container with:
  //            decoration: BoxDecoration(
  //                       border: Border.all(color: Colors.black),
  //                       color: Colors.black)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Container(),
    );
  }
}
