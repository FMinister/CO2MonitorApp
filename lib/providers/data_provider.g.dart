// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dataHash() => r'24bdb5d48dc9d2591f2ce2e3889ed747e9be0cc1';

/// See also [Data].
@ProviderFor(Data)
final dataProvider =
    AutoDisposeAsyncNotifierProvider<Data, List<Co2Data>>.internal(
  Data.new,
  name: r'dataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Data = AutoDisposeAsyncNotifier<List<Co2Data>>;
String _$latestDataHash() => r'21eb2905a426025647412ac11da4ce2e40375e63';

/// See also [LatestData].
@ProviderFor(LatestData)
final latestDataProvider =
    AutoDisposeAsyncNotifierProvider<LatestData, Co2Data>.internal(
  LatestData.new,
  name: r'latestDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$latestDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LatestData = AutoDisposeAsyncNotifier<Co2Data>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions