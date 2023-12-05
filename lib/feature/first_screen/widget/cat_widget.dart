import 'package:flutter/material.dart';

import '../../Medicine_View/medicine_view.dart';

class CatWidget extends StatelessWidget {
  const CatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MedicineView(),));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
              color: Theme.of(context).primaryColor),
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/image/hart.jpg",width: 110,),
            Text(
              "Heart Medicine",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
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
