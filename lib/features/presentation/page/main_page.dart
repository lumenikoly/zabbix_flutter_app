import 'package:zabbix_flutter_app/features/presentation/bloc/login_page_bloc/login_page_bloc.dart';
import 'package:zabbix_flutter_app/utils/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPageControls extends StatefulWidget {
  const LoginPageControls({
    Key key,
  }) : super(key: key);

  @override
  _LoginPageControls createState() => _LoginPageControls();
}

class _LoginPageControls extends State<LoginPageControls> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 20.0, color: Colors.black87);
    TextStyle hintStyle = TextStyle(color: Colors.black26);
    TextStyle titleStyle = TextStyle(
        fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: ,
      body: Text(""));
  }
}
