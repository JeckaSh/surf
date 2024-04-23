import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/pages/cheque_page.dart';
import 'package:surf_flutter_courses_template/pages/empty_page.dart';
import 'package:surf_flutter_courses_template/style/colors.dart';

/// Главный экран с вкладками
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 3;

  void _changeIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = const [
    EmptyPage(
      title: 'Page A',
    ),
    EmptyPage(
      title: 'Page B',
    ),
    EmptyPage(
      title: 'Page C',
    ),
    ChequePage(id: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changeIndex,
        unselectedItemColor: MyAppColors.dateTimeTextColor,
        selectedItemColor: MyAppColors.appBarColorSelected,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: 'Каталог',
            icon: Icon(Icons.article_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Поиск',
            icon: Icon(Icons.search_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Корзина',
            icon: Icon(Icons.local_mall_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Личное',
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}
