import 'package:flutter/material.dart';
import 'package:gogo/components/animated_bottom_bar.dart';
import 'package:gogo/pages/detail_page/detail_page.dart';
import 'package:gogo/pages/home_page/home_page.dart';
import 'package:gogo/source/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      routes: {
        // '/': (context) => HomePage(),
        '/detail': (context) => const TravelDetailPage(
              travelDetails: {
                'travelType': '飞机',
                'startPoint': '北京',
                'endPoint': '上海',
                'travelTime': '2024-12-01',
                'checkInLocation': '上海迪士尼乐园',
                'food': '小笼包、糖醋排骨',
                'guide': '上海旅游攻略',
              },
            ),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GOGO'),
        ),
        body: const HomePage(),
        bottomNavigationBar: AnimatedBottomBar(
          barItems: [
            BarItem(
              text: '首页',
              iconData: Icons.stars_outlined,
              color: highlightColor,
            ),
            BarItem(
              text: '探索',
              iconData: Icons.explore_outlined,
              color: highlightColor,
            ),
            BarItem(
              text: '我的',
              iconData: Icons.person_outline,
              color: highlightColor,
            )
          ],
          animationDuration: const Duration(milliseconds: 150),
          barStyle: BarStyle(
            fontSize: 16.0,
            iconSize: 20.0,
          ),
          onBarTap: (index) {
            print(index);
          },
        ),
      ),
    );
  }
}
