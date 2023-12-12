import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/auth_user.dart';
import 'package:clean_architeture_flutter/features/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase extends Usecase<AuthUser, TwoInputParams<String, String>> {
  late final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  @override
  Future<Either<Failure, AuthUser>> call(
      TwoInputParams<String, String> params) async {
    final cpf = params.input1;
    final password = params.input2;

    return params.props.isNotEmpty
        ? await authRepository.token(cpf, password)
        : Left(NullParamFailure());
  }
}
