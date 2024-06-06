import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istu_map/config/enums/object_type.dart';
import 'package:istu_map/features/map/external_map/presentation/bloc/map_bloc.dart';
import 'package:istu_map/features/object_card/presentation/pages/object_card_page.dart';
import 'package:istu_map/features/search/presentation/cubit/search_cubit.dart';
import 'package:istu_map/features/search/presentation/widgets/search_result_element.dart';
import 'package:istu_map/features/user/presentation/bloc/user_bloc.dart';

import '../../../user/presentation/widgets/avatar.dart';

class BottomSearchDrawerContent extends StatefulWidget {
  const BottomSearchDrawerContent({Key? key, this.focusNode}) : super(key: key);
  final FocusNode? focusNode;

  @override
  State<BottomSearchDrawerContent> createState() =>
      _BottomSearchDrawerContentState();
}

class _BottomSearchDrawerContentState extends State<BottomSearchDrawerContent> {
  late FocusNode _focusNode;
  late ScrollController _scrollController;
  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _focusNode.unfocus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    return Avatar(
                      text: state.maybeWhen(
                        success: (user, shedule, selectedLesson) {
                          return user.firstName[0] + user.lastName[0];
                        },
                        orElse: () => "A",
                      ),
                      size: 44,
                      borderColor: AppTheme.of(context).colorScheme.secondary,
                      fillColor: Colors.white.withOpacity(0.5),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 36,
                  child: TextField(
                    style: AppTheme.of(context).textTheme.displayLarge,
                    onChanged: (value) {
                      BlocProvider.of<SearchCubit>(context).search(value);
                    },
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(200),
                      ),
                      hintText: 'Поиск',
                      hintStyle: AppTheme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 44,
              )
            ],
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 10),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 15,
              ),
              ...ObjectType.values
                  .sublist(1)
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: CategoryButton(
                        onTap: () {
                          BlocProvider.of<SearchCubit>(context)
                              .searchByObjectType(e.index);
                        },
                        name: e.name,
                        icon: Icon(
                          e.iconData,
                          color: AppTheme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    searchSuccess: (results) {
                      return Column(
                        children: results.results
                            .map(
                              (e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: BlocBuilder<UserBloc, UserState>(
                                  builder: (context, state) {
                                    return SearchResultElement(
                                      text: e.title,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => ObjectCardPage(
                                              objectId: e.id,
                                              onRouteCreatePressed: () {
                                                BlocProvider.of<MapBloc>(
                                                        context)
                                                    .add(
                                                  RouteCreated(to: e.id),
                                                );
                                                Navigator.pop(context);
                                              },
                                              showCommentsField: state.maybeMap(
                                                success: (value) =>
                                                    value.user.role == 2,
                                                orElse: () => false,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            )
                            .toList(),
                      );
                    },
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    orElse: () {
                      return Container();
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({Key? key, required this.name, this.icon, this.onTap})
      : super(key: key);
  final String name;
  final Widget? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppTheme.of(context).colorScheme.primary.withOpacity(0.33),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              if (icon != null) icon!,
              Text(
                name,
                style: AppTheme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
