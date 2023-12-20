import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:regester/feature/Medicine_View/medicine_app_bar.dart';
import 'package:regester/feature/Medicine_View/medicine_widget.dart';

import 'package:http/http.dart' as http;

import '../../core/global/api.dart';

class MedicineView extends StatefulWidget {
  const MedicineView({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<MedicineView> createState() => _MedicineViewState();
}

class _MedicineViewState extends State<MedicineView> {
  List par = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: FutureBuilder(
            future: getCat(),
            builder: (context, snapshot) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  children: [
                    const MedicineAppBar(),
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
                          SizedBox(
                            child: par.isNotEmpty
                                ? ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: par.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return MedicineWidget(
                                        id: par[index]['id'],
                                        name1: par[index]['Generic Name'],
                                        name2: par[index]['Brand Name'],
                                        price: par[index]['price'].toString(),
                                      );
                                    },
                                  )
                                : Column(
                                  children: [
                                    SizedBox(height: 350,) ,
                                    Container(
                                        alignment: Alignment.center,
                                        child: const Text(
                                          'This Category is Empty',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                  ],
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future getCat() async {
    var response = await http.get(
      Uri.parse('${Api.api}/medicines/show/${widget.id}'),
      headers: {
        'Accept': 'application/json',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      par = jsonDecode(response.body)['medicines'];
      print(par);
      return response.body;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('error occured'),
      ));
    }
  }
}
