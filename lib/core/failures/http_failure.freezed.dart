// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'http_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HttpFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function() notFound,
    required TResult Function() server,
    required TResult Function() forbidden,
    required TResult Function() unauthorized,
    required TResult Function(BadRequestModel dataError) badRequest,
    required TResult Function() local,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? network,
    TResult? Function()? notFound,
    TResult? Function()? server,
    TResult? Function()? forbidden,
    TResult? Function()? unauthorized,
    TResult? Function(BadRequestModel dataError)? badRequest,
    TResult? Function()? local,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function()? notFound,
    TResult Function()? server,
    TResult Function()? forbidden,
    TResult Function()? unauthorized,
    TResult Function(BadRequestModel dataError)? badRequest,
    TResult Function()? local,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Server value) server,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Local value) local,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Server value)? server,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Local value)? local,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Server value)? server,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Local value)? local,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpFailureCopyWith<$Res> {
  factory $HttpFailureCopyWith(
    HttpFailure value,
    $Res Function(HttpFailure) then,
  ) = _$HttpFailureCopyWithImpl<$Res, HttpFailure>;
}

/// @nodoc
class _$HttpFailureCopyWithImpl<$Res, $Val extends HttpFailure>
    implements $HttpFailureCopyWith<$Res> {
  _$HttpFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HttpFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NetworkImplCopyWith<$Res> {
  factory _$$NetworkImplCopyWith(
    _$NetworkImpl value,
    $Res Function(_$NetworkImpl) then,
  ) = __$$NetworkImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NetworkImplCopyWithImpl<$Res>
    extends _$HttpFailureCopyWithImpl<$Res, _$NetworkImpl>
    implements _$$NetworkImplCopyWith<$Res> {
  __$$NetworkImplCopyWithImpl(
    _$NetworkImpl _value,
    $Res Function(_$NetworkImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HttpFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NetworkImpl implements _Network {
  _$NetworkImpl();

  @override
  String toString() {
    return 'HttpFailure.network()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NetworkImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function() notFound,
    required TResult Function() server,
    required TResult Function() forbidden,
    required TResult Function() unauthorized,
    required TResult Function(BadRequestModel dataError) badRequest,
    required TResult Function() local,
  }) {
    return network();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? network,
    TResult? Function()? notFound,
    TResult? Function()? server,
    TResult? Function()? forbidden,
    TResult? Function()? unauthorized,
    TResult? Function(BadRequestModel dataError)? badRequest,
    TResult? Function()? local,
  }) {
    return network?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function()? notFound,
    TResult Function()? server,
    TResult Function()? forbidden,
    TResult Function()? unauthorized,
    TResult Function(BadRequestModel dataError)? badRequest,
    TResult Function()? local,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Server value) server,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Local value) local,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Server value)? server,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Local value)? local,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Server value)? server,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Local value)? local,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class _Network implements HttpFailure {
  factory _Network() = _$NetworkImpl;
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
    _$NotFoundImpl value,
    $Res Function(_$NotFoundImpl) then,
  ) = __$$NotFoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$HttpFailureCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
    _$NotFoundImpl _value,
    $Res Function(_$NotFoundImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HttpFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotFoundImpl implements _NotFound {
  _$NotFoundImpl();

  @override
  String toString() {
    return 'HttpFailure.notFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotFoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function() notFound,
    required TResult Function() server,
    required TResult Function() forbidden,
    required TResult Function() unauthorized,
    required TResult Function(BadRequestModel dataError) badRequest,
    required TResult Function() local,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? network,
    TResult? Function()? notFound,
    TResult? Function()? server,
    TResult? Function()? forbidden,
    TResult? Function()? unauthorized,
    TResult? Function(BadRequestModel dataError)? badRequest,
    TResult? Function()? local,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function()? notFound,
    TResult Function()? server,
    TResult Function()? forbidden,
    TResult Function()? unauthorized,
    TResult Function(BadRequestModel dataError)? badRequest,
    TResult Function()? local,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Server value) server,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Local value) local,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Server value)? server,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Local value)? local,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Server value)? server,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Local value)? local,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound implements HttpFailure {
  factory _NotFound() = _$NotFoundImpl;
}

