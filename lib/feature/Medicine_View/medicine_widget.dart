import 'package:flutter/material.dart';

import '../Details_View/details_view.dart';

class MedicineWidget extends StatelessWidget {
  const MedicineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DetailsView(),));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
              color: Theme.of(context).primaryColor),
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/image/hart.jpg",width: 110,),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Azilsartan",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Aphamia",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "1500 S.P",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
