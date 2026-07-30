sealed class ScreenEffect {
  const ScreenEffect();
}

class ShowToastEffect extends ScreenEffect {
  final String message;
  final bool isError;
  final bool isWarning;
  const ShowToastEffect(
    this.message, {
    this.isError = false,
    this.isWarning = false,
  });
}

class NavigateToScreenEffect extends ScreenEffect {
  final String routeName;
  final Object? arguments;

  const NavigateToScreenEffect(this.routeName, {this.arguments});
}
