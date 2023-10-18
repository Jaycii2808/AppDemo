import 'package:app_demo/src/core/base_response.dart';
import 'package:app_demo/src/data/model/example_response.dart';
import 'package:dartz/dartz.dart';

abstract class ExampleRepository {
  Future<Either<Exception, BaseResponse<ExampleResponse>>> getExample();
}
