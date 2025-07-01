import 'package:flutter/material.dart';
import 'package:kakao_adfit_web/kakao_adfit_web.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Kakao Adfit Example')),
        body: Center(
          child: AdfitBannerWidget(
            adUnit: 'YOUR_AD_UNIT_ID',
            width: 320,
            height: 50,
          ),
        ),
      ),
    );
  }
}
