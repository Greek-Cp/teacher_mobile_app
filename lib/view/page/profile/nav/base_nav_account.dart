import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:teacher_mobile_app/controller/account_user_controller.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/page_nav_profile.dart';
import 'package:teacher_mobile_app/view/component/appbar/custom_bottom_tab_bar.dart';
import 'package:flutter/cupertino.dart'
    hide CupertinoTabScaffold, CupertinoTabBar, CupertinoTabController;
import 'package:teacher_mobile_app/view/component/appbar/custom_tab_scaffold.dart';
import 'package:teacher_mobile_app/view/component/appbar/custom_bottom_tab_bar.dart';
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
    Text("Halaman Tutoring"),
    Text("Halaman Quick"),
    Text("Halaman Profile")
  ];
  List<BottomNavigationBar> listBottomNavigation = [];
  List<IconData> listIcons = [
    Icons.play_arrow_outlined,
    Icons.chat_bubble_outline,
    Icons.bookmark_outline_rounded,
    Icons.add_outlined,
    Icons.person_2_outlined
  ];
  List<String> namaIcons = ["Videos", "Chat", "Tutoring", "Quick", "Profile"];
  final CupertinoTabController _tabController = CupertinoTabController();
  final accountController = Get.put(AccountUserController());

  final List<GlobalKey<NavigatorState>> tabNavKeys =
      List.generate(5, (_) => GlobalKey<NavigatorState>());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> _navbarItem = [];
    for (var i = 0; i < listIcons.length; i++) {
      _navbarItem.add(BuildIconsModif(listIcons[i], i, namaIcons[i]));
    }

    return WillPopScope(
      onWillPop: () async {
        return !await tabNavKeys[_tabController.index].currentState!.maybePop();
      },
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            activeColor: Colors.white,
            inactiveColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 168, 144, 255),
            items: [
              BottomNavigationBarItem(
                  icon:
                      SvgPicture.asset("assets/icon/profile/ic_nav_videos.svg"),
                  label: "Videos"),
              BottomNavigationBarItem(
                  icon:
                      SvgPicture.asset("assets/icon/profile/icon_nav_chat.svg"),
                  label: "Chat"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icon/profile/ic_nav_book.svg"),
                  label: "Tutoring"),
              BottomNavigationBarItem(
                  icon:
                      SvgPicture.asset("assets/icon/profile/ic_nav_quick.svg"),
                  label: "Q. Help"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      "assets/icon/profile/ic_nav_profile.svg"),
                  label: "Profile"),
            ],
          ),
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                return CupertinoTabView(
                  navigatorKey: tabNavKeys[0],
                  builder: (context) {
                    return CupertinoPageScaffold(child: Text("Page 1 "));
                  },
                );
              case 1:
                return CupertinoTabView(
                  navigatorKey: tabNavKeys[1],
                  builder: (context) {
                    return CupertinoPageScaffold(child: Text("Page 2 "));
                  },
                );
              case 2:
                return CupertinoTabView(
                  navigatorKey: tabNavKeys[2],
                  builder: (context) {
                    return CupertinoPageScaffold(child: Text("Page 3 "));
                  },
                );
              case 3:
                return CupertinoTabView(
                  navigatorKey: tabNavKeys[3],
                  builder: (context) {
                    return CupertinoPageScaffold(child: PageDashboardProfile());
                  },
                );
              case 4:
                return CupertinoTabView(
                  navigatorKey: tabNavKeys[4],
                  builder: (context) {
                    return CupertinoPageScaffold(child: PageDashboardProfile());
                  },
                );
            }
            return Container();
          }),
    );
  }

  Widget BuildIconsModif(IconData icon, int index, String nama) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Container(
              decoration: index == _selectedIndex
                  ? BoxDecoration(
                      color: Color.fromARGB(255, 114, 87, 216),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2))
                  : BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  Text(
                    "${nama}",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
        height: 85,
        width: MediaQuery.of(context).size.width / 5.1,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 168, 144, 253),
        ),
      ),
    );
  }
}

class CustomCupertinoTabBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomCupertinoTabBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color of the tabBar
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, -3), // Adjust the shadow offset if needed
            ),
          ],
        ),
        child: CupertinoTabBar(
          currentIndex: currentIndex,
          onTap: onTap,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Profile',
            ),
          ],
        ));
  }
}
