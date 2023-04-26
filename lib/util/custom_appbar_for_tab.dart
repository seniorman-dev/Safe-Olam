import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olam_grains/constants/app_theme.dart';





class CustomAppBarForTab extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBarForTab({
    super.key,
    required this.tabBarController,
  });

  final TabController tabBarController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.backgroundColor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 0,
      //flexibleSpace: SizedBox(height: 20,),
      title: Text(
        'Reported Events',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          CupertinoIcons.back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      bottom: TabBar(
        onTap: (value) {
          print(value);
        },
        automaticIndicatorColorAdjustment: true,
        physics: const BouncingScrollPhysics(),
        isScrollable: true,
        indicatorColor: AppTheme.orangeColor,
        indicatorWeight: 3,
        controller: tabBarController,
        labelColor: AppTheme.orangeColor,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        unselectedLabelColor: AppTheme.lightGreyText,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        tabs: const [
          Tab(
            child: Text(
              'Unsafe Act',
            ),
          ),
          Tab(
            child: Text(
              'Unsafe Condition',
            ),
          ),
          Tab(
            child: Text(
              'Near Miss',
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.h);
}
