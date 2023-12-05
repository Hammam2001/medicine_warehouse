import 'package:flutter/material.dart';
import 'package:regester/feature/Medicine_View/medicine_app_bar.dart';
import 'package:regester/feature/Medicine_View/medicine_widget.dart';

import '../first_screen/widget/cat_widget.dart';

class MedicineView extends StatelessWidget {
  const MedicineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              children: [
                const MedicineAppBar() ,
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
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 20,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const MedicineWidget();
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
      ),
    );
  }
}
