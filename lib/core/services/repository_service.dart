import 'dart:async';

class RepositoryService {
  List<Source> sources = <Source>[
//    newsDbProvider,
//    NewsApiProvider(),
  ];
  List<Cache> caches = <Cache>[
//    newsDbProvider,
  ];

  // Iterate over sources when dbprovider
  // get fetchTopIds implemented
  Future<List<int>> fetchTopIds() {
  }

  clearCache() async {
    for (var cache in caches) {
      await cache.clear();
    }
  }
}

abstract class Source {
//  Future<List<int>> fetchTopIds();
//  Future<ItemModel> fetchItem(int id);
}

abstract class Cache {
//  Future<int> addItem(ItemModel item);
  Future<int> clear();
}
