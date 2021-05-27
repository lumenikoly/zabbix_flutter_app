import 'package:zabbix_flutter_app/features/presentation/bloc/login_page_bloc/login_page_bloc.dart';
import 'package:zabbix_flutter_app/features/presentation/widgets/loading_widget.dart';
import 'package:zabbix_flutter_app/features/presentation/widgets/message_display.dart';
import 'package:zabbix_flutter_app/features/presentation/widgets/login_page_controls.dart';
import 'package:zabbix_flutter_app/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:zabbix_flutter_app/utils/colors_const.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  BlocProvider<LoginPageBloc> buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<LoginPageBloc>(),
        child: BlocBuilder<LoginPageBloc, LoginPageState>(
          // ignore: missing_return
          builder: (context, state) {
            if (state is EmptyLoginPage) {
              return LoginPageControls();
            } else if (state is LoadingLoginPage) {
              return LoadingWidget();
            } else if (state is LoadedLoginPage) {
              return Text("done!");
            } else if (state is ErrorLoginPage) {
              _onErrorAlert(context);
              return LoginPageControls();
            }
          },
        ));
  }

  _onErrorAlert(context) {
    Alert(
      context: context,
      title: "Ошибка",
      desc: "Не удалось подключиться к серверу!",
      buttons: [
        DialogButton(
          child: Text(
            "Закрыть",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => {},
          color: ColorsConst.ACCENT_COLOR,
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }
}
