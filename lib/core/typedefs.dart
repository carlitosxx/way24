import 'package:way24/core/either.dart';

/// Typedef json
typedef Json = Map<String, dynamic>;

/// typedef Future Either
typedef FutureEither<L, R> = Future<Either<L, R>>;

/// typedef Stream Either
typedef StreamEither<L, R> = Stream<Either<L, R>>;
