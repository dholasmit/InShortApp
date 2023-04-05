import 'package:flutter/material.dart';

class GifScreen extends StatefulWidget {
  const GifScreen({Key? key}) : super(key: key);

  @override
  State<GifScreen> createState() => _GifScreenState();
}

class _GifScreenState extends State<GifScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://media.tenor.com/FIlAXMHf8vsAAAAd/naruto-background.gif",
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
