import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/global/api.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                return const CircularProgressIndicator() ;
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
                              onPressed: () {
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
                              image: AssetImage("assets/image/hart.jpg"),
                            )
                          ),
                        ),
                        const SizedBox(height: 39),
                        Row(
                          children: [
                            Text(
                              "scientific name : ",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18 ,
                                fontWeight: FontWeight.w500,
                              ),
                            ) ,
                            Text(
                              med['Generic Name'],
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
                              "commercial name: ",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18 ,
                                fontWeight: FontWeight.w500,
                              ),
                            ) ,
                            Text(
                              med['Brand Name'],
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
                              "manufacture company: ",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18 ,
                                fontWeight: FontWeight.w500,
                              ),
                            ) ,
                            Text(
                              med['Manufacturer Name'],
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
                              "Expiration date : ",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18 ,
                                fontWeight: FontWeight.w500,
                              ),
                            ) ,
                            Text(
                              med['Expiry Date'],
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
                              "Price : ",
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
                        const SizedBox(height: 240),
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
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    "Add To Cart" ,
                                    style: TextStyle(
                                      color: Colors.white ,
                                      fontSize: 18 ,
                                      fontWeight: FontWeight.w500,
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

