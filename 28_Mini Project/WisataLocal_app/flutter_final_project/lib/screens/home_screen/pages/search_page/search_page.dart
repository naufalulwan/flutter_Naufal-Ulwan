import 'package:flutter/material.dart';
import 'package:flutter_final_project/screens/home_screen/pages/search_page/search_controller.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final SearchController _searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: buildFloatingSearchBar(context),
    );
  }

  Widget buildFloatingSearchBar(context) {
    return Obx(
      () => FloatingSearchBar(
        controller: _searchController.controller,
        clearQueryOnClose: false,
        margins: const EdgeInsets.only(top: 20),
        hint: 'Cari...',
        scrollPadding: const EdgeInsets.symmetric(vertical: 10),
        transitionDuration: const Duration(milliseconds: 800),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        automaticallyImplyDrawerHamburger: false,
        title: Text(
          _searchController.selectedTerm.value == ''
              ? 'Cari Destinasi Kamu'
              : _searchController.selectedTerm.value,
        ),
        automaticallyImplyBackButton: false,
        width: MediaQuery.of(context).size.width / 1.05,
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: (query) {
          _searchController.filteredSearchHistory.value =
              _searchController.filterSearchTerms(filter: query);
        },
        onSubmitted: (query) {
          if (query.isEmpty) {
            print('Search bar kosong!');
            _searchController.selectedTerm.value;
          } else {
            _searchController.addSearchTerm(query);
            _searchController.selectedTerm.value = query;
          }

          _searchController.controller.close();
        },
        transition: CircularFloatingSearchBarTransition(),
        leadingActions: [
          FloatingSearchBarAction.back(),
        ],
        actions: [
          _searchController.selectedTerm.value != ''
              ? FloatingSearchBarAction.icon(
                  icon: Icons.clear,
                  showIfOpened: true,
                  onTap: () {
                    _searchController.controller.clear();
                    _searchController.selectedTerm.value = '';
                  })
              : FloatingSearchBarAction.searchToClear(
                  showIfClosed: true,
                ),
        ],
        builder: ((context, transition) {
          return buildHistoryCard();
        }),
      ),
    );
  }

  Widget buildHistoryCard() {
    return Obx(
      () => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Material(
          color: Colors.white,
          elevation: 4,
          child: SizedBox(
            height:
                _searchController.filteredSearchHistory.length > 5 ? 280 : null,
            child: Builder(
              builder: (context) {
                if (_searchController.filteredSearchHistory.isEmpty &&
                    _searchController.controller.query.isEmpty) {
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
                } else if (_searchController.filteredSearchHistory.isEmpty) {
                  return ListTile(
                    title: Text(_searchController.controller.query),
                    leading: const Icon(Icons.search),
                    onTap: () {
                      _searchController
                          .addSearchTerm(_searchController.controller.query);
                      _searchController.selectedTerm.value =
                          _searchController.controller.query;

                      _searchController.controller.close();
                    },
                  );
                } else {
                  return buildHistoryField();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHistoryField() {
    return Obx(() => SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _searchController.filteredSearchHistory
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
                        _searchController.deleteSearchTerm(term);
                      },
                    ),
                    onTap: () {
                      _searchController.putSearchTermFirst(term);
                      _searchController.selectedTerm.value = term;

                      _searchController.controller.close();
                    },
                  ),
                )
                .toList(),
          ),
        ));
  }
}
