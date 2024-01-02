import 'package:flutter/material.dart';
import 'package:regester/feature/bill_view.dart';
import 'package:regester/feature/login/login_page.dart';
import 'package:regester/feature/myOrders/myorders_view.dart';
import 'package:regester/language.dart';
import 'package:http/http.dart' as http;

import '../../core/global/api.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool isEn = true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 100,
              decoration:
              BoxDecoration(color: Theme.of(context).primaryColor),
              child: Text(
                Language.isEn ? "Get Your Medicine" : "احصل على الادوية",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyOrdersView(),)) ;
              },
              child:  Row(
                children: [
                  const Icon(Icons.shopping_cart_rounded),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    Language.isEn ? "My Orders" :"طلباتي",
                    style: const TextStyle(color: Colors.black54, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BillView(),)) ;
              },
              child:  Row(
                children: [
                  const Icon(Icons.wrap_text),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    Language.isEn ? "Bill" :"التقرير",
                    style: const TextStyle(color: Colors.black54, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                await logout() ;
              },
              child: Row(
                children: [
                  const Icon(Icons.logout),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    Language.isEn ? "Log Out" : "تسجيل الخروج",
                    style: const TextStyle(color: Colors.black54, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            Text(
              Language.isEn ? "Change Language :" :"تغيير اللغة",
              style: const TextStyle(color: Colors.black54, fontSize: 18),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  Language.isEn ? "Arabic" : "العربية",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Switch(
                  value: isEn,
                  onChanged: (newLan) {
                    setState(() {
                      isEn = newLan ;
                    });
                    Language.isEn = isEn ;
                  },
                  inactiveTrackColor:
                  isEn
                      ? Colors.white
                      : Colors.grey,
                ),
                Text(
                  Language.isEn ? "English" : "الانجليزية",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future logout() async {
    var response = await http.get(
        Uri.parse('${Api.api}/users/logout') ,
        headers: {
          'Accept': 'application/json',
          'Authorization' : 'Bearer ${Api.token}' ,
        }
    ) ;
    print(response.body) ;
    if(response.statusCode == 200) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login(),)) ;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('logout succesfully')));
      return response.body ;
    }
  }
}
