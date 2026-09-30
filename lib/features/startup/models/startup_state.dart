class StartupState {
  final bool isLoading;
  final String statusText;
  final bool isBrewMissing;
  final bool isInstallingBrew;

  const StartupState({
    this.isLoading = true,
    this.statusText = 'Loading...',
    this.isBrewMissing = false,
    this.isInstallingBrew = false,
  });

  StartupState copyWith({
    bool? isLoading,
    String? statusText,
    bool? isBrewMissing,
    bool? isInstallingBrew,
  }) {
    return StartupState(
      isLoading: isLoading ?? this.isLoading,
      statusText: statusText ?? this.statusText,
      isBrewMissing: isBrewMissing ?? this.isBrewMissing,
      isInstallingBrew: isInstallingBrew ?? this.isInstallingBrew,
    );
  }
}
