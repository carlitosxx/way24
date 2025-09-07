import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:way24/core/presentation/my_app.dart';

void main() async {
  // print(String.fromEnvironment('supabaseUrl'));
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://xsizxqhcwmlpliwroifs.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6'
        'InhzaXp4cWhjd21scGxpd3JvaWZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU3Nzc0OD'
        'QsImV4cCI6MjA0MTM1MzQ4NH0.hciZ41oA5ZRb8BmFB9FPQMRBUxudFaXzzxpl1THletY',
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.implicit,
    ),
  );
  runApp(ProviderScope(child: I18n(child: const MyApp())));
}
