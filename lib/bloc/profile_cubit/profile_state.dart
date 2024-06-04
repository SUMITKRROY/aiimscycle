part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final User profileModal;
  final List<AllRequest> allReq;

  ProfileLoaded({required this.profileModal, required this.allReq});
}

final class ProfileError extends ProfileState {
  final String error;

  ProfileError({required this.error});
}
