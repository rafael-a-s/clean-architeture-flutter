import 'package:clean_architeture_flutter/core/data/repositories/i_base.repository.dart';
import 'package:clean_architeture_flutter/features/data/model/user/user.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/user/user.entity.dart';

abstract class UserRepository
    extends IBaseRepository<User, UserModel, dynamic> {}
