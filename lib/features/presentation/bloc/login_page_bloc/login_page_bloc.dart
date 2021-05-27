import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:zabbix_flutter_app/core/error/failure.dart';
import 'package:zabbix_flutter_app/features/domain/entities/user.dart';
import 'package:zabbix_flutter_app/features/domain/usecase/get_auth_key.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  final GetAuthKey _getAuthKey;

  LoginPageBloc({@required GetAuthKey getAuthKey})
      : _getAuthKey = getAuthKey,
        super(EmptyLoginPage());

  @override
  LoginPageState get initialState => EmptyLoginPage();

  @override
  Stream<LoginPageState> mapEventToState(
    LoginPageEvent event,
  ) async* {
    if (event is GetAuthKeyEvent) {
      print(event.user.getName());

      yield LoadingLoginPage();
      final failureOrKey = await _getAuthKey(Params(event.user));
      yield* _eitherLoadedOrErrorState(failureOrKey);
    }
  }

  Stream<LoginPageState> _eitherLoadedOrErrorState(
    Either<Failure, String> failureOrAllPetsList,
  ) async* {
    yield failureOrAllPetsList.fold(
      (failure) => ErrorLoginPage(message: _mapFailureToMessage(failure)),
      (user) => LoadedLoginPage(),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
