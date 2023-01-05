import '../DataProvider/data_provider.dart';

class Repository {
  final DataProvider dataProvider;

  Repository({required this.dataProvider})
      // ignore: unnecessary_null_comparison
      : assert(dataProvider != null);
  Future<Object> fetchAllBanks() async {
    return await dataProvider.fetchAllBank();
  }
}
