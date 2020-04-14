import 'package:android_intent/android_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocation/geolocation.dart';
import 'package:myapiserver/Model/RequestModel.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class DetailPage extends StatelessWidget {

  RequestModel model;
  DetailPage({@required this.model})
    : assert(model != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("뒤로가기"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(bottom: 80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _titleWidget(title: model.LBRRY_NAME),
                _contentsWidget(des: "${_cleanValue(target: model.LBRRY_INTRCN)} \n\n *교통 편의안내 \n\n ${_cleanValue(target: model.TFCMN)}",context: context),
                _rowLayOut(context: context, item: [
                  RaisedButton(child: Text("홈페이지"), onPressed: () => _webView(model: model),),
                  RaisedButton(child: Text("길찾기"), onPressed: () => _displayMapInGoogleMaps(model: model))]),
                _rowLayOut(item: [ Text("휴일"), Text(model.FDRM_CLOSE_DATE) ], context: context),
                _rowLayOut(item: [ Text("전화"), Text(model.TEL_NO) ], context: context),
                _rowLayOut(item: [ Text("휴일"), Text(model.FDRM_CLOSE_DATE) ], context: context),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.call),
        onPressed: () => _call(model: model),
      ),
    );
  }

  Widget _titleWidget({@required String title}) => Container(
    padding: EdgeInsets.all(10.0),
    child: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22.0
      ),
    ),
  );

  Widget _contentsWidget({@required BuildContext context, @required String des}) => Card(
    child: Container(
      width: MediaQuery.of(context).size.width*0.8,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      padding: EdgeInsets.all(10.0),
      child: Text(des),
    )
  );

  String _cleanValue({@required String target}) => target == ""
  ? "길찾기를 이용해주세요"
  : target
    .replaceAll("<p>", "")
    .replaceAll("<\/p>", "")
    // .replaceAll("\\n", "")
    .replaceAll("\\r", "");

  Widget _rowLayOut({@required List<Widget> item, @required BuildContext context}) => Container(
    width: MediaQuery.of(context).size.width*0.8,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: item.map((e) => Flexible(
        child: e,
      )).toList()
    ),
  );

  void _call({@required RequestModel model}) => FlutterPhoneDirectCaller.callNumber("02-1234-1234");

  void _displayMapInGoogleMaps({@required RequestModel model}) async{
    final List<Location> result = await enableLocationServices();
    AndroidIntent(
        action: 'action_view',
        data: Uri.encodeFull('http://maps.google.com/maps?saddr=${result[0].latitude},${result[0].longitude}&daddr=${model.XCNTS},${model.YDNTS}'),
        package: 'com.google.android.apps.maps'
    )..launch();
  }

  Future<List<Location>> enableLocationServices() async {
    return Geolocation.enableLocationServices().then((result) async{
      LocationResult res = await Geolocation.lastKnownLocation();
      return res.locations;
    }).catchError((e) {
      print("ERR");
    });
  }
  void _webView({@required RequestModel model}) => AndroidIntent(
      action: 'action_view',
      data: Uri.encodeFull(model.HMPG_URL),
      package: 'com.android.chrome'
    )..launch();


}
