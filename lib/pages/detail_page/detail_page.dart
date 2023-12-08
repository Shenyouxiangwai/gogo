import 'package:flutter/material.dart';

class TravelDetailPage extends StatelessWidget {
  final Map<String, String> travelDetails;

  const TravelDetailPage({Key? key, required this.travelDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Details'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildInfoItem('出行方式', travelDetails['travelType'] ?? ''),
          _buildInfoItem('起点', travelDetails['startPoint'] ?? ''),
          _buildInfoItem('终点', travelDetails['endPoint'] ?? ''),
          _buildInfoItem('出行时间', travelDetails['travelTime'] ?? ''),
          _buildInfoItem('打卡旅游地点', travelDetails['checkInLocation'] ?? ''),
          _buildInfoItem('食物', travelDetails['food'] ?? ''),
          _buildInfoItem('参考攻略', travelDetails['guide'] ?? ''),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String title, String content) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF1E1E1E),
        ),
      ),
      subtitle: Text(
        content,
        style: TextStyle(
          fontSize: 14,
          color: const Color(0xBB222222),
        ),
      ),
      trailing: Icon(Icons.arrow_forward, color: const Color(0xFFFF385C)),
      contentPadding: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.black.withOpacity(0.1)),
      ),
      onTap: () {
        // 点击操作
      },
    );
  }
}
