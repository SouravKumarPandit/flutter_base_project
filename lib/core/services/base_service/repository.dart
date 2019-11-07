//
//import 'package:flutter_base_project/core/models/user.dart';
//import 'package:flutter_base_project/core/services/news_api_provider.dart';
//import 'package:flutter_base_project/core/services/news_db_provider.dart';
//
//class Repository {
//  List<Source> sources = <Source>[
//    newsDbProvider,
//    NewsApiProvider(),
//  ];
//  List<Cache> caches = <Cache>[
//    newsDbProvider,
//  ];
//
//  // Iterate over sources when dbprovider
//  // get fetchTopIds implemented
//  Future<List<int>> fetchTopIds() {
//    return sources[1].fetchTopIds();
//  }
//
//  Future<User> fetchItem(int id) async {
//    User item;
//    var source;
//
//    for (source in sources) {
//      item = await source.fetchItem(id);
//      if (item != null) {
//        break;
//      }
//    }
//
//    for (var cache in caches) {
//      if (cache != source) {
//        cache.addItem(item);
//      }
//    }
//
//    return item;
//  }
//
//  clearCache() async {
//    for (var cache in caches) {
//      await cache.clear();
//    }
//  }
//}
//
//abstract class Source {
//  Future<List<int>> fetchTopIds();
//  Future<User> fetchItem(int id);
//}
//
//abstract class Cache {
//  Future<int> addItem(User item);
//  Future<int> clear();
//}