/// @nodoc
abstract class _$$ServerImplCopyWith<$Res> {
  factory _$$ServerImplCopyWith(
    _$ServerImpl value,
    $Res Function(_$ServerImpl) then,
  ) = __$$ServerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerImplCopyWithImpl<$Res>
    extends _$HttpFailureCopyWithImpl<$Res, _$ServerImpl>
    implements _$$ServerImplCopyWith<$Res> {
  __$$ServerImplCopyWithImpl(
    _$ServerImpl _value,
    $Res Function(_$ServerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HttpFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ServerImpl implements _Server {
  _$ServerImpl();

  @override
  String toString() {
    return 'HttpFailure.server()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function() notFound,
    required TResult Function() server,
    required TResult Function() forbidden,
    required TResult Function() unauthorized,
    required TResult Function(BadRequestModel dataError) badRequest,
    required TResult Function() local,
  }) {
    return server();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? network,
    TResult? Function()? notFound,
    TResult? Function()? server,
    TResult? Function()? forbidden,
    TResult? Function()? unauthorized,
    TResult? Function(BadRequestModel dataError)? badRequest,
    TResult? Function()? local,
  }) {
    return server?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function()? notFound,
    TResult Function()? server,
    TResult Function()? forbidden,
    TResult Function()? unauthorized,
    TResult Function(BadRequestModel dataError)? badRequest,
    TResult Function()? local,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Server value) server,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Local value) local,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Server value)? server,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Local value)? local,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Server value)? server,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Local value)? local,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class _Server implements HttpFailure {
  factory _Server() = _$ServerImpl;
}

/// @nodoc
abstract class _$$ForbiddenImplCopyWith<$Res> {
  factory _$$ForbiddenImplCopyWith(
    _$ForbiddenImpl value,
    $Res Function(_$ForbiddenImpl) then,
  ) = __$$ForbiddenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ForbiddenImplCopyWithImpl<$Res>
    extends _$HttpFailureCopyWithImpl<$Res, _$ForbiddenImpl>
    implements _$$ForbiddenImplCopyWith<$Res> {
  __$$ForbiddenImplCopyWithImpl(
    _$ForbiddenImpl _value,
    $Res Function(_$ForbiddenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HttpFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ForbiddenImpl implements _Forbidden {
  _$ForbiddenImpl();

  @override
  String toString() {
    return 'HttpFailure.forbidden()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ForbiddenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function() notFound,
    required TResult Function() server,
    required TResult Function() forbidden,
    required TResult Function() unauthorized,
    required TResult Function(BadRequestModel dataError) badRequest,
    required TResult Function() local,
  }) {
    return forbidden();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? network,
    TResult? Function()? notFound,
    TResult? Function()? server,
    TResult? Function()? forbidden,
    TResult? Function()? unauthorized,
    TResult? Function(BadRequestModel dataError)? badRequest,
    TResult? Function()? local,
  }) {
    return forbidden?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function()? notFound,
    TResult Function()? server,
    TResult Function()? forbidden,
    TResult Function()? unauthorized,
    TResult Function(BadRequestModel dataError)? badRequest,
    TResult Function()? local,
    required TResult orElse(),
  }) {
    if (forbidden != null) {
      return forbidden();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Server value) server,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Local value) local,
  }) {
    return forbidden(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Server value)? server,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Local value)? local,
  }) {
    return forbidden?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Server value)? server,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Local value)? local,
    required TResult orElse(),
  }) {
    if (forbidden != null) {
      return forbidden(this);
    }
    return orElse();
  }
}

abstract class _Forbidden implements HttpFailure {
  factory _Forbidden() = _$ForbiddenImpl;
}

/// @nodoc
abstract class _$$UnauthorizedImplCopyWith<$Res> {
  factory _$$UnauthorizedImplCopyWith(
    _$UnauthorizedImpl value,
    $Res Function(_$UnauthorizedImpl) then,
  ) = __$$UnauthorizedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthorizedImplCopyWithImpl<$Res>
    extends _$HttpFailureCopyWithImpl<$Res, _$UnauthorizedImpl>
    implements _$$UnauthorizedImplCopyWith<$Res> {
  __$$UnauthorizedImplCopyWithImpl(
    _$UnauthorizedImpl _value,
    $Res Function(_$UnauthorizedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HttpFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnauthorizedImpl implements _Unauthorized {
  _$UnauthorizedImpl();

  @override
  String toString() {
    return 'HttpFailure.unauthorized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthorizedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function() notFound,
    required TResult Function() server,
    required TResult Function() forbidden,
    required TResult Function() unauthorized,
    required TResult Function(BadRequestModel dataError) badRequest,
    required TResult Function() local,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? network,
    TResult? Function()? notFound,
    TResult? Function()? server,
    TResult? Function()? forbidden,
    TResult? Function()? unauthorized,
    TResult? Function(BadRequestModel dataError)? badRequest,
    TResult? Function()? local,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function()? notFound,
    TResult Function()? server,
    TResult Function()? forbidden,
    TResult Function()? unauthorized,
    TResult Function(BadRequestModel dataError)? badRequest,
    TResult Function()? local,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Server value) server,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Local value) local,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Server value)? server,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Local value)? local,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Server value)? server,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Local value)? local,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _Unauthorized implements HttpFailure {
  factory _Unauthorized() = _$UnauthorizedImpl;
}

