part of 'list_service_providers_bloc.dart';

abstract class ListServiceProvidersEvent {}

class GetServiceProviders extends ListServiceProvidersEvent {}

class LoadMoreServiceProviders extends ListServiceProvidersEvent {}

class RefreshServiceProviders extends ListServiceProvidersEvent {}
