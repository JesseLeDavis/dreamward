import 'package:injectable/injectable.dart';

import '../database/app_database.dart';

@module
abstract class DatabaseModule {
  /// Registers AppDatabase as a singleton so all DAOs share one connection
  /// and drift's WAL journal functions correctly.
  @singleton
  AppDatabase get appDatabase => AppDatabase(openAppDatabase());
}
