import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:regester/core/global/cart.dart';
import '../../core/global/api.dart';
import '../../language.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({Key? key, required this.id}) : super(key: key);

  final int id ;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {

  int quantity = 1 ;
  bool fav = false ;

  var med ;
  var favv;

  @override
  void initState() {
    super.initState();
    getd() ;
  }

  getd() async {
    await getFav() ;
    fav = favv.any((product) {
      return widget.id == product['id'];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Language.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: FutureBuilder(
              future: getCat(),
              builder:(context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  ) ;
                }
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 28,
                                )),
                            IconButton(
                                onPressed: ()  {
                                  makeFav() ;
                                  setState(() {
                                    fav = !fav ;
                                  });
                                },
                                icon: Icon(
                                  fav ?  Icons.favorite : Icons.favorite_border,
                                  color: fav ? Colors.red : Colors.white,
                                  size: 28,
                                )),
                          ],
                        ),
                      ),
                    ),
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
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: const DecorationImage(
                                image: AssetImage("assets/image/121.jpg"),
                              )
                            ),
                          ),
                          const SizedBox(height: 39),
                          Row(
                            children: [
                              Text(
                                Language.isEn ?"scientific name : " : "الاسم العلمي : ",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18 ,
                                  fontWeight: FontWeight.w500,
                                ),
                              ) ,
                              Text(
                                med['generic_name'],
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18 ,
                                  fontWeight: FontWeight.w400,
                                ),
                              ) ,
                            ],
                          ) ,
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                Language.isEn ? "commercial name: " : "الاسم الصناعي : ",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18 ,
                                  fontWeight: FontWeight.w500,
                                ),
                              ) ,
                              Text(
                                med['brand_name'],
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18 ,
                                  fontWeight: FontWeight.w400,
                                ),
                              ) ,
                            ],
                          ) ,
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                Language.isEn ? "manufacture company: " : "الشركة المصنعة : ",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18 ,
                                  fontWeight: FontWeight.w500,
                                ),
                              ) ,
                              Text(
                                med['manufacturer_name'],
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18 ,
                                  fontWeight: FontWeight.w400,
                                ),
                              ) ,
                            ],
                          ) ,
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                Language.isEn ? "Expiration date : " : "تاريخ انتهاء الصلاحية : ",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18 ,
                                  fontWeight: FontWeight.w500,
                                ),
                              ) ,
                              Text(
                                med['expiry_date'],
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18 ,
                                  fontWeight: FontWeight.w400,
                                ),
                              ) ,
                            ],
                          ) ,
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                Language.isEn ?"Price : " :"السعر :",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18 ,
                                  fontWeight: FontWeight.w500,
                                ),
                              ) ,
                              Text(
                                "${med['price']} S.P",
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18 ,
                                  fontWeight: FontWeight.w400,
                                ),
                              ) ,
                            ],
                          ) ,
                          SizedBox(height: Language.isEn ? 235 : 180),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                margin: const EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                  color: Colors.black54.withOpacity(0.07),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Row(
                                  children: [
                                    buildButtons(Colors.white, Icons.remove, 1, Colors.black),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        '$quantity',
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    buildButtons(Colors.black, Icons.add, 2, Colors.white),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Cart.product.add({'product' : med , 'quantity' : quantity}) ;
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        Language.isEn ? "Add To Cart" :"اضافة الى االسلة",
                                        style: const TextStyle(
                                          color: Colors.white ,
                                          fontSize: 18 ,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ) ,
                        ],
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }

  Future getCat() async {
    var response = await http.get(
      Uri.parse('${Api.api}/medicines/get/${widget.id}'),
      headers: {
        'Accept': 'application/json',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      med = jsonDecode(response.body)['medicine'][0];
      print(med);
      return response.body;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('error occured'),
      ));
    }
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

  Future makeFav() async {
    if(!fav) {
      var response = await http.post(
        Uri.parse('${Api.api}/favourites/add'),
        headers : {
          'Accept' : 'application/json' ,
          'Authorization' : 'Bearer ${Api.token}' ,
        } ,
        body : {
          'medicine_id' : '${widget.id}',
        } ,
      ) ;
      print(response.body) ;
      if(response.statusCode == 200 ) {
        return response.body ;
      }
    } else {
      var response = await http.post(
        Uri.parse('${Api.api}/favourites/remove'),
        headers : {
          'Accept' : 'application/json' ,
          'Authorization' : 'Bearer ${Api.token}' ,
        } ,
        body : {
          'medicine_id' : '${widget.id}',
        } ,
      ) ;
      print(response.body) ;
      if(response.statusCode == 200 ) {
        return response.body ;
      }
    }
  }

  GestureDetector buildButtons(
      Color containerColor, IconData iconData, int check, Color iconColor) {
    return GestureDetector(
      onTap: () {
        onChanged(check);
      },
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: containerColor,
            border: Border.all(color: Colors.black)),
        child: Center(
            child: Icon(
              iconData,
              color: iconColor,
              size: 18,
            )),
      ),
    );
  }

  onChanged (int check) {
    setState(() {
      if (check == 1) {
        quantity = quantity > 1 ? quantity - 1 : quantity = 1;
      } else {
        quantity = quantity + 1;
      }
    });
  }
}

