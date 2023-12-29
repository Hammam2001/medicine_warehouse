import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:regester/feature/Medicine_View/medicine_widget.dart';
import 'package:http/http.dart' as http;
import 'package:regester/feature/first_screen/widget/cat_widget.dart';

import '../../core/global/api.dart';


class Result extends StatefulWidget {
  const Result({Key? key, required this.query}) : super(key: key);

  final String query;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List li = [];
  var m = TextEditingController();

  List cat = [] ;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sd(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator() ;
        }
        if(cat.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: cat.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CatWidget(name: cat[index]['name'].toString(), id: cat[index]['id']) ;
              },
            ),
          ) ;
        }
        else if (li.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: li.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return MedicineWidget(id: li[index]['id'], name1: li[index]['generic_name'], name2: li[index]['brand_name'], price: li[index]['price'].toString(),);
              },
            ),
          ) ;
        }
        return const Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              'There isn\'t any result here',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
      }
    );
  }

  Future sd() async {
    await register() ;
    await ca() ;
  }

  Future register() async {
    var response = await http.post(
      Uri.parse('${Api.api}/medicines/search/name'),
      headers : {
        'Accept' : 'application/json' ,
      } ,
      body : {
        'name' : widget.query,
      } ,
    ) ;
    print(response.body);
    if(response.statusCode == 200 ) {
      li = jsonDecode(response.body)["medicines"] ;

      return response.body ;
    } else {
      print('error') ;
    }
  }

  Future ca() async {
    var response = await http.post(
      Uri.parse('${Api.api}/categories/search'),
      headers : {
        'Accept' : 'application/json' ,
      } ,
      body : {
        'name' : widget.query,
      } ,
    ) ;
    print(response.body);
    if(response.statusCode == 200 ) {
      cat = jsonDecode(response.body)["categories"] ;
      return response.body ;
    } else {
      print('error') ;
    }
  }
}

