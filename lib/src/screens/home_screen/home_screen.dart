import 'package:domus/config/size_config.dart';
import 'package:domus/provider/base_view.dart';
import 'package:domus/src/screens/stats_screen/components/stats_device_consumption_chart.dart';
import 'package:domus/src/screens/stats_screen/components/stats_electricity_usage_chart.dart';
import 'package:domus/src/screens/stats_screen/components/type_selection.dart';
import 'package:domus/view/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:domus/src/screens/menu_page/menu_screen.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BaseView<HomeScreenViewModel>(
      onModelReady: (model) => {
        model.generateRandomNumber(),
      },
      builder: (context, model, child) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              shape: Border(
                bottom: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
              title: Text(
                'Hi, User',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              backgroundColor: Colors.white,
              // bottom border
            ),
            drawer: SizedBox(
              width: getProportionateScreenWidth(270),
              child: const Menu(),
            ),
            body: PageView(
              controller: model.pageController,
              onPageChanged: (index) {
                model.selectedIndex = index;
                model.notifyListeners();
              },
              children: [
                Body(
                  model: model,
                ),
                const Column(
                  children: [
                    TypeSelection(),
                    SizedBox(height: 15),
                    Expanded(
                      child: StatsElectricityUsageChart(),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: StatsDeviceConsumptionChart(),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
                const Center(
                  child: Text('History'),
                ),
                const Center(
                  child: Text('Profile'),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: model.selectedIndex,
              selectedItemColor: Colors.black,
              elevation: 0,
              onTap: model.onItemTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.home),
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  label: "Analytics",
                  icon: Icon(Icons.auto_graph_rounded),
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  label: "History",
                  icon: Icon(Icons.history),
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: Icon(Icons.person_rounded),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
