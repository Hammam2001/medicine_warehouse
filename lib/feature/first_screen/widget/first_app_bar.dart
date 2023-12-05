import 'package:flutter/material.dart';

import '../../search_delegate/search_delegate.dart';

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
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: MySearchDelegate());
                },
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
