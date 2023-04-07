import 'package:flutter/material.dart';

class DashboardCard extends StatefulWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String count;
  final String subtitle;
  final double line;
  const DashboardCard({super.key, required this.color, required this.icon, required this.count, required this.title, required this.subtitle, required this.line});

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: 150,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: widget.color.withOpacity(.1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.title,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Loto-Regular'),
                                  ),
                                  Text(
                                    widget.count,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'poppin'),
                                  )
                                ],
                              ),
                              Column(
                                children:  [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: widget.color,
                                    child: Icon(widget.icon,
                                          color: Colors.white,
                                          size: 25.0,
                                        ),
                                    
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                           LinearProgressIndicator(
                            color: widget.color,
                            backgroundColor: Colors.white,
                            minHeight: 8,
                            value: widget.line,
                            semanticsLabel: 'Linear progress indicator',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                         Align(
                            alignment: Alignment.topLeft,
                            child: Text(widget.subtitle,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(98, 109, 126, 1),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Loto-Regular'),
                            ),
                          ),
                        ],
                      ),
                    );
  }
}