import 'package:equatable/equatable.dart';

/// Entity User
class UserEntity extends Equatable {
  /// Entity User
  const UserEntity({
    required this.id,
    required this.name,
  });

  /// property id = String
  final String id;

  /// property name = String
  final String name;

  @override
  List<Object?> get props => [id, name];
}
