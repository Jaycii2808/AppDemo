import 'package:app_demo/src/core/base_response.dart';
import 'package:app_demo/src/data/data_sources/remote/example_remote_data_source.dart';
import 'package:app_demo/src/data/model/example_response.dart';
import 'package:app_demo/src/domain/repositories/example_repository.dart';
import 'package:dartz/dartz.dart';

class ExampleRepositoryImpl extends ExampleRepository {
  final ExampleRemoteDataSource remoteDataSource;

  ExampleRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Exception, BaseResponse<ExampleResponse>>> getExample() {
    return remoteDataSource.getExample();
  }
}
