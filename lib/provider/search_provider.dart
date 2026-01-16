import 'package:dummy/postmodel.dart';
import 'package:dummy/repository/service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SearchProvider extends ChangeNotifier {
  final ServiceRepository serviceRepository = ServiceRepository();

  String query = '';
  List<PostModel> searchedpostsresult = [];
  bool isLoading = false;
  String errorMessage = '';
  final box = Hive.box('searchBox');

  /// Restore persisted state
  void restoreState() {
    query = box.get('query', defaultValue: '');
    final List stored = box.get('searchedpostsresult', defaultValue: []);
    searchedpostsresult = stored.map((e) => PostModel.fromJson(e)).toList();
    notifyListeners();
  }

  Future<void> search(String text) async {
    if (text == query && searchedpostsresult.isNotEmpty) return;
    query = text;
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      final results = await serviceRepository.fetchsearchdata(text);
      query = text;
      searchedpostsresult = results;

      box.put('query', query);
      box.put(
        'searchedpostsresult',
        searchedpostsresult.map((e) => e.toJson()).toList(),
      );
    } catch (e) {
      errorMessage = 'Error: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
