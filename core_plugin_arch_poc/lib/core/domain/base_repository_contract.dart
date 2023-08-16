part of 'base.domain.dart';

abstract class BaseRepositoryContract {
  BaseRepositoryContract(this.dataSource);

  final BaseDataSource dataSource;
}
