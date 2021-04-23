import 'package:flutter/material.dart';
import 'package:qrcode_scanner/app/constants/dimensions.dart';

class MenuContent extends StatelessWidget {
  const MenuContent({@required this.menuItems});

  final List menuItems;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: Dimensions.ITEM_INDENT),
          Text(
            'Menu',
            style: Theme.of(context).textTheme.headline4.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: Dimensions.ITEM_INDENT),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: menuItems.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 0.1,
              );
            },
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(menuItems[index]['title']),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                ),
                onTap: menuItems[index]['onTap'],
              );
            },
          ),
          const Divider(
            height: 0.1,
          ),
        ],
      ),
    );
  }
}
