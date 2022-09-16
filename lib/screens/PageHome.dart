import 'package:flutter/material.dart';

import 'WebView.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(
              Icons.people_alt_rounded,
              color: Colors.white,
            ),
          )
        ],
        centerTitle: true,
        title: Image.asset(
          'assets/images/money.png',
          height: 30,
          fit: BoxFit.contain,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              onTap: () {

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Clicou."),
                ));
              },
              title: const Text('Item 1'),
            ),
            ListTile(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Clicou."),
                ));
              },
              title: const Text('Item 2'),
            ),
          ],
        ),
      ),
      body: PageWebView('https://google.com.br/'),
    );
  }
}
