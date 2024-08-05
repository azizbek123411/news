import 'package:flutter/material.dart';
class SavedNewsPage extends StatefulWidget {
  const SavedNewsPage({super.key});

  @override
  State<SavedNewsPage> createState() => _SavedNewsPageState();
}

class _SavedNewsPageState extends State<SavedNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Saved news page'),
      ),
    );
  }
}
