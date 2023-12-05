import 'package:flutter/material.dart';
import 'package:regester/feature/Medicine_View/medicine_widget.dart';


class Result extends StatefulWidget {
  const Result({Key? key, required this.query}) : super(key: key);

  final String query;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List li = [];
  var m = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: li.isNotEmpty ? ListView.builder(
        itemCount: li.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const MedicineWidget();
        },
      ) : const Center(
        child: Text(
          'There isn\'t any result here',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
