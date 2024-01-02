import 'package:flutter/material.dart';

import '../../Medicine_View/medicine_view.dart';

class CatWidget extends StatelessWidget {
  const CatWidget({Key? key, required this.name, required this.id, required this.index}) : super(key: key);

  final String name ;
  final int id ;
  final int index  ;


  @override
  Widget build(BuildContext context) {
    List image = [
      'assets/image/Analgesics.png' ,
      'assets/image/Antifungals.png' ,
      'assets/image/Antipyretics.png' ,
      'assets/image/Antiseptics.png' ,
      'assets/image/Antivirals.png' ,
      'assets/image/Bone-Health-Medications.png' ,
      'assets/image/Cardiovascular-Medications.png' ,
      'assets/image/Central-Nervous-System-(CNS)-Medications.png' ,
      'assets/image/Dermatological-Medications.png' ,
      'assets/image/Gastrointestinal-Medications.png' ,
      'assets/image/Genitourinary-Medications.png' ,
      'assets/image/Hormone.png' ,
      'assets/image/Immunosuppressants.png' ,
      'assets/image/Muscle-Relaxants.png' ,
      'assets/image/Ophthalmic-Medications.png' ,
      'assets/image/Psychotropic-Medications.png' ,
      'assets/image/Respiratory-Medications.png' ,
      'assets/image/Vaccines.png'
    ] ;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MedicineView(id: id,),));
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
            Image.asset(image[index],width: 110,),
            Text(
              name,
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
