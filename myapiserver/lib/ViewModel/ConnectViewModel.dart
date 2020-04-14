

import 'package:flutter/cupertino.dart';
import 'package:myapiserver/Model/RequestModel.dart';
import 'package:myapiserver/Model/Requests.dart';
import 'package:myapiserver/Repo/ConnectFetch.dart';

class ConnectViewModel with ChangeNotifier{
  List<RequestModel> _result;
  List<RequestModel> get result => _result;
  set result(List newList) => throw "ERRRRRRR Result";

  int startIndex = 1;

  int _endIndex = 100;
  int get endIndex => _endIndex;
  set endIndex(int index){
    if(index > 1000) _endIndex = 999;
    else _endIndex += index;
    notifyListeners();
  }

  void _connect() async{
    _result = await new ConnectFetch(
        url: new Requests(
          start: this.startIndex,
          end: this.endIndex
        ).url
    ).fetch();
    notifyListeners();
  }

  ConnectViewModel(){
    _connect();
  }
}