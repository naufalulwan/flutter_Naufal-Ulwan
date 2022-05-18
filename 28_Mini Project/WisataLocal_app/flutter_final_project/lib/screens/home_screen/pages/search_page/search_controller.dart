import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchController extends GetxController {
  List<String> _searchHistory = [];

  RxList filteredSearchHistory = [].obs;

  RxString selectedTerm = ''.obs;

  FloatingSearchBarController controller = FloatingSearchBarController();

  @override
  void onInit() {
    filteredSearchHistory.value = filterSearchTerms();
    getPreference();
    super.onInit();
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
    filteredSearchHistory.value = filterSearchTerms();
    setPreferenced();
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory.value = filterSearchTerms();
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
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
