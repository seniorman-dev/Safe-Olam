import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:olam_grains/constants/app_theme.dart';
import 'package:olam_grains/util/custom_appbar_for_tab.dart';
import 'package:olam_grains/widget/home/reported_events/specific_plant_events/widget/plant_near_miss.dart';
import 'package:olam_grains/widget/home/reported_events/specific_plant_events/widget/plant_unsafe_act.dart';
import 'package:olam_grains/widget/home/reported_events/specific_plant_events/widget/plant_unsafe_condition.dart';





class SpecificPlantEvents extends StatefulWidget {
  const SpecificPlantEvents({super.key});

  @override
  State<SpecificPlantEvents> createState() => _SpecificPlantEventsState();
}

class _SpecificPlantEventsState extends State<SpecificPlantEvents> with TickerProviderStateMixin{
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
        SpecificPlantUnSafeActContainer(),
        SpecificPlantUnSafeConditionContainer(),
        SpecificPlantNearMissContainer()   
      ],
    );
  }
}