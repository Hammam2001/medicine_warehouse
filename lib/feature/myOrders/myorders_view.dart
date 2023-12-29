import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:regester/core/global/api.dart';
import 'package:regester/feature/Details_View/medicine_widget2.dart';
import 'package:regester/feature/home_view/home_view.dart';
import 'package:regester/feature/myOrders/order_view.dart';

import '../../language.dart';

class MyOrdersView extends StatelessWidget {
  MyOrdersView({Key? key}) : super(key: key);

  var ddd ;
  var rrr;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Language.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,color: Colors.white,),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const HomeView();
            },)),
          ),
          centerTitle: true,
          title:  Text(Language.isEn ? 'My Orders' : "طلباتي" , style: const TextStyle(color: Colors.white ,fontSize: 20 , fontWeight: FontWeight.w400 ),),
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: getOrder(),
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
              return Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  child: ListView.builder(
                    itemCount: rrr.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: ()  {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderView(id: rrr[index]['order_number']),));
                        },
                        shape: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54.withOpacity(0.09))),
                        leading: Text(rrr[index]['order_number'].toString() , style: TextStyle(color: Theme.of(context).primaryColor , fontWeight: FontWeight.bold , fontSize: 20),),
                        title: Text(rrr[index]['date'] , style: TextStyle(color: Theme.of(context).primaryColor),),
                        subtitle: Row(
                          children: [
                            Text(rrr[index]['order_Status'] , style: const TextStyle(color: Colors.black , fontSize: 16 , fontWeight: FontWeight.w500),),
                            const SizedBox(width: 20) ,
                            Text(rrr[index]['payment_status'] , style: const TextStyle(color: Colors.black54 , fontSize: 16 , fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ) ;
                    },
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }

  Future getOrder() async {
    var response = await http.get(
      Uri.parse('${Api.api}/orders/show') ,
      headers: {
        'Accept': 'application/json',
        'Authorization' : 'Bearer ${Api.token}' ,
      }
    ) ;
    print(response.body) ;
    if(response.statusCode == 200) {
      rrr = jsonDecode(response.body)['orders'] ;
      return response.body ;
    }
  }

  Future getOrderDetails(int id) async {
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
