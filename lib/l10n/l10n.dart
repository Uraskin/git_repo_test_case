import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_repo_test_case/l10n/messages_all.dart';
import 'package:intl/intl.dart';

class Strings {

  Strings();

  String get appName => Intl.message('Github repo');
  String get searchRepoPlaceholder => Intl.message('search remote repo');
  String get emptyRepository => Intl.message('List is empty');
  String get repoDetailsTitle => Intl.message('Repository details');
  String get repoDetailsNamePlaceholder => Intl.message('Repository name');
  String get repoDetailsNameEmptyPlaceholder => Intl.message('name');
  String get repoDetailsDescriptionPlaceholder => Intl.message('Repository description');
  String get repoDetailsDescriptionEmptyPlaceholder => Intl.message('description');
  String get repoDetailsBtnSave => Intl.message('Save');
  String get repoLocalType => Intl.message('local');
  String get repoRemoteType => Intl.message('remote');
  String get addNewRepoTitle => Intl.message('Add new repo');

  String get errorServer => Intl.message('Server internal error');
  String get errorConnection => Intl.message('Connection error');
  String get errorUnexpected => Intl.message('Unexpected error');

  static const L10nsDelegate delegate = L10nsDelegate();


  static Future<Strings> load(Locale locale) {
    final String name = (locale.countryCode?.isEmpty ?? true)
        ? locale.languageCode
        : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return Strings();
    });
  }

  static Strings of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings) ?? Strings();
  }

}
class L10nsDelegate extends LocalizationsDelegate<Strings> {
  const L10nsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => supportedLocales.contains(locale);

  @override
  Future<Strings> load(Locale locale) => Strings.load(locale);

  @override
  bool shouldReload(L10nsDelegate old) => false;
}