import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/page_nav_profile.dart';
import 'package:teacher_mobile_app/view/page/profile/page_dashboard_profile.dart';

class pageNavBar extends StatefulWidget {
  static String? routeName = "/BaseNavAccount";

  @override
  State<pageNavBar> createState() => _pageNavBarState();
}

class _pageNavBarState extends State<pageNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> PageList = [
    //List Menu yang diset pada Button nav
    Text("Halaman Videos"),
    Text("Halaman Chat"),
    Text("Halaman Videos"),
    Text("Halaman Chat"),
    PageDashboardProfile(),
  ];
  List<BottomNavigationBar> listBottomNavigation = [];
  List<IconData> listIcons = [
    Icons.play_arrow_outlined,
    Icons.chat_bubble_outline,
    Icons.bookmark_outline_rounded,
    Icons.add_outlined,
    Icons.person_2_outlined
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset("assets/icon/profile/ic_nav_videos.svg"),
        title: ("VIDEOS"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset("assets/icon/profile/ic_nav_chat.svg"),
        title: ("CHAT"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset("assets/icon/profile/ic_nav_book.svg"),
        title: ("TUTORING"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset("assets/icon/profile/ic_nav_quick.svg"),
        title: ("QUICK"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset("assets/icon/profile/ic_nav_profile.svg"),
          title: ("PROFILE"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: '/',
            routes: {
              PageNavProfile.routeName.toString(): (context) =>
                  PageNavProfile(),
            },
          ),
          onPressed: (context) {
            pushDynamicScreen(context!,
                screen: PageDashboardProfile(), withNavBar: true);
          }),
    ];
  }

  List<String> namaIcons = ["Videos", "Chat", "Tutoring", "Quick", "Profile"];
  PersistentTabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  // TODO: implement build
  List<Widget> _navbarItem = [];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        // for (var i = 0; i < listIcons.length; i++) {
        //   _navbarItem.add(BuildIconsModif(listIcons[i], i, namaIcons[i]));
        // }
        return PersistentTabView.custom(
          context,
          controller: _controller,
          itemCount: PageList
              .length, // This is required in case of custom style! Pass the number of items for the nav bar.
          screens: PageList,
          confineInSafeArea: true,

          handleAndroidBackButtonPress: true,
          customWidget: (navBarEssentials) => CustomNavBarWidget(
            items: _navBarsItems(),
            onItemSelected: (index) {
              setState(() {
                navBarEssentials.onItemSelected!(index);
              });
            },
            selectedIndex: _controller!.index,
          ),
        );
      },
    );
  }
}

class CustomNavBarWidget extends StatefulWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget({
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  });

  @override
  State<CustomNavBarWidget> createState() => _CustomNavBarWidgetState();
}

class _CustomNavBarWidgetState extends State<CustomNavBarWidget> {
  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      width: 50.w,
      margin: EdgeInsets.only(
        top: 10.h,
      ),
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: isSelected
          ? BoxDecoration(
              color: Color.fromARGB(255, 114, 87, 216),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.black, width: 2.w))
          : BoxDecoration(),
      height: kBottomNavigationBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                size: 10.0,
                color: isSelected ? Colors.white : Colors.black,
              ),
              child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: FittedBox(
              child: Text(
                item.title.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 168, 144, 255),
      child: Container(
        padding: EdgeInsets.only(bottom: 0.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors
              .transparent, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
          border: Border.all(
            color: Colors.black, // Warna garis tepi (outline) hitam
            width: 2.0, // Ketebalan garis tepi
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight:
                  Radius.circular(10.r)), // Sudut melengkung sebesar 30 unit
        ),
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.items.map((item) {
            int index = widget.items.indexOf(item);
            return GestureDetector(
              onTap: () {
                setState(() {
                  this.widget.onItemSelected(index);

                  print("selected index ${widget.selectedIndex} + ${index}");
                });
              },
              child: _buildItem(item, widget.selectedIndex == index),
            );
          }).toList(),
        ),
      ),
    );
  }
}
