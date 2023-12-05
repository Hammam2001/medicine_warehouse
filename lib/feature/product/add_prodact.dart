import 'package:flutter/material.dart';
import 'package:regester/feature/login/login_page.dart';
class Model{
  final String name;
   final Image  image;

  Model(this.image,this.name);
}
class Lecture extends StatelessWidget {
  const Lecture({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: ListView.separated(
          itemBuilder: (context,index)=>item(context),
          separatorBuilder: (context,index)=>const SizedBox(height: 10,),
          itemCount: 20),
    );
  }
}


Widget item(context) => Row(
  children: [
    Image.asset('assets/image/phone.jpeg',fit: BoxFit.fill,width: 200,),
    SizedBox(width: 20,),
    TextButton( onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>Login())); }, child: Text('Iphone 12')),
  ],
);