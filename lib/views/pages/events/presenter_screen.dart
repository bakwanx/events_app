import 'package:events_app/models/event_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/custom_styles.dart';

class PresenterScreen extends StatefulWidget {
  final EventModel eventModel;
  const PresenterScreen({required this.eventModel, Key? key}) : super(key: key);

  @override
  State<PresenterScreen> createState() => _PresenterScreenState();
}

class _PresenterScreenState extends State<PresenterScreen> {
  @override
  Widget build(BuildContext context) {

    Widget profile(){
      return Container(
        margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: 18
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: Image.network(
                widget.eventModel.presenter!.presenterImage.toString(),
                fit: BoxFit.cover,
              ).image,
            ),
            const SizedBox(
              width: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.eventModel.presenter!.name.toString(),
                  style: secondaryTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 20
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.email_outlined,
                      size: 16,
                      color: primaryColor,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      widget.eventModel.presenter!.email.toString(),
                      style: greyTextStyle.copyWith(
                        fontSize: 12
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.work_outline,
                      color: primaryColor,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      widget.eventModel.presenter!.job.toString(),
                      style: greyTextStyle.copyWith(
                        fontSize: 12
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    Widget description(){
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About Presenter",
              style: blackTextStyle.copyWith(
                fontWeight: semiBold
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              widget.eventModel.description.toString(),
              style: blackTextStyle.copyWith(
                fontSize: 12
              ),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            profile(),
            description(),
          ],
        ),
      ),
    );
  }
}
