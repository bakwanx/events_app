import 'package:events_app/models/audience_model.dart';
import 'package:events_app/models/event_model.dart';
import 'package:events_app/utils/formatter.dart';
import 'package:flutter/material.dart';

import '../../utils/custom_styles.dart';

class RegistrantTile extends StatelessWidget {
  final AudienceModel audienceModel;

  const RegistrantTile({required this.audienceModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: Image.network(
                audienceModel.image.toString(),
                fit: BoxFit.cover,
              ).image,
            ),
            const SizedBox(
              width: 17,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    audienceModel.name.toString(),
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              FormatterDate.formatDate(audienceModel.date.toString()),
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            )
          ],
        ),
        Divider(
          color: Colors.grey,
        )
      ],
    );
  }
}
