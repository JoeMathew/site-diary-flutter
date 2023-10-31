import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_diary_app/diary/counter.dart';
import 'package:site_diary_app/l10n/l10n.dart';

import 'package:site_diary_app/diary/view/new_entry_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String route = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const PagesListView(),
    );
  }
}

class PagesListView extends StatelessWidget {
  const PagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(child: AddNewPageText()),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the page for adding a new entry to the site diary.
            Navigator.pushNamed(context, NewEntryPage.route);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text('Add New', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}

class AddNewPageText extends StatelessWidget {
  const AddNewPageText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Padding(
      padding: const EdgeInsets.all(21),
      child: Text(
        "G'day! Tap the 'Add New' button to add a new page to the diary",
        style: theme.textTheme.displaySmall,
      ),
    );
  }
}
