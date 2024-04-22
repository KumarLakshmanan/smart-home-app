import 'package:domus/config/size_config.dart';
import 'package:domus/view/home_screen_view_model.dart';
import 'package:flutter/material.dart';

class CO2Container extends StatelessWidget {
  const CO2Container({Key? key, required this.model}) : super(key: key);

  final HomeScreenViewModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getProportionateScreenHeight(100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFFFFFFF),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(6),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/co2.png',
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(50),
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '400 ppm',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      'Baby\'s Room',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'CO2 Level',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 5,
          top: 5,
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      'CO2 Level Alert',
                      style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    content: const Text(
                      'The CO2 level in the baby\'s room is higher than the recommended level. Please open the windows to ventilate the room.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK', style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              height: getProportionateScreenHeight(30),
              width: getProportionateScreenWidth(30),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(60),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.notifications_active,
                color: Colors.red,
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
