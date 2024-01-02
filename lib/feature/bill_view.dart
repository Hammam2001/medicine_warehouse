import 'dart:convert';

import 'package:flutter/material.dart';

import '../core/global/api.dart';
import '../language.dart';
import 'home_view/home_view.dart';
import 'package:http/http.dart' as http;

class BillView extends StatelessWidget {
   BillView({Key? key}) : super(key: key);

  var rrr ;

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
          title:  Text(Language.isEn ? 'Bill' : "التقرير" , style: const TextStyle(color: Colors.white ,fontSize: 20 , fontWeight: FontWeight.w400 ),),
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
                if (rrr == null) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text ('no orders have done yet'),
                  );
                }
                return Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    child: ListView.builder(
                      itemCount: rrr.length,
                      itemBuilder: (context, index) {
                        return ListTile(
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
}
