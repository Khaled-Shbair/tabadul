part of 'list_service_providers_bloc.dart';

abstract class ListServiceProvidersState {}

class ListServiceProvidersInitial extends ListServiceProvidersState {}

class ListServiceProvidersLoading extends ListServiceProvidersState {}

class ListServiceProvidersLoaded extends ListServiceProvidersState {
  final List<UserModel> serviceProviders;
  final bool hasReachedMax;

  ListServiceProvidersLoaded({
    required this.serviceProviders,
    required this.hasReachedMax,
  });
}

class ListServiceProvidersLoadingMore extends ListServiceProvidersState {
  final List<UserModel> serviceProviders;

  ListServiceProvidersLoadingMore(this.serviceProviders);
}

class ListServiceProvidersError extends ListServiceProvidersState {
  final String message;

  ListServiceProvidersError(this.message);
}
