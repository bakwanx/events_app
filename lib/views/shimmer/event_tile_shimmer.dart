import 'package:events_app/utils/custom_styles.dart';
import 'package:events_app/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class EventTileShimmer extends StatelessWidget {

  EventTileShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(
        left: 10
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade400,
          width: 1
        )
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  color: Colors.grey.shade100,
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: 200,
                  color: Colors.grey.shade100,
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.grey.shade100,
                )
              ],
            ),
          ),
          SizedBox(
            width: 120,
            height: 110.0,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade50,
              child:  Container(
                width: 120,
                height: 110,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
