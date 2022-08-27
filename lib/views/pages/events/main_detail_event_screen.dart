import 'dart:ui';

import 'package:events_app/models/event_model.dart';
import 'package:events_app/views/pages/events/registran_screen.dart';
import 'package:events_app/views/pages/events/description_screen.dart';
import 'package:events_app/views/pages/events/presenter_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/custom_styles.dart';

class MainDetailEventScreen extends StatefulWidget {
  final EventModel eventModel;
  const MainDetailEventScreen({required this.eventModel, Key? key}) : super(key: key);

  @override
  State<MainDetailEventScreen> createState() => _MainDetailEventScreenState();
}

class _MainDetailEventScreenState extends State<MainDetailEventScreen> with SingleTickerProviderStateMixin{

  TabController? _tabController;
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController?.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    Widget header(){
      return Stack(
        children: [
          Image.network(
            widget.eventModel.image.toString(),
            fit: BoxFit.cover,
            height: height * 0.7,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
            child: Container(
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0.1),
            ),
          ),

          //CONTENT HEADER
          Container(
            margin: EdgeInsets.only(
              left: defaultMargin,
              top: 16,
              right: defaultMargin,
              bottom: defaultMargin,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: whiteColor,
                      size: 30,
                    ),
                  ),
                  Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15), // Image border
                            child: SizedBox.fromSize(
                              child: Image.network(
                                widget.eventModel.image.toString(),
                                fit: BoxFit.cover,
                                height: 241,
                                width: 153,
                              )
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.eventModel.eventName.toString(),
                            style: whiteTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            widget.eventModel.presenter!.name.toString(),
                            style: whiteTextStyle,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            widget.eventModel.price.toString(),
                            style: whiteTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 24
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey.shade200
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      widget.eventModel.presenter!.rating.toString(),
                                      style: blackTextStyle.copyWith(
                                        fontWeight: bold
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Rating",
                                      style: blackTextStyle.copyWith(
                                        fontWeight: light,
                                        fontSize: 12
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      widget.eventModel.audience!.length.toString(),
                                      style: blackTextStyle.copyWith(
                                          fontWeight: bold
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Registrant",
                                      style: blackTextStyle.copyWith(
                                        fontWeight: light,
                                        fontSize: 12
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      widget.eventModel.quota.toString(),
                                      style: blackTextStyle.copyWith(
                                        fontWeight: bold
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Quota",
                                      style: blackTextStyle.copyWith(
                                        fontWeight: light,
                                        fontSize: 12
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ]
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget body(){
      return NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext contextScroll, bool innerBoxIsScrolled){
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              floating: true,
              expandedHeight: height * 0.72,
              automaticallyImplyLeading: false,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: header(),
              ),
              forceElevated: innerBoxIsScrolled,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(height * 0.088),
                child: Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  padding: EdgeInsets.only(
                      left: defaultMargin,
                      right: defaultMargin,
                      top: 20
                  ),
                  child: TabBar(
                    indicatorColor: Colors.black,
                    labelColor: Colors.black,
                    unselectedLabelColor: greyColor,
                    controller: _tabController,
                    tabs: const [
                      Tab(text: "Detail"),
                      Tab(text: "Registrant"),
                      Tab(text: "Presenter")
                    ]
                  ),
                ),
              ),
            )
          ];
        },
        body: TabBarView(
            controller: _tabController,
            children: [
              DescriptionScreen(eventModel: widget.eventModel,),
              RegistrantScreen(eventModel: widget.eventModel,),
              PresenterScreen(eventModel: widget.eventModel,)
            ]
        ),
      );
    }

    Widget buttonRegister(){
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: defaultMargin
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                blurRadius: 40,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Container(
            width: double.infinity,
            height: 46,
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin
            ),
            child: TextButton(
                onPressed: (){
                  ScaffoldMessenger.of(context)
                    .showSnackBar(
                    SnackBar(
                      content: Text("Success Register"),
                      backgroundColor: Colors.lightGreen,
                    )
                  );
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: primaryColor
                    ),
                    borderRadius: BorderRadius.circular(defaultRadius),
                  )
                ),
                child: Text(
                  "Register",
                  style: whiteTextStyle.copyWith(
                    fontWeight: bold,
                    color: whiteColor
                  ),
                )
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            body(),
            buttonRegister()
          ],
        ),
      ),
    );
  }
}
