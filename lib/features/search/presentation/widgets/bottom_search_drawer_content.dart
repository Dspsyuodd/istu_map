import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istu_map/config/enums/object_type.dart';
import 'package:istu_map/features/object_card/presentation/pages/object_card_page.dart';
import 'package:istu_map/features/search/presentation/cubit/search_cubit.dart';
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
                child: Avatar(
                  text: '',
                  size: 44,
                  borderColor: AppTheme.of(context).colorScheme.secondary,
                  fillColor: Colors.white.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 36,
                  child: TextField(
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
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white.withOpacity(0.7),
                      ),
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
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            BlocProvider.value(
                                          value: BlocProvider.of<UserBloc>(
                                              context),
                                          child: ObjectCardPage(
                                            objectId: e.id,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppTheme.of(context)
                                              .colorScheme
                                              .secondary
                                              .withOpacity(0.6),
                                        ),
                                        height: 50,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14),
                                            child: Text(
                                              e.title,
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, right: 9),
                                          child: RotatedBox(
                                            quarterTurns: 1,
                                            child: InkWell(
                                              child: Icon(
                                                Icons.assistant_navigation,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
              Text(name),
            ],
          ),
        ),
      ),
    );
  }
}
