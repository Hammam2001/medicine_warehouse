import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/global/api.dart';
import '../../language.dart';
import '../Details_View/medicine_widget2.dart';

class OrderView extends StatelessWidget {
  OrderView({Key? key, required this.id}) : super(key: key);

  final int id ;

  var ddd;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Language.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,color: Colors.white,),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(Language.isEn ? 'Orders' : "الطلبات" , style: const TextStyle(color: Colors.white ,fontSize: 20 , fontWeight: FontWeight.w400 ),),
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: getOrderDetails(),
            builder: (context, snapshot) {
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
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(padding: const EdgeInsets.all(10),alignment: Alignment.topRight,child: Text(Language.isEn ? 'the price is : ${ddd['full_price']} S.P' : 'سعره هو  : ${ddd['full_price']} ل . س',style: TextStyle(color: Theme.of(context).primaryColor , fontSize: 18 , fontWeight: FontWeight.bold),)) ,
                    ListView.builder(
                      itemCount: ddd['order_items'].length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var i = ddd['order_items'][index] ;
                        return MedicineWidget2(id: i['id'], name1: i['brand_name'], name2: i['generic_name'], price: i['price'].toString(), quantity: i['quantity']);
                      },
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }

  Future getOrderDetails() async {
    var response = await http.get(
        Uri.parse('${Api.api}/orders/getDetails/$id') ,
        headers: {
          'Accept': 'application/json',
          'Authorization' : 'Bearer ${Api.token}' ,
        }
    ) ;
    print(response.body) ;
    if(response.statusCode == 200) {
      ddd = jsonDecode(response.body)['order'] ;
      return response.body ;
    }
  }
}
