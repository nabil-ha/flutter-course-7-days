import 'package:day_6/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations? get loc => AppLocalizations.of(this);
}
