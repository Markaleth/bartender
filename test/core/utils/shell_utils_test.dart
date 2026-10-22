import 'package:bartender/core/utils/shell_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ShellUtils.bridgeCommand', () {
    const command = ['/home/linuxbrew/.linuxbrew/bin/brew', 'list', '--json'];

    test('returns the command unchanged without a bridge', () {
      expect(ShellUtils.bridgeCommand(HostBridge.none, command), command);
    });

    test('ignores environment without a bridge', () {
      expect(
        ShellUtils.bridgeCommand(
          HostBridge.none,
          command,
          environment: {'HOMEBREW_NO_AUTO_UPDATE': '1'},
        ),
        command,
      );
    });

    test('prefixes distrobox-host-exec for distrobox', () {
      expect(ShellUtils.bridgeCommand(HostBridge.distrobox, command), [
        'distrobox-host-exec',
        ...command,
      ]);
    });

    test('prefixes flatpak-spawn --host for flatpak', () {
      expect(ShellUtils.bridgeCommand(HostBridge.flatpak, command), [
        'flatpak-spawn',
        '--host',
        ...command,
      ]);
    });

    test('forwards environment as --env flags for flatpak', () {
      expect(
        ShellUtils.bridgeCommand(
          HostBridge.flatpak,
          command,
          environment: {
            'HOMEBREW_NO_AUTO_UPDATE': '1',
            'HOMEBREW_NO_PAGER': '1',
          },
        ),
        [
          'flatpak-spawn',
          '--host',
          '--env=HOMEBREW_NO_AUTO_UPDATE=1',
          '--env=HOMEBREW_NO_PAGER=1',
          ...command,
        ],
      );
    });

    test('keeps env values containing = and spaces as single arguments', () {
      final bridged = ShellUtils.bridgeCommand(
        HostBridge.flatpak,
        command,
        environment: {'HOMEBREW_CURL_ARGS': '--retry 3 --opt=a'},
      );
      expect(bridged[2], '--env=HOMEBREW_CURL_ARGS=--retry 3 --opt=a');
      expect(bridged.sublist(3), command);
    });
  });
}
