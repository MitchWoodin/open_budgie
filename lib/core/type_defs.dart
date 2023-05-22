import 'package:fpdart/fpdart.dart';
import './failure.dart';

typedef FEither<T> = Future<Either<Failure, T>>;
typedef FEitherVoid<T> = FEither<void>;