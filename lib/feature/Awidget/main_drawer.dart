import 'package:flutter/material.dart';
import 'package:regester/feature/login/login_page.dart';
import 'package:regester/feature/myOrders/myorders_view.dart';
import 'package:regester/language.dart';

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
                Language.isEn ? "Get Your Medicine" : "احصل على ادوئتك",
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
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login(),)) ;
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
}
