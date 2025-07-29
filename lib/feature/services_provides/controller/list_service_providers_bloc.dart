import '/config/all_imports.dart';

part 'list_service_providers_event.dart';
part 'list_service_providers_state.dart';

class ListServiceProvidersBloc
    extends Bloc<ListServiceProvidersEvent, ListServiceProvidersState> {
  ListServiceProvidersBloc(this._repo) : super(ListServiceProvidersInitial()) {
    on<GetServiceProviders>(_getServiceProviders);
    on<LoadMoreServiceProviders>(_loadMoreServiceProviders);
    on<RefreshServiceProviders>(_refreshServiceProviders);
  }

  final ServicesProvidesRepo _repo;
  DocumentSnapshot? _lastDocument;
  List<UserModel> _allServiceProviders = [];
  bool _hasReachedMax = false;

  Future<void> _getServiceProviders(
      GetServiceProviders event, Emitter<ListServiceProvidersState> emit) async {
    emit(ListServiceProvidersLoading());

 (await _repo.getServiceProviders(
      GetServicesProvidesRequest(lastDocument: null),
    )).fold(
      (l) => emit(ListServiceProvidersError(l.message)),
      (r) {
        _allServiceProviders = r.users;
        _lastDocument = r.lastDocument;
        _hasReachedMax = r.users.length < 30;
        if (_allServiceProviders.isEmpty) {
          emit(ListServiceProvidersError(ManagerStrings.noServicesProvides));
        } else {
          emit(ListServiceProvidersLoaded(
            serviceProviders: _allServiceProviders,
            hasReachedMax: _hasReachedMax,
          ));
        }
      },
    );
  }

  Future<void> _loadMoreServiceProviders(LoadMoreServiceProviders event,
      Emitter<ListServiceProvidersState> emit) async {
    if (_hasReachedMax) return;

    emit(ListServiceProvidersLoadingMore(_allServiceProviders));

    (await _repo.getServiceProviders(
      GetServicesProvidesRequest(lastDocument: _lastDocument),
    )).fold(
      (l) => emit(ListServiceProvidersError(l.message)),
      (r) {
        _allServiceProviders.addAll(r.users);
        _lastDocument = r.lastDocument;
        _hasReachedMax = r.users.length < 30;

        emit(ListServiceProvidersLoaded(
          serviceProviders: _allServiceProviders,
          hasReachedMax: _hasReachedMax,
        ));
      },
    );
  }

  Future<void> _refreshServiceProviders(RefreshServiceProviders event,
      Emitter<ListServiceProvidersState> emit) async {
    _lastDocument = null;
    _allServiceProviders.clear();
    _hasReachedMax = false;

    add(GetServiceProviders());
  }
}
