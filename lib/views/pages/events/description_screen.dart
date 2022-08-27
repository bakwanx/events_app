import 'package:events_app/utils/formatter.dart';
import 'package:flutter/material.dart';

import '../../../models/event_model.dart';
import '../../../utils/custom_styles.dart';

class DescriptionScreen extends StatefulWidget {
  final EventModel eventModel;
  const DescriptionScreen({required this.eventModel, Key? key}) : super(key: key);

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
        vertical: defaultMargin
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Date & Time",
            style: blackTextStyle.copyWith(
                fontWeight: semiBold
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_rounded,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        FormatterDate.formatDate(widget.eventModel.date.toString()),
                        style: blackTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        FormatterDate.formatTime(widget.eventModel.date.toString()),
                        style: blackTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 100,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.meeting_room_outlined,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.eventModel.isOnline as bool
                    ? "Online"
                    : "Offline",
                    style: blackTextStyle,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(
            height: 12,
          ),
          Text(
            "Description",
            style: blackTextStyle.copyWith(
              fontWeight: semiBold
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Text(
              widget.eventModel.description.toString(),
              style: blackTextStyle,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
