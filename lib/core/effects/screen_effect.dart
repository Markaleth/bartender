sealed class ScreenEffect {
  const ScreenEffect();
}

class ShowToastEffect extends ScreenEffect {
  final String message;
  final bool isError;
  const ShowToastEffect(this.message, {this.isError = false});
}

class NavigateToScreenEffect extends ScreenEffect {
  final String routeName;
  final Object? arguments;

  const NavigateToScreenEffect(
    this.routeName, {
    this.arguments,
  });
}
