import 'package:com.ci.flutter/data/network/network.dart';

class HomeRepository {
  final Network _network;

  HomeRepository(this._network);

  //example call api to get data
  Future<String> getData() async {
//    _network.get(url: "");
    await Future.delayed((Duration(seconds: 3)));
    return "Data loaded";
  }
}
