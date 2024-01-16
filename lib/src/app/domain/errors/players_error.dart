class PlayersError {
  PlayersError._({this.message = ''});

  final String message;

  factory PlayersError.server({String message = ''}) =>
      PlayersError._(message: message);

  factory PlayersError.unexpected() => PlayersError._();
}
