import 'package:domus/src/screens/menu_page/components/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:domus/config/size_config.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //MenuListItem is custom tile in list_tile file
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        MenuListItems(
          iconPath: 'assets/icons/menu_icons/devices.svg',
          itemName: 'Devices',
          function: () {},
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        MenuListItems(
          iconPath: 'assets/icons/menu_icons/savings.svg',
          itemName: 'Savings',
          function: () {
          },
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        MenuListItems(
          iconPath: 'assets/icons/menu_icons/settings.svg',
          itemName: 'Settings',
          function: () {},
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        MenuListItems(
          iconPath: 'assets/icons/menu_icons/notifications.svg',
          itemName: 'Notification',
          function: () {},
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        MenuListItems(
          iconPath: 'assets/icons/menu_icons/faq.svg',
          itemName: 'FAQ',
          function: () {},
        ),
      ],
    );
  }
}
