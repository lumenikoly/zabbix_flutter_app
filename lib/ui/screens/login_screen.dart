import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zabbix_flutter_app/utils/colors_const.dart';

class LoginScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    TextStyle style = TextStyle(fontSize: 20.0, color: Colors.black87);
    TextStyle hintStyle = TextStyle(color: Colors.black26);
    TextStyle titleStyle = TextStyle(
        fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold);

    final zabbixURLField = TextField(
      style: style,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: ColorsConst.PRYMARY_COLOR,
              width: 2.0,
            ),
          ),
          filled: true,
          fillColor: Colors.blue.shade100,
          prefixIcon: Icon(
            Icons.link,
            color: ColorsConst.PRYMARY_COLOR,
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "http://myzabbix.com",
          hintStyle: hintStyle,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );

    final userField = TextField(
      style: style,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: ColorsConst.PRYMARY_COLOR,
              width: 2.0,
            ),
          ),
          filled: true,
          fillColor: Colors.blue.shade100,
          prefixIcon: Icon(
            Icons.account_box,
            color: ColorsConst.PRYMARY_COLOR,
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Логин",
          hintStyle: hintStyle,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );

    final passwordField = TextField(
      style: style,
      obscureText: true,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: ColorsConst.PRYMARY_COLOR,
              width: 2.0,
            ),
          ),
          filled: true,
          fillColor: Colors.blue.shade100,
          prefixIcon: Icon(
            Icons.lock,
            color: ColorsConst.PRYMARY_COLOR,
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Пароль",
          hintStyle: hintStyle,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: ColorsConst.PRYMARY_COLOR,
      child: MaterialButton(
        minWidth: 250,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Подключиться",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [ColorsConst.BACK_COLOR, ColorsConst.PRYMARY_COLOR])),
          child: Container(
            width: 400,
            padding: const EdgeInsets.fromLTRB(36, 5, 36, 5),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Flutterix", style: titleStyle),
                  SizedBox(height: 25.0),
                  zabbixURLField,
                  SizedBox(height: 25.0),
                  userField,
                  SizedBox(height: 25.0),
                  passwordField,
                  SizedBox(
                    height: 35.0,
                  ),
                  loginButon,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
