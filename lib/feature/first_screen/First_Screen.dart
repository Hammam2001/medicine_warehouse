import 'package:flutter/material.dart';
import 'package:regester/feature/Medicine_View/medicine_view.dart';
import 'package:regester/feature/first_screen/widget/cat_widget.dart';
import 'package:regester/feature/first_screen/widget/first_app_bar.dart';

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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
