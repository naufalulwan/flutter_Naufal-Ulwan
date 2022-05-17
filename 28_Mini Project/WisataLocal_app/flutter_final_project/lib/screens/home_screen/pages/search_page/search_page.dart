import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> _searchHistory = [];

  List<String> filteredSearchHistory = [];

  String? selectedTerm;

  late FloatingSearchBarController controller;

  @override
  void initState() {
    controller = FloatingSearchBarController();

    filteredSearchHistory = filterSearchTerms();
    getPreference();
    super.initState();
  }

  List<String> filterSearchTerms({
    String? filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }
    _searchHistory.add(term);
    filteredSearchHistory = filterSearchTerms();
    setPreferenced();
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms();
    setPreferenced();
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
    setPreferenced();
  }

  Future<void> setPreferenced() async {
    SharedPreferences getPerfs = await SharedPreferences.getInstance();
    await getPerfs.setStringList("searchHistory", filterSearchTerms());
  }

  Future<void> getPreference() async {
    SharedPreferences setPerfs = await SharedPreferences.getInstance();
    List<String>? putResult = setPerfs.getStringList("searchHistory");
    if (putResult != null) {
      _searchHistory = putResult;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: buildFloatingSearchBar(context),
    );
  }

  Widget buildFloatingSearchBar(context) {
    return FloatingSearchBar(
      controller: controller,
      clearQueryOnClose: false,
      margins: const EdgeInsets.only(top: 20),
      hint: 'Cari...',
      scrollPadding: const EdgeInsets.symmetric(vertical: 10),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      automaticallyImplyDrawerHamburger: false,
      title: Text(
        selectedTerm == null ? 'Cari Destinasi Kamu' : selectedTerm!,
      ),
      automaticallyImplyBackButton: false,
      width: MediaQuery.of(context).size.width / 1.05,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        setState(() {
          filteredSearchHistory = filterSearchTerms(filter: query);
        });
      },
      onSubmitted: (query) {
        setState(() {
          if (query.isEmpty) {
            print('Search bar kosong!');
            selectedTerm;
          } else {
            addSearchTerm(query);
            selectedTerm = query;
          }
        });
        controller.close();
      },
      transition: CircularFloatingSearchBarTransition(),
      leadingActions: [
        FloatingSearchBarAction.back(),
      ],
      actions: [
        selectedTerm != null
            ? FloatingSearchBarAction.icon(
                icon: Icons.clear,
                showIfOpened: true,
                onTap: () {
                  setState(() {
                    controller.clear();
                    selectedTerm = null;
                  });
                })
            : FloatingSearchBarAction.searchToClear(
                showIfClosed: true,
              ),
      ],
      builder: ((context, transition) {
        return buildHistoryCard();
      }),
    );
  }

  Widget buildHistoryCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: Colors.white,
        elevation: 4,
        child: SizedBox(
          height: filteredSearchHistory.length > 5 ? 280 : null,
          child: Builder(
            builder: (context) {
              if (filteredSearchHistory.isEmpty && controller.query.isEmpty) {
                return Container(
                  height: 55,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    'Mulai Menjelajah',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption,
                  ),
                );
              } else if (filteredSearchHistory.isEmpty) {
                return ListTile(
                  title: Text(controller.query),
                  leading: const Icon(Icons.search),
                  onTap: () {
                    setState(() {
                      addSearchTerm(controller.query);
                      selectedTerm = controller.query;
                    });
                    controller.close();
                  },
                );
              } else {
                return buildHistoryField();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildHistoryField() {
    return FutureBuilder(
      future: getPreference(),
      builder: ((context, _) => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: filteredSearchHistory
                  .map(
                    (term) => ListTile(
                      title: Text(
                        term,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: const Icon(Icons.history),
                      trailing: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            deleteSearchTerm(term);
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          putSearchTermFirst(term);
                          selectedTerm = term;
                        });
                        controller.close();
                      },
                    ),
                  )
                  .toList(),
            ),
          )),
    );
  }
}
