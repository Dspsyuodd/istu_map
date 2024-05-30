import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istu_map/features/authentication/authentication_injection_container.dart';
import 'package:istu_map/features/map/external_map/presentation/bloc/map_bloc.dart';
import 'package:istu_map/features/user/presentation/bloc/user_bloc.dart';
import 'package:istu_map/features/user/presentation/widgets/shedule_drawer.dart';
import '../../../../search/presentation/widgets/bottom_search_drawer.dart';
import '../../../../search/presentation/widgets/bottom_search_drawer_content.dart';
import '../../../../../app/ui/end_navigarion_drawer.dart';
import '../../../../../app/ui/navigation_drawer.dart';
import '../../../../search/presentation/widgets/search_bar.dart';
import '../widgets/map_widget.dart';

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
    return BlocProvider(
      create: (context) => sl<UserBloc>()..add(const UserEvent.getUserData()),
      child: Scaffold(
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
              child: ScheduleDrawer(
                onTap: (lesson, selectedLesson) {
                  if (lesson == selectedLesson) {
                    BlocProvider.of<MapBloc>(context).add(
                      ExternalRouteCreatedToLesson(lesson),
                    );
                  }
                  else {
                    BlocProvider.of<MapBloc>(context).add(
                      ExternalLessonSelected(lesson),
                    );
                  }
                },
                onLessonSelected: (lesson) {
                  BlocProvider.of<MapBloc>(context).add(
                    ExternalLessonSelected(lesson),
                  );
                },
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
      ),
    );
  }
}
