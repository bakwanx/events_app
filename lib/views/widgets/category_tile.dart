import 'package:flutter/material.dart';

import '../../utils/custom_styles.dart';

class CategoryEventTile extends StatelessWidget {
  IconData iconData;
  String eventType;

  CategoryEventTile({required this.iconData, required this.eventType});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: Color(0xff29404E), borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            color: whiteColor,
            size: 40,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            eventType,
            style: whiteTextStyle
          )
        ],
      ),
    );
  }
}
