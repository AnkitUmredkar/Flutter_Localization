import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';

String currentLocale = 'en';

class LanguagesPage extends StatefulWidget {
  final void Function(String) setLocale;

  const LanguagesPage({super.key, required this.setLocale});

  @override
  State<LanguagesPage> createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Flutter Localization",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          DropdownButton<String>(
            value: currentLocale,
            items: [
              DropdownMenuItem(
                value: 'en',
                child: Text(AppLocalizations.of(context)!.english),
              ),
              DropdownMenuItem(
                value: 'ar',
                child: Text(AppLocalizations.of(context)!.arabic),
              ),
              DropdownMenuItem(
                value: 'de',
                child: Text(AppLocalizations.of(context)!.german),
              ),
            ],
            onChanged: (String? value) {
              if (value != null) {
                widget.setLocale(value);
                setState(() {
                  currentLocale = value;
                  log(currentLocale);
                });
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.helloWorld,
                  style: const TextStyle(color: Colors.black)),
              const Gap(25),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Change Language")),
            ],
          ),
        ),
      ),
    );
  }
}
