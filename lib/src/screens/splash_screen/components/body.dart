import 'package:domus/config/size_config.dart';
import 'package:domus/src/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF464646),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Material(
            color: Colors.transparent,
            child: Image.asset('assets/images/splash_img.png'),
          ),
          Text(
            'Sweet & Smart Home',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Colors.white,
                ),
          ),
          Text(
            'Smart Home can change\nway you live in the future',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: const Color(0xFFBDBDBD),
                ),
          ),
          ElevatedButton(
            onPressed: () {
	            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(70),
                vertical: getProportionateScreenHeight(15),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // <-- Radius
              ),
            ),
            child: Text(
              'Get Started',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          )
        ],
      ),
    );
  }
}
