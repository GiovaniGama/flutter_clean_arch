sealed class Result<T> {
  const Result();

  const factory Result.success(T value) = Success._;
  const factory Result.error(Exception error) = Error._;

  R fold<R>(R Function(T value) onSuccess, R Function(Exception error) onError);

  R when<R>({
    required R Function(T value) onSuccess,
    required R Function(Exception error) onError,
  }) {
    return switch (this) {
      Success(value: final value) => onSuccess(value),
      Error(error: final error) => onError(error),
    };
  }

  T get value {
    return switch (this) {
      Success(value: final value) => value,
      Error(error: final error) => throw error,
    };
  }

  bool get isSuccess => this is Success<T>;

  bool get isError => this is Error<T>;
}

final class Success<T> extends Result<T> {
  const Success._(this.value);

  @override
  final T value;

  @override
  R fold<R>(
    R Function(T value) onSuccess,
    R Function(Exception error) onError,
  ) {
    return onSuccess(value);
  }

  @override
  String toString() => 'Result<$T>.success($value)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success<T> &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

final class Error<T> extends Result<T> {
  const Error._(this.error);
  final Exception error;

  @override
  R fold<R>(
    R Function(T value) onSuccess,
    R Function(Exception error) onError,
  ) {
    return onError(error);
  }

  @override
  String toString() => 'Result<$T>.error($error)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Error<T> &&
          runtimeType == other.runtimeType &&
          error == other.error;

  @override
  int get hashCode => error.hashCode;
}
