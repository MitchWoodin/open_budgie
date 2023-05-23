import 'package:budgie_finance/core/core.dart';
import 'package:budgie_finance/core/pages/core_pages.dart';
import 'package:budgie_finance/core/pages/loading_page.dart';
import 'package:budgie_finance/features/auth/controller/auth_controller.dart';
import 'package:budgie_finance/features/auth/views/login_view.dart';
import 'package:budgie_finance/features/budget/views/budget_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/core_theme.dart';
import 'features/auth/views/register_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      home: ref.watch(currentUserAccountProvider).when(
            data: (user) {
              if (user != null) {
                return const BudgetView();
              } else {
                return const LoginView();
              }
            },
            error: (error, st) => ErrorPage(
              error: error.toString(),
            ),
            loading: () => const LoadingPage(),
          ),
    );
  }
}
