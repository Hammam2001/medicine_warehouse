import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'package:regester/feature/first_screen/widget/cat_widget.dart';
import 'package:regester/feature/first_screen/widget/first_app_bar.dart';

import '../../core/global/api.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

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
                future: getCat(),
                builder: (context, snapshot) {
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
                        "Categories",
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
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 10,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 20,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const CatWidget();
                          },
                        ),
                      ),
                    ],
                  ),
                );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future getCat() async {
    var response = await http.post(
      Uri.parse('${Api.api}/categories/getAll'),
      headers : {
        'Accept' : 'application/json' ,
      } ,
    ) ;
    if(response.statusCode == 200 ) {
      return response.body ;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('error occured'),));
    }

  }
}
