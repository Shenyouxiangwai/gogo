import 'package:flutter/material.dart';
import 'package:gogo/source/color.dart';

TextStyle get titleStyle => const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: highlightColor,
    );
TextStyle get subTitleStyle => const TextStyle(
      fontSize: 16,
      color: Colors.white70,
    );
TextStyle get contentStyle => const TextStyle(
      fontSize: 16,
      color: Colors.white,
    );

class GeneralRowItem extends StatefulWidget {
  const GeneralRowItem({
    Key? key,
    required this.travel,
  }) : super(key: key);

  final Map<String, dynamic> travel;

  @override
  State<GeneralRowItem> createState() => _GeneralRowItemState();
}

class _GeneralRowItemState extends State<GeneralRowItem> {
  String get title => widget.travel['title'];
  String get subTitle => DateTime.fromMillisecondsSinceEpoch(
        widget.travel['createTimeStamp'],
      ).toIso8601String().substring(0, 10);
  String get bgImage => widget.travel['bgImage'];

  void handleOpen() {
    // 跳转到DetailPage页面
    Navigator.of(context).pushNamed('/detail', arguments: widget.travel);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleOpen,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 2),
                blurRadius: 8,
              ),
            ],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: titleStyle,
                          ),
                          Text(
                            subTitle,
                            style: const TextStyle(
                              fontSize: 14,
                              color: subColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