/// @nodoc
abstract class _$$BadRequestImplCopyWith<$Res> {
  factory _$$BadRequestImplCopyWith(
    _$BadRequestImpl value,
    $Res Function(_$BadRequestImpl) then,
  ) = __$$BadRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BadRequestModel dataError});
}

/// @nodoc
class __$$BadRequestImplCopyWithImpl<$Res>
    extends _$HttpFailureCopyWithImpl<$Res, _$BadRequestImpl>
    implements _$$BadRequestImplCopyWith<$Res> {
  __$$BadRequestImplCopyWithImpl(
    _$BadRequestImpl _value,
    $Res Function(_$BadRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HttpFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? dataError = null}) {
    return _then(
      _$BadRequestImpl(
        null == dataError
            ? _value.dataError
            : dataError // ignore: cast_nullable_to_non_nullable
                  as BadRequestModel,
      ),
    );
  }
}

/// @nodoc

class _$BadRequestImpl implements _BadRequest {
  _$BadRequestImpl(this.dataError);

  @override
  final BadRequestModel dataError;

  @override
  String toString() {
    return 'HttpFailure.badRequest(dataError: $dataError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadRequestImpl &&
            (identical(other.dataError, dataError) ||
                other.dataError == dataError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dataError);

  /// Create a copy of HttpFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BadRequestImplCopyWith<_$BadRequestImpl> get copyWith =>
      __$$BadRequestImplCopyWithImpl<_$BadRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function() notFound,
    required TResult Function() server,
    required TResult Function() forbidden,
    required TResult Function() unauthorized,
    required TResult Function(BadRequestModel dataError) badRequest,
    required TResult Function() local,
  }) {
    return badRequest(dataError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? network,
    TResult? Function()? notFound,
    TResult? Function()? server,
    TResult? Function()? forbidden,
    TResult? Function()? unauthorized,
    TResult? Function(BadRequestModel dataError)? badRequest,
    TResult? Function()? local,
  }) {
    return badRequest?.call(dataError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function()? notFound,
    TResult Function()? server,
    TResult Function()? forbidden,
    TResult Function()? unauthorized,
    TResult Function(BadRequestModel dataError)? badRequest,
    TResult Function()? local,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(dataError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Server value) server,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Local value) local,
  }) {
    return badRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Server value)? server,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Local value)? local,
  }) {
    return badRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Server value)? server,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Local value)? local,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(this);
    }
    return orElse();
  }
}

abstract class _BadRequest implements HttpFailure {
  factory _BadRequest(final BadRequestModel dataError) = _$BadRequestImpl;

  BadRequestModel get dataError;

  /// Create a copy of HttpFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BadRequestImplCopyWith<_$BadRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocalImplCopyWith<$Res> {
  factory _$$LocalImplCopyWith(
    _$LocalImpl value,
    $Res Function(_$LocalImpl) then,
  ) = __$$LocalImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LocalImplCopyWithImpl<$Res>
    extends _$HttpFailureCopyWithImpl<$Res, _$LocalImpl>
    implements _$$LocalImplCopyWith<$Res> {
  __$$LocalImplCopyWithImpl(
    _$LocalImpl _value,
    $Res Function(_$LocalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HttpFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LocalImpl implements _Local {
  _$LocalImpl();

  @override
  String toString() {
    return 'HttpFailure.local()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LocalImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function() notFound,
    required TResult Function() server,
    required TResult Function() forbidden,
    required TResult Function() unauthorized,
    required TResult Function(BadRequestModel dataError) badRequest,
    required TResult Function() local,
  }) {
    return local();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? network,
    TResult? Function()? notFound,
    TResult? Function()? server,
    TResult? Function()? forbidden,
    TResult? Function()? unauthorized,
    TResult? Function(BadRequestModel dataError)? badRequest,
    TResult? Function()? local,
  }) {
    return local?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function()? notFound,
    TResult Function()? server,
    TResult Function()? forbidden,
    TResult Function()? unauthorized,
    TResult Function(BadRequestModel dataError)? badRequest,
    TResult Function()? local,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Server value) server,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Local value) local,
  }) {
    return local(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Server value)? server,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Local value)? local,
  }) {
    return local?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Server value)? server,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Local value)? local,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(this);
    }
    return orElse();
  }
}

abstract class _Local implements HttpFailure {
  factory _Local() = _$LocalImpl;
}
