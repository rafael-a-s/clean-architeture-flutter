import 'package:clean_architeture_flutter/core/domain/base_model.convert.dart';
import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/features/data/datasource/auth/auth.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/auth_user.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/auth_user.dart';
import 'package:clean_architeture_flutter/features/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ModelConvert<AuthUser, AuthUserModel> modelConvert = ModelConvert(
    fromEntity: (data) => AuthUser(
      id: data.id,
      name: data.name,
      cpf: data.cpf,
      acessToken: data.acessToken,
      roles: data.roles.map((value) => value).toSet(),
    ),
    toModel: ((entity) => AuthUserModel(
          id: entity.id,
          name: entity.name,
          cpf: entity.cpf,
          acessToken: entity.acessToken,
          roles: entity.roles.map((value) => value).toSet(),
        )),
  );

  final AuthDatasource _datasource;

  AuthRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, AuthUser>> token(String cpf, String password) {
    // TODO: implement token
    throw UnimplementedError();
  }

  @override
  AuthDatasource get datasource => _datasource;
}
