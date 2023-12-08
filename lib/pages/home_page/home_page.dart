import 'package:flutter/material.dart';

import '../../components/general_row_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _travels = [
    {
      'title': '天津之旅',
      'createTimeStamp': DateTime.now().millisecondsSinceEpoch,
      'bgImage':
          'https://images.unsplash.com/photo-1697617279806-f151d25022ba?q=80&w=2950&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
  ];

  int activeIndex = -1;

  void createNewTravels() {
    print(123);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: _travels
            .map(
              (travel) => GeneralRowItem(
                key: ValueKey(travel['createTimeStamp']),
                travel: travel,
              ),
            )
            .toList(),
      ),
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 1), () {
          // setState(() {
          //   _travels.add({
          //     'title': '天津之旅',
          //     'createTimeStamp': DateTime.now().millisecondsSinceEpoch,
          //   });
          //   activeIndex = -1;
          // });
        });
      },
    );
  }
}
