import 'package:events_app/constants/assets_path.dart';
import 'package:events_app/constants/dummy.dart';
import 'package:events_app/providers/event_provider.dart';
import 'package:events_app/views/shimmer/event_tile_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../utils/custom_styles.dart';
import '../widgets/category_tile.dart';
import '../widgets/event_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  EventProvider? _eventProvider;

  int _selectedIndex = 0;
  DateTime _now = DateTime.now();
  late DateTime _lastDayOfMonth;

  void getEvents() async {
    _eventProvider = Provider.of<EventProvider>(context, listen: false);
    await _eventProvider!.getListEvents();
  }

  @override
  void initState() {
    super.initState();
    getEvents();
    _lastDayOfMonth = DateTime(_now.year, _now.month + 1, 0);
  }

  @override
  Widget build(BuildContext context) {

    Widget itemDate(int index, String dayName) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
          getEvents();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 42.0,
              width: 42.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _selectedIndex == index
                    ? Colors.amber
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(44.0),
              ),
              child: Text(
                dayName.substring(0, 1),
                style: TextStyle(
                  fontSize: 24.0,
                  color: _selectedIndex == index
                      ? whiteColor
                      : Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              "${index + 1}",
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              height: 2.0,
              width: 28.0,
              color: _selectedIndex == index
                  ? Colors.amber
                  : Colors.transparent,
            ),
          ],
        ),
      );
    }

    Widget header() {
      return Container(
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          "Hallo, ",
                          style: blackTextStyle.copyWith(
                              fontSize: 21,
                              fontWeight: bold
                          ),
                        ),
                        Text(
                          "Friends!",
                          style: secondaryTextStyle.copyWith(
                              fontSize: 21,
                              fontWeight: bold
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Let's explore Indonesian UX events",
                      style: blackTextStyle.copyWith(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Spacer(),
                const Icon(
                    Icons.notifications_none
                )
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            //NOTE: DATES
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: Row(
                children: List.generate(
                  _lastDayOfMonth.day, (index) {
                  final currentDate = _lastDayOfMonth.add(
                      Duration(days: index + 1));
                  final dayName = DateFormat('E').format(currentDate);
                  return itemDate(index, dayName);
                },
                ),
              ),
            ),

          ],
        ),
      );
    }

    Widget categoryEvents() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Category Event",
              style: blackTextStyle.copyWith(
                fontSize: 20
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: category.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Material(
                    child: InkWell(
                      onTap: (){
                        getEvents();
                      },
                      child: CategoryEventTile(
                        iconData: icCategory[index],
                        eventType: category[index],
                      ),
                    ),
                  );
                }
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "All Events",
              style: blackTextStyle.copyWith(
                fontSize: 20
              ),
            ),
          ],
        ),
      );
    }

    Widget allEvents(bool isLoading) {
      return ListView.builder(
        itemCount: isLoading ? 20 : _eventProvider!.eventModels.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          if(isLoading){
            return EventTileShimmer();
          }
          return EventTile(
            eventModel: _eventProvider!.eventModels[index],
          );
        },
      );
    }

    return Scaffold(
        backgroundColor: whiteColor,
        body: RefreshIndicator(
          onRefresh: () async {
            getEvents();
          },
          child: Consumer<EventProvider>(builder: (context, eventProvider, child) {
            return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 60, horizontal: defaultMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      header(),
                      categoryEvents(),
                      allEvents(eventProvider.isLoading)
                    ],
                  ),
                ),
              );
            },
          ),
        )
    );
  }
}
