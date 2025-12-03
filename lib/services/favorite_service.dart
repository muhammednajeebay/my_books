import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {
  static const String _favoritesKey = 'favorites_list';
  Future<void> setFavorites({required String id}) async {
    try {
      // Save to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final list = prefs.getStringList(_favoritesKey) ?? [];

      list.add(id);

      prefs.setStringList(_favoritesKey, list);
    } catch (e) {
      return;
    }
  }

  Future<List<String>> getFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final list = prefs.getStringList(_favoritesKey) ?? [];
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<void> onRemove({required String id}) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_favoritesKey) ?? [];

    list.remove(id);

    prefs.setStringList(_favoritesKey, list);
  }
}
