import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final String appTitle;

  const CartPage({@required this.appTitle}) : assert(appTitle != null);

  @override
  Widget build(BuildContext context) {
    print('CartPage [build]');
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
                      body: Center(child: Text(appTitle)),
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
