import 'package:flutter/material.dart';

import '../../../models/event_model.dart';
import '../../../utils/custom_styles.dart';
import '../../widgets/registrant_tile.dart';

class RegistrantScreen extends StatefulWidget {
  final EventModel eventModel;

  const RegistrantScreen({required this.eventModel, Key? key})
      : super(key: key);

  @override
  State<RegistrantScreen> createState() => _RegistrantScreenState();
}

class _RegistrantScreenState extends State<RegistrantScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    Widget summary() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 20),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Quota",
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${widget.eventModel.audience!.length.toString()} / ${widget.eventModel.quota} left",
                    style: blackTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget listRegistrant() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: height * 0.12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              "Registrant",
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.eventModel.audience!.length,
              itemBuilder: (context, index) {
                return RegistrantTile(
                  audienceModel: widget.eventModel.audience![index],
                );
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            summary(),
            listRegistrant(),
          ],
        ),
      ),
    );
  }
}
