import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:northladder_test_app/screens/first_tab.dart';
import 'package:northladder_test_app/utility/app_assets.dart';
import 'package:northladder_test_app/utility/app_color.dart';
import 'package:northladder_test_app/utility/constants.dart';
import 'package:northladder_test_app/utility/radii.dart';
import 'package:northladder_test_app/utility/style/text_style.dart';
import 'package:northladder_test_app/widget/modal_tiles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return

       Scaffold(
         backgroundColor: AppColor.backGroundColor,
        body: FirstTab(),
        bottomNavigationBar: Container(
          color: Colors.grey.withOpacity(0.2),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: (value) {
                  setCurrentIndex(value);
                },
                type: BottomNavigationBarType.fixed,
                elevation: 50.0,
                unselectedItemColor: Colors.grey,
                selectedItemColor: AppColor.primaryColor,
                items: getNavigationItems()),
          ),
        ),

    );
  }

  void setCurrentIndex(int index) {
    currentIndex = index;
    setState(() {});
    if (currentIndex == 4) {
      showBottomSheet();
    }
  }

  showBottomSheet() {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        enableDrag: true,
        backgroundColor: Colors.white,
        builder: (context) {
          return Container(
            color: Colors.grey,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      10,
                    ),
                    topRight: Radius.circular(
                      10,
                    ),
                  ),
                  color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 30,
                    height: 5,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    decoration: const BoxDecoration(
                        borderRadius: Radii.k15pxRadius, color: Colors.grey),
                  ),
                  kLargeBox,
                  const ModalTiles('Transactions', AppAssets.transaction),
                  const ModalTiles('My account', AppAssets.account),
                  const ModalTiles('Help', AppAssets.help),
                  const ModalTiles('Settings', AppAssets.setting),
                ],
              ),
            ),
          );
        });
  }

  List<BottomNavigationBarItem> getNavigationItems() {
    return [
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.bid,
            color: currentIndex == 0 ? AppColor.primaryColor : Colors.grey,
          ),
          label: 'Bid'),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.myDeals,
            color: currentIndex == 1 ? AppColor.primaryColor : Colors.grey,
          ),
          label: 'My Deals'),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.union,
            color: currentIndex == 2 ? AppColor.primaryColor : Colors.grey,
          ),
          label: 'Sell'),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.histogram,
            color: currentIndex == 3 ? AppColor.primaryColor : Colors.grey,
          ),
          label: 'Trend'),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.more,
            color: currentIndex == 4 ? AppColor.primaryColor : Colors.grey,
          ),
          label: 'More')
    ];
  }
}
