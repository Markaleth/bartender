class StartupState {
  final bool isLoading;
  final String statusText;

  const StartupState({
    this.isLoading = true,
    this.statusText = 'Loading...',
  });

  StartupState copyWith({
    bool? isLoading,
    String? statusText,
  }) {
    return StartupState(
      isLoading: isLoading ?? this.isLoading,
      statusText: statusText ?? this.statusText,
    );
  }
}
