abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {
  final String description;

  SplashLoading(this.description);

  @override
  String toString() => '''
SplashLoading {$description}
''';
}

class SplashDone extends SplashState {
  final bool isLoggedIn;

  SplashDone({
    required this.isLoggedIn,
  });
}
