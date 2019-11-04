class ResponseState<T>{
  ResponseState._();
  factory ResponseState.success(T value) = SuccessState<T>;
  factory ResponseState.error(T msg) = ErrorState<T>;
}

class ErrorState<T> extends ResponseState<T> {
  ErrorState(this.msg) : super._();
  final T msg;
}

class SuccessState<T> extends ResponseState<T> {
  SuccessState(this.value) : super._();
  final T value;
}