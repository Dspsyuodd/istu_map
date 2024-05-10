import 'package:flutter/material.dart';
import 'bottom_search_drawer.dart';
import 'bottom_search_drawer_content.dart';
import 'end_navigarion_drawer.dart';
import 'navigation_drawer.dart';
import 'schedule_list.dart';
import 'search_bar.dart';
import '../../features/map/external_map/presentation/pages/map.dart';

class IstuMap extends StatefulWidget {
  const IstuMap({Key? key}) : super(key: key);

  @override
  State<IstuMap> createState() => _IstuMapState();
}

class _IstuMapState extends State<IstuMap> {
  var drawerOpened = false;
  late FocusNode bottomDrawerSearchFocusNode;
  late BottomSearchDrawerController bottomSearchDrawerController;

  @override
  void initState() {
    super.initState();
    bottomDrawerSearchFocusNode = FocusNode();
    bottomSearchDrawerController = BottomSearchDrawerController();
  }

  @override
  void dispose() {
    bottomDrawerSearchFocusNode.dispose();
    bottomSearchDrawerController.dispose();
    super.dispose();
  }

  void _onDrawerChanged(bool isOpened) {
    setState(() {
      drawerOpened = isOpened;
    });
  }

  void _onBottomAppDrawerChanged(bool isOpened) {
    _onDrawerChanged(isOpened);
    if (isOpened) {
      bottomDrawerSearchFocusNode.requestFocus();
    } else {
      bottomDrawerSearchFocusNode.unfocus();
    }
  }

  void _onPopInvoked(bool didPop) {
    //TODO: implement _onPopInvoked
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      onDrawerChanged: _onDrawerChanged,
      drawer: const IstuNavigationDrawer(),
      body: Stack(
        children: [
          AnimatedScale(
            duration: const Duration(milliseconds: 150),
            scale: drawerOpened ? 1.05 : 1.0,
            child: const IstuMapWidget(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 52),
              child: Builder(builder: (drawerOpenerContext) {
                return SearchAppBar(
                  onAvatarTap: () {
                    Scaffold.of(drawerOpenerContext).openDrawer();
                  },
                  onSearchTap: () {
                    bottomSearchDrawerController.open();
                  },
                );
              }),
            ),
          ),
          EndDrawer(
            onStateChanged: _onDrawerChanged,
            width: MediaQuery.of(context).size.width * 0.61,
            child: ScheduleList(
              width: MediaQuery.of(context).size.width * 0.38,
              spacing: 67,
            ),
          ),
          BottomSearchDrawer(
            controller: bottomSearchDrawerController,
            onStateChanged: _onBottomAppDrawerChanged,
            child: BottomSearchDrawerContent(
              focusNode: bottomDrawerSearchFocusNode,
            ),
          ),
        ],
      ),
    );
  }
}
