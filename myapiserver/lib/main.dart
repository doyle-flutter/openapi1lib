import 'package:myapiserver/View/MainPage.dart';
import 'package:myapiserver/ViewModel/ConnectViewModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<ConnectViewModel>(
        create: (_) => new ConnectViewModel(),
      ),
    ],
    child: MaterialApp(
      home: MainPage(),
    ),
  )

);