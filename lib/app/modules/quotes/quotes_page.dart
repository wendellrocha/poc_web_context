import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_web_context/app/modules/quotes/quotes_store.dart';
import 'package:flutter/material.dart';

class QuotesPage extends StatefulWidget {
  final String title;
  const QuotesPage({Key? key, this.title = 'QuotesPage'}) : super(key: key);
  @override
  QuotesPageState createState() => QuotesPageState();
}
class QuotesPageState extends State<QuotesPage> {
  final QuotesStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const <Widget>[],
      ),
    );
  }
}