// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LocalFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sharedPreferences,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sharedPreferences,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sharedPreferences,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SharedPreferences value) sharedPreferences,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SharedPreferences value)? sharedPreferences,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SharedPreferences value)? sharedPreferences,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalFailureCopyWith<$Res> {
  factory $LocalFailureCopyWith(
    LocalFailure value,
    $Res Function(LocalFailure) then,
  ) = _$LocalFailureCopyWithImpl<$Res, LocalFailure>;
}

/// @nodoc
class _$LocalFailureCopyWithImpl<$Res, $Val extends LocalFailure>
    implements $LocalFailureCopyWith<$Res> {
  _$LocalFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SharedPreferencesImplCopyWith<$Res> {
  factory _$$SharedPreferencesImplCopyWith(
    _$SharedPreferencesImpl value,
    $Res Function(_$SharedPreferencesImpl) then,
  ) = __$$SharedPreferencesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SharedPreferencesImplCopyWithImpl<$Res>
    extends _$LocalFailureCopyWithImpl<$Res, _$SharedPreferencesImpl>
    implements _$$SharedPreferencesImplCopyWith<$Res> {
  __$$SharedPreferencesImplCopyWithImpl(
    _$SharedPreferencesImpl _value,
    $Res Function(_$SharedPreferencesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocalFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SharedPreferencesImpl implements _SharedPreferences {
  _$SharedPreferencesImpl();

  @override
  String toString() {
    return 'LocalFailure.sharedPreferences()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SharedPreferencesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sharedPreferences,
  }) {
    return sharedPreferences();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sharedPreferences,
  }) {
    return sharedPreferences?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sharedPreferences,
    required TResult orElse(),
  }) {
    if (sharedPreferences != null) {
      return sharedPreferences();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SharedPreferences value) sharedPreferences,
  }) {
    return sharedPreferences(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SharedPreferences value)? sharedPreferences,
  }) {
    return sharedPreferences?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SharedPreferences value)? sharedPreferences,
    required TResult orElse(),
  }) {
    if (sharedPreferences != null) {
      return sharedPreferences(this);
    }
    return orElse();
  }
}

abstract class _SharedPreferences implements LocalFailure {
  factory _SharedPreferences() = _$SharedPreferencesImpl;
}
