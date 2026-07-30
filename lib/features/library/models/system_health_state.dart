import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bartender/data/shell/shell_command_result.dart';
import 'package:bartender/core/constants/app_colors.dart';

part 'system_health_state.freezed.dart';

@freezed
abstract class SystemHealthState with _$SystemHealthState {
  const SystemHealthState._();

  const factory SystemHealthState({
    @Default(100) int globalHealthScore,
    @Default('0 B') String systemStorageUsed,
    @Default(0) int outdatedCount,
    @Default('') String reclaimableSpace,
    @Default(0) int doctorWarningsCount,
    @Default(0) int doctorErrorsCount,
    @Default([]) List<String> doctorIssues,
    @Default(0) int orphanedDependenciesCount,
  }) = _SystemHealthState;

  factory SystemHealthState.fromResults({
    required ShellCommandResult autoremoveResult,
    required ShellCommandResult cleanupResult,
    required ShellCommandResult doctorResult,
    required ShellCommandResult outdatedResult,
    String systemStorageUsed = '0 B',
  }) {
    final orphansCount = _parseOrphans(autoremoveResult);
    final reclaimableSpace = _parseReclaimableSpace(cleanupResult);
    final doctorParsed = _parseDoctorIssues(doctorResult);
    final outdatedCount = _parseOutdatedCount(outdatedResult);

    final healthScore = _calculateHealthScore(
      orphansCount,
      doctorParsed.warnings,
      doctorParsed.errors,
    );

    return SystemHealthState(
      globalHealthScore: healthScore,
      systemStorageUsed: systemStorageUsed,
      outdatedCount: outdatedCount,
      reclaimableSpace: reclaimableSpace,
      doctorWarningsCount: doctorParsed.warnings,
      doctorErrorsCount: doctorParsed.errors,
      doctorIssues: doctorParsed.issues,
      orphanedDependenciesCount: orphansCount,
    );
  }

  static int _parseOrphans(ShellCommandResult autoremoveResult) {
    if (autoremoveResult.exitCode == 0) {
      final lines = autoremoveResult.stdout.toString().trim().split('\n');
      final orphanLines = lines
          .where(
            (line) =>
                line.trim().isNotEmpty && !line.startsWith('Would remove:'),
          )
          .toList();
      return orphanLines.length;
    }
    return 0;
  }

  static String _parseReclaimableSpace(ShellCommandResult cleanupResult) {
    if (cleanupResult.exitCode == 0) {
      final match = RegExp(
        r'would free approximately (.*?) of disk space',
      ).firstMatch(cleanupResult.stdout.toString());
      if (match != null) {
        return match.group(1) ?? '0 B';
      }
    }
    return '0 B';
  }

  static ({int warnings, int errors, List<String> issues}) _parseDoctorIssues(
    ShellCommandResult doctorResult,
  ) {
    int warnings = 0;
    int errors = 0;
    List<String> issues = [];
    final doctorOut =
        '${doctorResult.stdout.toString().trim()}\n${doctorResult.stderr.toString().trim()}';

    if (doctorOut.isNotEmpty) {
      warnings = RegExp(
        r'^Warning:',
        multiLine: true,
      ).allMatches(doctorOut).length;
      errors = RegExp(r'^Error:', multiLine: true).allMatches(doctorOut).length;

      final blocks = doctorOut.split(RegExp(r'\n\s*\n'));
      issues = blocks
          .where((b) => b.startsWith('Warning:') || b.startsWith('Error:'))
          .map((b) => b.trim())
          .toList();
    }
    return (warnings: warnings, errors: errors, issues: issues);
  }

  static int _parseOutdatedCount(ShellCommandResult outdatedResult) {
    if (outdatedResult.exitCode == 0) {
      try {
        final json =
            jsonDecode(outdatedResult.stdout.toString())
                as Map<String, dynamic>;
        final formulae = json['formulae'] as List<dynamic>? ?? [];
        final casks = json['casks'] as List<dynamic>? ?? [];
        return formulae.length + casks.length;
      } catch (_) {}
    }
    return 0;
  }

  static int _calculateHealthScore(int orphans, int warnings, int errors) {
    int health = 100 - (orphans * 2) - (warnings * 5) - (errors * 15);
    return health < 0 ? 0 : health;
  }

  Color get healthScoreColor {
    if (globalHealthScore >= 90) return AppColors.secondary;
    if (globalHealthScore >= 70) return AppColors.warning;
    return AppColors.error;
  }

  List<({String raw, String formatted})> get parsedDoctorIssues {
    return doctorIssues
        .map(
          (issue) =>
              (raw: issue, formatted: issue.replaceAll('Warning:', '').trim()),
        )
        .toList();
  }
}
