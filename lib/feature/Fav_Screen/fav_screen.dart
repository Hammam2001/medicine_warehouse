import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:regester/feature/Medicine_View/medicine_widget.dart';

import 'package:http/http.dart' as http;
import '../../core/global/api.dart';
import '../first_screen/widget/first_app_bar.dart';

class FavScreen extends StatelessWidget {
  FavScreen({Key? key}) : super(key: key);

  var favv ;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Column(
            children: [
              const FirstAppBar(),
              FutureBuilder(
                future: getFav(),
                builder: (context, snapshot)  {
                  if(snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  }
                  return Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Favorites",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: favv.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return const MedicineWidget(id: 1, name1: 'paracetamol', name2: 'dsa', price: '500');
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }

  Future getFav() async {
    var response = await http.get(
      Uri.parse('${Api.api}/favourites/getAll'),
      headers : {
        'Accept' : 'application/json' ,
        'Authorization' : 'Bearer ${Api.token}' ,
      } ,
    ) ;
    print(response.body) ;
    if(response.statusCode == 200 ) {
      var map = jsonDecode(response.body) ;
      favv = map['favourites'] ;
      return response.body ;
    }
  }
}
