import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  final String appTitle;

  const CatalogPage({@required this.appTitle}) : assert(appTitle != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Scaffold(
                      appBar: AppBar(title: Text(appTitle)),
                      body: Center(child: TextField()),
                    ),
                  ));
            },
            child: const Text('Push'),
          ),
          Text(appTitle),
        ],
      ),
    );
  }
}
