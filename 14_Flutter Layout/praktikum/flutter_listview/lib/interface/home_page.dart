import 'package:flutter/material.dart';
import 'package:flutter_listview/models/data_listView.dart';
import 'package:flutter_listview/models/data_gridView.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(
      () {
        _selectedNavbar = index;
      },
    );
  }

  Widget _getWidget() {
    if (_selectedNavbar == 1) {
      return GridPage();
    } else {
      return ListPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List & Grid'),
      ),
      body: _getWidget(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'ListView',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'GridView',
          ),
        ],
        currentIndex: _selectedNavbar,
        unselectedItemColor: Colors.grey,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool isDescending = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: () => setState(() => isDescending = !isDescending),
          icon: const RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.compare_arrows_sharp,
              size: 23,
            ),
          ),
          label: Text(
            "Sort",
            style: TextStyle(fontSize: 17),
          ),
        ),
        Expanded(child: buildList()),
      ],
    );
  }

  Widget buildList() => ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          final sortedUsers = users
            ..sort((a, b) => isDescending
                ? b.name.compareTo(a.name)
                : a.name.compareTo(b.name));
          final User user = sortedUsers[index];
          return GestureDetector(
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 2,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 23,
                  child: Text(
                    user.name.substring(0, 1),
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                title: Text(user.name),
                subtitle: Text(
                  user.telp.toString().replaceRange(0, 0, '+62 '),
                ),
              ),
            ),
          );
        },
      );
}

class GridPage extends StatefulWidget {
  const GridPage({Key? key}) : super(key: key);

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  double _currentSliderValue = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Slider(
              value: _currentSliderValue,
              min: 1,
              max: 6,
              divisions: 5,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              }),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: GridView.count(
              crossAxisCount: _currentSliderValue.toInt(),
              children: List.generate(
                items.length,
                (index) {
                  return Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 30,
                      child: Icon(items[index].icon),
                    ),
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
