import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:olam_grains/constants/app_theme.dart';
import 'package:olam_grains/util/custom_appbar_for_tab.dart';

import 'widget/near_miss_tab.dart';
import 'widget/unsafe_act_tab.dart';
import 'widget/unsafe_condition_tab.dart';




class ReportedEvents extends StatefulWidget {
  const ReportedEvents({super.key});

  @override
  State<ReportedEvents> createState() => _ReportedEventsState();
}

class _ReportedEventsState extends State<ReportedEvents> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    //tabbar controller
    TabController tabBarController = TabController(length: 3, vsync: this);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: AppTheme.backgroundColor,
      appBar: CustomAppBarForTab(tabBarController: tabBarController,),
      body: SafeArea(
        child: buildBody(context, tabBarController)
      )
    );
  }

  //buildBody
  Widget buildBody(BuildContext context, tabBarController) {
    //do not wrap a scrollable widget(e.g, SingleChildScrollView, ListViews, GridViews, TabViews, e.t.c) with a Padding.
    return TabBarView(
      physics: const BouncingScrollPhysics(),
      controller: tabBarController,
      children: [
        //put the real pages later
        UnSafeActContainer(),
        UnSafeConditionContainer(),
        NearMissContainer()   
      ],
    );
  }
}