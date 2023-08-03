import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> _navbarItem = [];
    for (var i = 0; i < listIcons.length; i++) {
      _navbarItem.add(BuildIconsModif(listIcons[i], i, namaIcons[i]));
    }
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
            body: SafeArea(
                child: Center(
              child: PageList.elementAt(_selectedIndex),
            )),
            bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 168, 144, 253),
                  border: Border.all(color: Colors.black, width: 2.0.w),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        spreadRadius: 0.r,
                        blurRadius: 10.r),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0.r),
                    topRight: Radius.circular(20.0.r),
                  ),
                  child: Row(
                    children: _navbarItem,
                  ),
                )));
      },
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
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.black, width: 2.w))
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
        height: 85.h,
        width: MediaQuery.of(context).size.width / 5.1,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 168, 144, 253),
        ),
      ),
    );
  }
}
