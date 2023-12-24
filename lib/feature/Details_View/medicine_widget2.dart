import 'package:flutter/material.dart';

import 'details_view.dart';

class MedicineWidget2 extends StatefulWidget {
  const MedicineWidget2({Key? key, required this.id, required this.name1, required this.name2, required this.price, required this.quantity}) : super(key: key);

  final int id;
  final String name1;
  final String name2 ;
  final String price ;
  final int quantity ;

  @override
  State<MedicineWidget2> createState() => _MedicineWidget2State();
}

class _MedicineWidget2State extends State<MedicineWidget2> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsView(id: widget.id,),));
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
            Image.asset("assets/image/121.jpg",width: 110,),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.name2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${widget.price} S.P',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
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
                      widget.quantity.toString(),
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
          ],
        ),
      ),
    );
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