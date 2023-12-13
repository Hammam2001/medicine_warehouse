import 'package:flutter/material.dart';
import 'package:regester/feature/login/login_page.dart';

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
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login(),)) ;
              },
              child: Row(
                children: const [
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
