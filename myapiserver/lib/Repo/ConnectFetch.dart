import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:myapiserver/Model/RequestModel.dart';

class ConnectFetch{

  String url;
  ConnectFetch({@required this.url});

  Future<List<RequestModel>> fetch() async{
    var res = await http.get(this.url);
    return _parse(resBody: json.decode(res.body)['SeoulDisableLibraryInfo']['row']);
  }
  List<RequestModel> _parse({List resBody}) => resBody.map((json) => RequestModel.toJson(json)).toList();
}

