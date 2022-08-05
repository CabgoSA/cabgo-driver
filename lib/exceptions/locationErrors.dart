class LocationServiceDisabled implements Exception {}

class LocationServiceDenied implements Exception {}

class LocationDeniedForever implements Exception{}

class GeneralError implements Exception{}



//AUTH ERRORS
class GettingTokenError implements Exception{}

class LogoutError implements Exception{}

class InvalidCridetials implements Exception{}

class LoginError implements Exception{}

//Register
class RegisterError implements Exception{}
class UserNotRegistered implements Exception{}

class ErrorResetingPassword implements Exception{}


class OtpVerificationError implements Exception{}


//incoming ride

class IncomingRequestError implements Exception{}

class ErrorCallingDriver implements Exception{}

class ErrorCancelingRide implements Exception{}
class ErrorRatingRide implements Exception{}


class ErrorGettingEarnings implements Exception{}