import 'package:progress_indicators/progress_indicators.dart';
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
  final controller = TextEditingController();
  final RegExp _regExp = RegExp(
      "^((http|https):\/\/)?(www\.)?([A-Za-zА-Яа-я0-9]{1}[A-Za-zА-Яа-я0-9\-]*\.?)*\.{1}[A-Za-zА-Яа-я0-9-]{2,8}(\/([\w#!:.?+=&%@!\-\/])*)?");
  RegExp _fieldRegex = RegExp("[A-Za-zА-Яа-я0-30-]+");
  String pass;
  String user;
  String zabbix;

  var _numberForm = GlobalKey<FormState>();

  bool isValidForm = false;

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 20.0, color: Colors.black87);
    TextStyle hintStyle = TextStyle(color: Colors.black26);
    TextStyle titleStyle = TextStyle(
        fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold);

    final _urlValidator = MultiValidator([
      RequiredValidator(errorText: 'Введите адрес!'),
      MaxLengthValidator(30, errorText: 'Введите коректный адрес!'),
      PatternValidator(_regExp, errorText: 'Введите коректный адрес!')
    ]);

    final zabbixURLField = TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (inputValue) {
        if (inputValue.isEmpty || !_regExp.hasMatch(inputValue)) {
          isValidForm = false;
          return "Введите адрес";
        }
        isValidForm = true;
        return null;
      },
      onChanged: (val) {
        zabbix = val;
      },
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

    final userField = TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (inputValue) {
        if (inputValue.isEmpty || !_fieldRegex.hasMatch(inputValue)) {
          isValidForm = false;
          return "Введите логин";
        }
        isValidForm = true;
        return null;
      },
      onChanged: (val) {
        user = val;
      },
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

    final passwordField = TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (inputValue) {
        if (inputValue.isEmpty || !_fieldRegex.hasMatch(inputValue)) {
          isValidForm = false;
          return "Введите пароль";
        }
        isValidForm = true;
        return null;
      },
      onChanged: (val) {
        pass = val;
      },
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

    void dispatchConcrete() {
      if (isValidForm) {
        BlocProvider.of<LoginPageBloc>(context)
            .add(GetAuthKeyEvent(zabbix, user, pass));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Введите данные!"),
          backgroundColor: Colors.redAccent.shade200,
        ));
      }
    }

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: ColorsConst.PRYMARY_COLOR,
      child: MaterialButton(
        minWidth: 250,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          dispatchConcrete();
        },
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
              child: Form(
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
      ),
    );
  }
}
