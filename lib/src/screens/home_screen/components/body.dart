import 'package:carousel_slider/carousel_slider.dart';
import 'package:domus/config/size_config.dart';
import 'package:domus/constant/constant.dart';
import 'package:domus/src/screens/home_screen/components/camera_widget.dart';
import 'package:domus/src/screens/home_screen/components/co2_container.dart';
import 'package:domus/src/screens/home_screen/components/particulate_container.dart';
import 'package:domus/src/screens/home_screen/components/savings_container.dart';
import 'package:domus/src/screens/home_screen/components/temperature_container.dart';
import 'package:domus/src/screens/smart_ac/smart_ac.dart';
import 'package:domus/src/screens/smart_fan/smart_fan.dart';
import 'package:domus/src/screens/smart_light/smart_light.dart';
import 'package:domus/src/screens/smart_speaker/smart_speaker.dart';
import 'package:domus/view/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'dark_container.dart';

class Body extends StatefulWidget {
  final HomeScreenViewModel model;
  const Body({Key? key, required this.model}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(7),
          vertical: getProportionateScreenHeight(7),
        ),
        decoration: const BoxDecoration(
          color: Color(0xFFF2F2F2),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.5,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: MediaQuery.of(context).size.height / 3.5 / 100,
                  enlargeCenterPage: true,
                  disableCenter: true,
                  autoPlayInterval: const Duration(seconds: 7),
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentSlide = index;
                    });
                  },
                ),
                itemCount: 3,
                itemBuilder: (context, index, _) {
                  if (index == 0) {
                    return TemperatureContainer(model: widget.model);
                  } else if (index == 1) {
                    return CO2Container(model: widget.model);
                  } else {
                    return ParticulateContainer(model: widget.model);
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(5)),
              child: SavingsContainer(model: widget.model),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: double.infinity,),
                Text(
                  'Baby\'s Health Stats',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(5)),
              child: Row(
                children: [
                  MainBoxes(
                    image: 'assets/images/oxygen-saturation.png',
                    title: "99%",
                    subtitle: 'Oxygen Saturation',
                    onTap: () {},
                    color: const Color(0xFFF2982A),
                  ),
                  const SizedBox(width: 10),
                  MainBoxes(
                    image: 'assets/images/heart-rate.png',
                    title: "60-80 bpm",
                    subtitle: 'Heart Rate',
                    onTap: () {},
                    color: const Color(0xFF9C4AD3),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                MainBoxes(
                  image: 'assets/images/lungs.png',
                  title: "12-20 bpm",
                  subtitle: 'Breathing Rate',
                  onTap: () {},
                  color: const Color(0xFF3CA899),
                ),
                const SizedBox(width: 10),
                MainBoxes(
                  image: 'assets/images/body.png',
                  title: "36.5°C",
                  subtitle: 'Baby Temperature',
                  onTap: () {},
                  color: const Color(0xFFEE7214),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: DarkContainer(
                      itsOn: widget.model.isLightOn,
                      switchButton: widget.model.lightSwitch,
                      onTap: () {
                        Navigator.of(context).pushNamed(SmartLight.routeName);
                      },
                      iconAsset: 'assets/icons/svg/light.svg',
                      device: 'Lightening',
                      deviceCount: '4 lamps',
                      switchFav: widget.model.lightFav,
                      isFav: widget.model.isLightFav,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: DarkContainer(
                      itsOn: widget.model.isACON,
                      switchButton: widget.model.acSwitch,
                      onTap: () {
                        Navigator.of(context).pushNamed(SmartAC.routeName);
                      },
                      iconAsset: 'assets/icons/svg/ac.svg',
                      device: 'AC',
                      deviceCount: '4 devices',
                      switchFav: widget.model.acFav,
                      isFav: widget.model.isACFav,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: DarkContainer(
                      itsOn: widget.model.isSpeakerON,
                      switchButton: widget.model.speakerSwitch,
                      onTap: () {
                        Navigator.of(context).pushNamed(SmartSpeaker.routeName);
                      },
                      iconAsset: 'assets/icons/svg/speaker.svg',
                      device: 'Speaker',
                      deviceCount: '1 device',
                      switchFav: widget.model.speakerFav,
                      isFav: widget.model.isSpeakerFav,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: DarkContainer(
                      itsOn: widget.model.isFanON,
                      switchButton: widget.model.fanSwitch,
                      onTap: () {
                        Navigator.of(context).pushNamed(SmartFan.routeName);
                      },
                      iconAsset: 'assets/icons/svg/fan.svg',
                      device: 'Fan',
                      deviceCount: '2 devices',
                      switchFav: widget.model.fanFav,
                      isFav: widget.model.isFanFav,
                    ),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: EdgeInsets.all(getProportionateScreenHeight(5)),
            //   child: const MusicWidget(),
            // ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(5)),
              child: const CameraWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class MainBoxes extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final Function onTap;
  final Color color;
  const MainBoxes({
    Key? key,
    this.image = "",
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: boxShadow,
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: boxShadow,
                ),
                child: Center(
                  child: Image.asset(
                    image,
                    width: 40,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
