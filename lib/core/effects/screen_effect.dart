sealed class ScreenEffect {}

class ShowToastEffect extends ScreenEffect {
  final String message;
  final bool isError;
  ShowToastEffect(this.message, {this.isError = false});
}
