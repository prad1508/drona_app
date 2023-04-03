import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingWidget extends StatefulWidget {
  final Color iconColor;
  final String title;
  final dynamic redirectPage;
  final IconData iconName;
  const SettingWidget({super.key, required this.iconColor, required this.iconName, required this.title, required this.redirectPage});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
                      onTap: () {},
                      child: ListTile(
                        contentPadding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                        leading: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.amber),
                            child: Icon(
                              widget.iconName,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            )),
                        title: Text(widget.title),
                        trailing: IconButton(
                          onPressed: (() {
                            if (kDebugMode) {
                              print('folder clicked');
                            }
                          }),
                          icon: const Icon(Icons.arrow_forward_ios),
                          iconSize: 18,
                        ),
                      ),
                    );
  }
}