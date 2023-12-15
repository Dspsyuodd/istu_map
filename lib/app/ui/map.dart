import 'package:flutter/material.dart';
import 'package:istu_map/app/ui/end_navigarion_drawer.dart';
import 'package:istu_map/app/ui/navigation_drawer.dart';
import '../../features/map/presentation/pages/map.dart';

class IstuMap extends StatefulWidget {
  const IstuMap({Key? key}) : super(key: key);

  @override
  State<IstuMap> createState() => _IstuMapState();
}

class _IstuMapState extends State<IstuMap> {
  var mapScale = 1.0;
  var endDrawerOpened = false;

  void _onDrawerChanged(bool isOpened) {
    setState(() {
      isOpened ? mapScale = 1.05 : mapScale = 1.0;
    });
  }

  void _onEndDrawerChanged(bool isOpened) {
    _onDrawerChanged(isOpened);
    setState(() {
      endDrawerOpened = isOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      onDrawerChanged: _onDrawerChanged,
      drawer: const IstuNavigationDrawer(),
      body: Stack(
        children: [
          IgnorePointer(
            ignoring: endDrawerOpened,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 150),
              scale: mapScale,
              child: const IstuMapWidget(),
            ),
          ),


          IgnorePointer(
            ignoring: true,
            child: AnimatedOpacity(
              opacity: endDrawerOpened ? 0.5 : 0,
              duration: const Duration(milliseconds: 150),
              child: Container(
                color: Colors.black,
              ),
            ),
          ),

          
          IgnorePointer(
            ignoring: endDrawerOpened,
            child: Builder(builder: (drawerOpenerContext) {
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
          ),
          EndDrawer(
            onEndDrawerChanged: _onEndDrawerChanged,
            width: MediaQuery.of(context).size.width * 0.61,
          ),
        ],
      ),
    );
  }
}
