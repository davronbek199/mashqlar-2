import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mashqlar2/models/lang.dart';

class ChangeLangBottom extends StatefulWidget {
  const ChangeLangBottom({Key? key}) : super(key: key);

  @override
  State<ChangeLangBottom> createState() => _ChangeLangBottomState();
}

class _ChangeLangBottomState extends State<ChangeLangBottom> {
  int _index = 0;

  List<Lang> _langs = [
    Lang("uz", true),
    Lang("ru", false),
    Lang("en", false),
  ];

  int _activeLangIndex = 0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            unselectedLabelTextStyle:
                TextStyle(color: Colors.black, fontSize: 30),
            selectedLabelTextStyle:
                TextStyle(color: Colors.white, fontSize: 30),
            backgroundColor: Colors.blue,
            leading: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                ToggleButtons(
                  splashColor: Colors.transparent,
                  borderColor: Colors.transparent,
                  selectedBorderColor: Colors.transparent,
                  direction: Axis.vertical,
                  children: [
                    langButton(_langs[0]),
                    langButton(_langs[1]),
                    langButton(_langs[2]),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      _langs.forEach((e) {
                        e.isActive = false;
                      });
                      switch (index) {
                        case 0:
                          {
                            context.setLocale(Locale('uz', 'UZ'));
                          }
                          break;
                        case 1:
                          {
                            context.setLocale(Locale('ru', 'RU'));
                          }
                          break;
                        case 2:
                          {
                            context.setLocale(Locale('en', 'US'));
                          }
                          break;
                      }
                      _langs[index].isActive = true;
                    });
                  },
                  isSelected: _langs.map((e) => e.isActive).toList(),
                ),
              ],
            ),
            labelType: NavigationRailLabelType.all,
            destinations: [
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: RotatedBox(
                  quarterTurns: -1,
                  child: Text("meals".tr()),
                ),
              ),
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: RotatedBox(
                  quarterTurns: -1,
                  child: Text("salads".tr()),
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              widthFactor: 1.5,
              child: Text(
                "${'title'.tr()}" " " "${_selectedIndex}",
                style: TextStyle(color: Colors.black, fontSize: 50),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget langButton(Lang lang) {
    return Container(
      width: 40,
      height: 40,
      child: Center(
        child: Text(
          lang.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: lang.isActive ? Color(0xff206498) : Color(0xff2A5270),
      ),
    );
  }
}
