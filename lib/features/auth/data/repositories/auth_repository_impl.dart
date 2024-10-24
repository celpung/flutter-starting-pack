// data/repositories/auth_repository_impl.dart
import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote_auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, AuthEntity>> login(
      String email, String password) async {
    try {
      final authModel = await remoteDataSource.login(email, password);
      return Right(authModel);
    } on ServerException {
      return Left(ServerFailure('Server Error'));
    } on NetworkException {
      return Left(NetworkFailure('No Internet Connection'));
    } catch (e) {
      return Left(Failure('Unexpected Error: $e'));
    }
  }
}
