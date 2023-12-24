import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:regester/core/global/cart.dart';
import 'package:regester/feature/Details_View/medicine_widget2.dart';

import '../../core/global/api.dart';
import '../Medicine_View/medicine_widget.dart';
import '../first_screen/widget/first_app_bar.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Column(
            children: [
              const FirstAppBar(),
              Container(
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
                      "Carts",
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
                        itemCount: Cart.product.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var m = Cart.product[index]['product'];
                          return MedicineWidget2(id: m['id'], name1: m['generic_name'], name2: m['brand_name'], price: m['price'].toString(), quantity: Cart.product[index]['quantity'],);
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        makeOrder();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor ,
                          borderRadius: BorderRadius.circular(25) ,
                        ),
                        child: const Text(
                          'Make an Order' ,
                          style: TextStyle(
                            fontSize: 18 ,
                            fontWeight: FontWeight.w500 ,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ) ,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future makeOrder() async {
    List<Map> ll = [] ;
    for(int i = 0 ;i < Cart.product.length ; i++) {
      var pp = Cart.product[i]['product'];
      ll.add({"id": pp['id'], "quantity":Cart.product[i]['quantity']}) ;
    }
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    'Authorization' : 'Bearer ${Api.token}' ,
    };
    var request = http.Request('POST', Uri.parse('${Api.api}/orders/add'));
    request.body = json.encode({
      "data" : ll ,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print('done');
      Cart.product.clear();
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }
}
