import 'package:flutter/material.dart';
import 'package:myapiserver/View/DetailPage.dart';
import 'package:myapiserver/ViewModel/ConnectViewModel.dart';
import 'package:provider/provider.dart';
import 'package:geolocation/geolocation.dart';

class MainPage extends StatelessWidget {

  MainPage() {
    Geolocation.loggingEnabled = true;
  }

  @override
  Widget build(BuildContext context) {
    ConnectViewModel model = Provider.of<ConnectViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("서울 장애인 도서관 안내"),
        actions: <Widget>[
        ],
      ),
      body: (model?.result == null)
      ? Center(child: CircularProgressIndicator())
      : ListView.builder(
          itemCount: model.result.length,
          itemBuilder:(context, int index) => ListTile(
            leading: Text((index+1).toString()),
            title: Text(model.result[index].LBRRY_NAME),
            subtitle: Text(model.result[index].ADRES),
            trailing: Icon(Icons.arrow_right),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  model: model.result[index],
                )
              )
            ),
          )
      ),
    );
  }
}
