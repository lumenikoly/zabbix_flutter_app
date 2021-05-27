import 'dart:io';

import 'package:zabbix_flutter_app/core/error/exception.dart';
import 'package:zabbix_flutter_app/core/platform/network_info.dart';
import 'package:zabbix_flutter_app/features/data/datasources/local_data_source.dart';
import 'package:zabbix_flutter_app/features/data/datasources/remote_data_source.dart';
import 'package:zabbix_flutter_app/features/data/models/event_model.dart';
import 'package:zabbix_flutter_app/features/domain/entities/pet.dart';
import 'package:zabbix_flutter_app/core/error/failure.dart';
import 'package:zabbix_flutter_app/features/domain/entities/price.dart';
import 'package:zabbix_flutter_app/features/domain/entities/user.dart';
import 'package:zabbix_flutter_app/features/domain/entities/visitor.dart';
import 'package:zabbix_flutter_app/features/domain/repositories/repository.dart';
import 'package:zabbix_flutter_app/features/domain/usecase/get_auth_key.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/src/response.dart';

///Реализация репозитория
class RepositoryImpl implements Repository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSources;
  final NetworkInfo networkInfo;

  RepositoryImpl(
      {@required this.localDataSource,
      @required this.remoteDataSources,
      @required this.networkInfo});

  ///Если имеется интернет соединение делает запрос к серверу
  ///В случае успешного запроса возвращает [PetsList], в случае ошибки возвращает [ServerFailure]
  ///Если интернет соединения нет, делает запрос к локальному хранилищу
  ///В случае успешного запроса возвращает [PetsList], в случае ошибки возвращает [CacheFailure]
  @override
  Future<Either<Failure, List<Pet>>> getAllPets() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePets = await remoteDataSources.getAllPets();
        // localDataSource.cachePetsList(remotePets);
        return Right(remotePets);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPets = await localDataSource.getLastPetsList();
        return Right(localPets);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  ///Если имеется интернет соединение - делает запрос к серверу
  ///В случае успешного запроса возвращает [List<EventModel>], в случае ошибки возвращает [ServerFailure]
  ///Если интернет соединения нет, делает запрос к локальному хранилищу
  ///В случае успешного запроса возвращает [List<EventModel>], в случае ошибки возвращает [CacheFailure]
  @override
  Future<Either<Failure, List<EventModel>>> getAllEvents() async {
    if (await networkInfo.isConnected) {
      try {
        final allEvents = await remoteDataSources.getAllEvents();
        // localDataSource.cachePetsList(remotePets);
        return Right(allEvents);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final allChacheEvents = await localDataSource.getLastEventsList();
        return Right(allChacheEvents);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, String>> getAuthKey(User user) async {
    print(user.getName());
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSources.getAuthKey(user);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      } on SocketException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Price>>> getPrices() {
    remoteDataSources.getPrices();
    localDataSource.getLastPricesList();
    throw UnimplementedError();
  }
}
