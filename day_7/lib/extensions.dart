import 'package:day_7/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  // context.loc
  AppLocalizations get loc => AppLocalizations.of(this)!;
}
