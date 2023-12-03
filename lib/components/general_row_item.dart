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
    required this.isOpen,
    required this.open,
  }) : super(key: key);

  final Map<String, dynamic> travel;
  final bool isOpen;
  final void Function() open;

  @override
  State<GeneralRowItem> createState() => _GeneralRowItemState();
}

class _GeneralRowItemState extends State<GeneralRowItem> {
  String get title => widget.travel['title'];
  String get subTitle => DateTime.fromMillisecondsSinceEpoch(
        widget.travel['createTimeStamp'],
      ).toIso8601String().substring(0, 10);
  String get bgImage => widget.travel['bgImage'];
  bool get isOpen => widget.isOpen;
  void Function() get open => widget.open;

  Color _textColor = Colors.transparent;

  void handleOpen() {
    open();

    print('change');
    setState(() {
      _textColor =
          _textColor == Colors.black ? Colors.transparent : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      height: isOpen ? 320 : 86,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: handleOpen,
                    icon: Icon(
                      widget.isOpen
                          ? Icons.arrow_downward
                          : Icons.arrow_forward,
                    ),
                    color: primaryColor,
                  ),
                ],
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeInOut,
                height: isOpen ? 200 : 0,
                child: Expanded(
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          child: const Icon(
                                            Icons.airplane_ticket_outlined,
                                            color: highlightColor,
                                          ),
                                        ),
                                        const Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                '北京大兴 BDX',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: primaryColor,
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Icon(
                                                Icons
                                                    .arrow_circle_right_outlined,
                                                color: primaryColor,
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                '天津滨海 TSN',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        // 地图
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          child: const Icon(
                                            Icons.map_outlined,
                                            color: highlightColor,
                                          ),
                                        ),
                                        const Expanded(
                                          child: Text(
                                            '天津之眼',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 8,
                        child: AnimatedContainer(
                          padding: EdgeInsets.zero, // 设置内边距为零
                          duration:
                              const Duration(milliseconds: 50), // 设置动画持续时间
                          curve: Curves.linear, // 设置动画曲线
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Text(
                              '查看详情',
                              style: TextStyle(
                                color: _textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
