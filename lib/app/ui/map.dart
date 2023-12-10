import 'package:flutter/material.dart';
import 'package:istu_map/app/ui/navigation_drawer.dart';
import '../../features/map/presentation/pages/map.dart';

class IstuMap extends StatefulWidget {
  const IstuMap({Key? key}) : super(key: key);

  @override
  State<IstuMap> createState() => _IstuMapState();
}

class _IstuMapState extends State<IstuMap> {
  var mapScale = 1.0;

  void _onDrawerChanged(bool isOpened) {
    setState(() {
      isOpened ? mapScale = 1.05 : mapScale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      onDrawerChanged: _onDrawerChanged,
      drawer: const IstuNavigationDrawer(),
      endDrawer: const IstuNavigationDrawer(),
      body: Stack(
        children: [
          AnimatedScale(
            duration: const Duration(milliseconds: 150),
            scale: mapScale,
            child: const IstuMapWidget(),
          ),
          Builder(builder: (drawerOpenerContext) {
            return Padding(
              padding: const EdgeInsets.all(40),
              child: InkWell(
                onTap: () {
                  Scaffold.of(drawerOpenerContext).openDrawer();
                },
                child: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.black,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
