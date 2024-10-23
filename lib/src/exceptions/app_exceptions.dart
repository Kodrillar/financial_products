class AppExceptionData {
  AppExceptionData({required this.message});

  final String message;
}

sealed class AppException implements Exception {
  AppException(this.exceptionData);

  final AppExceptionData exceptionData;

  @override
  String toString() {
    return exceptionData.message;
  }
}

class AppExceptionWithNetworkMessage extends AppException {
  AppExceptionWithNetworkMessage(String networkMessage)
      : super(AppExceptionData(message: networkMessage));
}

class AppExceptionWithMessage extends AppException {
  AppExceptionWithMessage(String networkMessage)
      : super(AppExceptionData(message: networkMessage));
}

class UnexpectedException extends AppException {
  UnexpectedException()
      : super(AppExceptionData(message: 'Sorry, something went wrong.'));
}

class AppSocketException extends AppException {
  AppSocketException()
      : super(AppExceptionData(
            message:
                "Oop! Please check your internet connection and try again."));
}
