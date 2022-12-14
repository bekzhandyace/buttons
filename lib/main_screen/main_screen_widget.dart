import 'package:buttons/widgets/auth/movie_list/test.dart';
import 'package:flutter/material.dart';

import '../widgets/auth/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTap = 0;

  void onSelectTap(int index) {
    setState(() {
      _selectedTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TMBD'),
      ),
      body: IndexedStack(
        index: _selectedTap,
        children: [
          Text(
            'News',
          ),
          MovieListWidget(),
          Text(
            'Serials',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'News'),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter), label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Serials'),
        ],
        onTap: onSelectTap,
      ),
    );
  }
}
