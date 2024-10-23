// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_auth.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localAuthRepositoryHash() =>
    r'3daf17f7e88d5211b63b406f2f3d4559ef962e8f';

/// See also [localAuthRepository].
@ProviderFor(localAuthRepository)
final localAuthRepositoryProvider =
    FutureProvider<LocalAuthRepository>.internal(
  localAuthRepository,
  name: r'localAuthRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localAuthRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocalAuthRepositoryRef = FutureProviderRef<LocalAuthRepository>;
String _$localAuthStateChangesHash() =>
    r'f8f007b274a9c9e148524f067fbb09ff88eeb743';

/// See also [localAuthStateChanges].
@ProviderFor(localAuthStateChanges)
final localAuthStateChangesProvider = StreamProvider<AppUser?>.internal(
  localAuthStateChanges,
  name: r'localAuthStateChangesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localAuthStateChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocalAuthStateChangesRef = StreamProviderRef<AppUser?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
