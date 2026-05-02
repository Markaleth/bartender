class ArtifactParser {
  static String getPrimaryType(List<Map<String, dynamic>>? artifacts) {
    final key = artifacts
        ?.expand((a) => a.keys)
        .where(
          (k) => !const {
            'uninstall',
            'zap',
            'postflight',
            'preflight',
          }.contains(k),
        )
        .firstOrNull;

    if (key == null) return 'Unknown';

    return switch (key) {
      'app' => 'Application (.app)',
      'pkg' => 'Installer (.pkg)',
      'audio_unit_plugin' => 'Audio Unit Plugin',
      'vst_plugin' => 'VST Plugin',
      'vst3_plugin' => 'VST3 Plugin',
      'colorpicker' => 'Color Picker',
      'prefpane' => 'Preference Pane',
      'qlplugin' => 'QuickLook Plugin',
      'screen_saver' => 'Screen Saver',
      'input_method' => 'Input Method',
      'internet_plugin' => 'Internet Plugin',
      'service' => 'Service',
      'binary' => 'Binary',
      'font' => 'Font',
      'dictionary' => 'Dictionary',
      _ => '${key[0].toUpperCase()}${key.substring(1)}', // Fallback
    };
  }
}
