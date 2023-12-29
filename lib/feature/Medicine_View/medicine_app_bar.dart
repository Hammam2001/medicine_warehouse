import 'package:flutter/material.dart';

import '../../language.dart';

class MedicineAppBar extends StatelessWidget {
  const MedicineAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
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
            const SizedBox(width: 100,),
            Text(
              Language.isEn ? "Medicines" :"الادوية",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
