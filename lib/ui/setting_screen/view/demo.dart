import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  var selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("AppMaking.com"),
          centerTitle: true,
          actions: [
            PopupMenuButton(onSelected: (value) {
              // your logic
              setState(() {
                selectedItem = value.toString();
              });
              Navigator.pushNamed(context, value.toString());
            }, itemBuilder: (BuildContext bc) {
              return const [
                PopupMenuItem(
                  value: 'hello',
                  child: Text("Hello"),
                ),
                PopupMenuItem(
                  value: 'about',
                  child: Text("About"),
                ),
                PopupMenuItem(
                  value: 'contact',
                  child: Text("Contact"),
                )
              ];
            })
          ],
        ),
        body: Center(
          child: Text(selectedItem),
        ),
      ),
    );
  }
}
