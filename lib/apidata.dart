import 'dart:convert';

import 'package:api_practise_flutter/Models/qtend.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart ';

import 'Models/post.dart';

class APIROOM extends StatefulWidget {


  const APIROOM({super.key});

  @override
  State<APIROOM> createState() => _APIROOMState();
}

class _APIROOMState extends State<APIROOM> {

  var Quote;
  var author;


  List<Qtend> quotelist = [];

  Future getQuotes()async{
    // https://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en
    final response = await http.get(Uri.parse("https://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en"));
    var data  = jsonDecode(response.body.toString());
    final jsonData = json.decode(response.body);

    if(response.statusCode == 200){
      Quote = jsonData['quoteText'];
      author = jsonData['quoteAuthor'];
      print(data);
      print("Only Quote is ");
      print("$Quote");
      print("Author name : $author");

setState(() {

});


      return 0;


    }else{

      return 0;

    }

  }


  // init
   @override
  void initState() {
     super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [

          Text("$Quote"),
          Text("$author"),

          ElevatedButton(onPressed: (){
            setState(() {
              getQuotes();

            });
          }, child: Text("Next"))
          // Expanded(
          //   child: FutureBuilder(
          //     future: getQuotes(),
          //     builder: (context, snapshot) {
          //
          //       if(snapshot.hasData){
          //
          //         return Text(quotelist[0].quoteText.toString());
          //
          //
          //       }else{
          //
          //         return Text("No Data");              }
          //   },),
          // )

        ],),
      ),
    );
  }
}
