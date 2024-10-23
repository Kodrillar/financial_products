import 'dart:io';

import 'package:financial_products/src/features/auth/domain/model/app_user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

part 'local_auth.g.dart';

class LocalAuthRepository {
  LocalAuthRepository(Database database) : _database = database;

  final StoreRef _storeRef = StoreRef.main();

  final String _appUserStoreKey = 'app_user';

  final Database _database;

  static Future<Database> _createDatabase() async {
    final Directory appDocDir = await getApplicationCacheDirectory();
    const String databaseName = 'finance_app.db';
    return databaseFactoryIo.openDatabase('${appDocDir.path}/$databaseName');
  }

  static Future<LocalAuthRepository> initialize() async =>
      LocalAuthRepository(await _createDatabase());

  Future<void> addAppUser(AppUser appUser) async =>
      _storeRef.record(_appUserStoreKey).add(_database, appUser.toMap());

  Future<void> deleteAppUser() async =>
      await _storeRef.record(_appUserStoreKey).delete(_database);

  Stream<AppUser?> authStateChanges() {
    return _storeRef
        .record(_appUserStoreKey)
        .onSnapshot(_database)
        .map((recordSnapshot) {
      if (recordSnapshot != null) {
        final appUserData = recordSnapshot.value;

        return AppUser.fromJson(appUserData);
      }
      return null;
    });
  }
}

@Riverpod(keepAlive: true)
Future<LocalAuthRepository> localAuthRepository(LocalAuthRepositoryRef ref) =>
    LocalAuthRepository.initialize();

@Riverpod(keepAlive: true)
Stream<AppUser?> localAuthStateChanges(LocalAuthStateChangesRef ref) =>
    ref.watch(localAuthRepositoryProvider).requireValue.authStateChanges();
