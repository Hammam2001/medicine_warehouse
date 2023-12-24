import 'package:flutter/material.dart';
import 'package:regester/feature/login/login_page.dart';
import 'package:regester/feature/myOrders/myorders_view.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool isEn = false ;

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
              child: const Text(
                "Get Your Medicine",
                style: TextStyle(
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
              child: const Row(
                children: [
                  Icon(Icons.shopping_cart_rounded),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "My Orders",
                    style: TextStyle(color: Colors.black54, fontSize: 18),
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
              child: const Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Log Out",
                    style: TextStyle(color: Colors.black54, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            const Text(
              "Change Language :",
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Arabic" ,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Switch(
                  value: isEn,
                  onChanged: (newLan) {
                    setState(() {
                      isEn = !isEn ;
                    });
                  },
                  inactiveTrackColor:
                  isEn
                      ? Colors.white
                      : Colors.grey,
                ),
                Text(
                  "English",
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
