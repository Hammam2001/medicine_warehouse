import 'package:flutter/material.dart';

class FirstAppBar extends StatelessWidget {
  const FirstAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 28,
                )),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: const [
            //     Text(
            //       "Get Your Medicine",
            //       style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 22,
            //           fontWeight: FontWeight.bold),
            //     ),
            //     Text(
            //       "All that you need",
            //       style: TextStyle(
            //         color: Colors.white70,
            //         fontSize: 16,
            //       ),
            //     ),
            //   ],
            // ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 28,
                )),
          ],
        ),
      ),
    );
  }
}
