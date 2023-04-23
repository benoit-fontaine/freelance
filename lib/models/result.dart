abstract class Result<T> {}

extension ResultValues<T> on Result {
  T? get valueOrNull => (isSuccess) ? (this as Success).value : null;

  Message? get errorOrNull => (isFailure) ? (this as Failure).message : null;

  bool get isSuccess => (this is Success);

  bool get isFailure => (this is Failure);
}

class Message {
  final String code;
  final String message;

  Message(this.code, this.message);
}

class Success<T> extends Result<T> {
  final T value;

  Success(this.value);
}

class Failure<T> extends Result<T> {
  late final Message message;

  Failure(String code, String message) {
    this.message = Message(code, message);
  }

  static Failure<T> fromMessage<T>(Message message) => Failure(
    message.code,
    message.message,
  );
}
