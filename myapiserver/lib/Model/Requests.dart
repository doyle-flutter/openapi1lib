import 'package:myapiserver/key.dart';

class Requests{

  int start;
  int end;

  Requests({
    this.start = 1,
    this.end = 100
  });

  final String _endPoint = "http://openapi.seoul.go.kr:8088";
  set endPoint(String v) => throw 'EREREREER NO URL END';

  final String _type = 'json';
  set type(String v) => throw 'EREREREER NO URL TYPE';

  final String _path = 'SeoulDisableLibraryInfo';
  set path(String v) => throw 'EREREREER NO URL PATH';

  String get url => "$_endPoint/$key/$_type/$_path/$start/$end/";
  set url(String v) => throw 'EREREREER NO URL SETTER';

}