import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'Models/FQuotesModel.dart';
class FQuotes extends StatefulWidget {
  const FQuotes({super.key});

  @override
  State<FQuotes> createState() => _FQuotesState();
}




class _FQuotesState extends State<FQuotes> {
@override
// Type of List is FQUOTESMODEL
List<FQuotesModel> QUOTLIST = [];
Future <List<FQuotesModel>> getQuotes() async{
setState(() {

});

  final response  =await http.get(Uri.parse("https://zenquotes.io/api/quotes"));

  var data  =jsonDecode(response.body.toString());

  if(response.statusCode == 200){

    QUOTLIST.clear();
    for(Map i in data){

      QUOTLIST.add(FQuotesModel.fromJson(i));
    }

    return QUOTLIST;

  }else
  {
    return QUOTLIST;
  }



}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Colors.black,
        onRefresh:()async{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Refreshed")));
          setState(() {

          });
        },
        child: Column(
          children: [

            Expanded(
              child: FutureBuilder(
                future: getQuotes() ,
                builder: (context, snapshot) {

                  return ListView.builder(
                    itemCount: QUOTLIST.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child:Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ListTile(
                                title: Text(QUOTLIST[index].q.toString()),
                                subtitle: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Text("Author Name:" + QUOTLIST[index].a.toString()),
                                ),
                                onTap: (){
                                  // copying the data
                                  Clipboard.setData(ClipboardData(text:  QUOTLIST[index].q.toString()));

                                  ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text("Text Copied")));
                                },
                                trailing: Icon(Icons.copy),
                                leading: Image.network("https://res.cloudinary.com/dghloo9lv/image/upload/v1687444253/quill-drawing-a-line_n6svbe.png"),
                              ),



                            ],
                          )
                        )
                      );


                  },);


              },),
            )

          ],
        ),
      ),
    );
  }
}
