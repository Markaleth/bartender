import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'SENTRY_DSN', defaultValue: '', optional: true)
  static final String sentryDsn = _Env.sentryDsn;
}
