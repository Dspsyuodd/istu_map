import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:istu_map/app/ui/avatar.dart';

class Category {
  final String name;
  final int icon;

  Category({required this.name, required this.icon});
}

final categories = {
  Category(name: 'Аудитории', icon: Icons.school_outlined.codePoint),
  Category(name: 'Преподаватели', icon: Icons.person_outlined.codePoint),
  Category(name: 'Столовые', icon: Icons.restaurant_outlined.codePoint),
  Category(name: 'Уборные', icon: Icons.wc_outlined.codePoint),
  Category(name: 'Уборные', icon: Icons.wc_outlined.codePoint),
  Category(name: 'Уборные', icon: Icons.wc_outlined.codePoint),
  Category(name: 'Уборные', icon: Icons.wc_outlined.codePoint),
};

final searchResults = [
  'Результат поиска',
  'Результат поиска',
  'Результат поиска',
  'Результат поиска',
  'Результат поиска',
  'Результат поиска',
  'Результат поиска',
  'Результат поиска',
  'Результат поиска',
  'Результат поиска',
];

class BottomSearchDrawerContent extends StatefulWidget {
  const BottomSearchDrawerContent({Key? key, this.focusNode}) : super(key: key);
  final FocusNode? focusNode;

  @override
  State<BottomSearchDrawerContent> createState() => _BottomSearchDrawerContentState();
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
                  size: 44,
                  borderColor: AppTheme.of(context).colorScheme.secondary,
                  fillColor: Colors.white.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(10000),
                    ),
                    child: TextField(
                        focusNode: _focusNode,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            border: InputBorder.none,
                            hintText: 'Поиск',
                            hintStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.7),
                            ))),
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
              ...categories
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: CategoryButton(
                        onTap: () {},
                        name: e.name,
                        icon: Icon(
                          IconData(e.icon, fontFamily: 'MaterialIcons'),
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
              child: Column(
                children: searchResults
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
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
                                    e,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10, right: 9),
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
                    )
                    .toList(),
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