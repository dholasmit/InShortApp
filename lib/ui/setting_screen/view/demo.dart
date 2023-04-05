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
              print(value);
              Navigator.pushNamed(context, value.toString());
            }, itemBuilder: (BuildContext bc) {
              return const [
                PopupMenuItem(
                  child: Text("Hello"),
                  value: 'hello',
                ),
                PopupMenuItem(
                  child: Text("About"),
                  value: 'about',
                ),
                PopupMenuItem(
                  child: Text("Contact"),
                  value: 'contact',
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
