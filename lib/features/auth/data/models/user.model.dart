import 'package:way24/core/typedefs.dart';
import 'package:way24/features/auth/domain/entities/user.entity.dart';

/// User model
class UserModel extends UserEntity {
  /// User model
  const UserModel({required super.id, required super.name});

  /// from user supabase to Usermodel
  factory UserModel.fromSupabaseUser({required String id, Json? metadata}) {
    return UserModel(
      id: id,
      name: metadata?['name'].toString() ?? 'name is null',
    );
  }
}
