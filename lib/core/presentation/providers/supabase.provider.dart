import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase client provider
final clientDatasourceProvider = Provider<Supabase>((ref) {
  return Supabase.instance;
});
