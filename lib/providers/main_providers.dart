import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../services/api_service.dart';

/// Fetch user from API
final userProvider = FutureProvider<User>((ref) async {
  return ApiService.fetchUser();
});

/// Selected option index (null by default)
final selectedOptionProvider = StateProvider<int?>((ref) => null);