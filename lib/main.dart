import 'package:api_practise_flutter/apidata.dart';
import 'package:flutter/material.dart';

import 'FQuotes.dart';

void main() {
  runApp(const MyApi());
}

class MyApi extends StatefulWidget {
  const MyApi({super.key});

  @override
  State<MyApi> createState() => _MyApiState();
}

class _MyApiState extends State<MyApi> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FQuotes(),
      ),
    );
  }
}
