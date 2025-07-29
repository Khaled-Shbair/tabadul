import '/config/all_imports.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc(this._repo, this._sharedPref, this._internetConnection)
      : super(NotificationsInitial()) {
    on<GetNotifications>(getNotifications);
    scrollController.addListener(_onScroll);
    add(GetNotifications());
    _monitorConnection();
  }
  StreamSubscription<InternetStatus>? _internetSubscription;

  final NotificationsRepo _repo;
  final SharedPreferencesController _sharedPref;

  final InternetConnection _internetConnection;
  final ScrollController scrollController = ScrollController();
  DocumentSnapshot? _lastDoc;
  bool _notificationsLoadingFailure = false;

  // Trigger load more notifications when reaching near the bottom
  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      if (state is NotificationsSuccessfully) {
        add(GetNotifications(loadMore: true));
      }
    }
  }

  void _monitorConnection() {
    _internetSubscription = _internetConnection.onStatusChange.listen(
      (status) {
        debugPrint('monitor connection:${status == InternetStatus.connected}');
        if (status == InternetStatus.connected) {
          if (_notificationsLoadingFailure) {
            add(GetNotifications());
            _notificationsLoadingFailure = false;
          }
        }
      },
    );
  }

  Future<void> getNotifications(GetNotifications event, Emitter emit) async {
    if (event.loadMore) {
      emit(MoreNotificationsLoading());
    } else {
      emit(NotificationsLoading());
    }
    (await _repo.getNotifications(NotificationsRequest(
      _sharedPref.getString(SharedPreferenceKeys.phoneNumber),
      _lastDoc,
    )))
        .fold(
      (failure) => emit(NotificationsFailure(failure.message, failure.code)),
      (response) {
        _lastDoc = response.lastDoc;
        final notifications =
            response.notifications.map((e) => e.content ?? '').toList();
        if (event.loadMore) {
          final oldNotifications =
              (state as NotificationsSuccessfully).notifications;
          emit(NotificationsSuccessfully(
              [...oldNotifications, ...notifications]));
        } else {
          emit(NotificationsSuccessfully(notifications));
        }
      },
    );
  }

  @override
  Future<void> close() async {
    _internetSubscription?.cancel();
    await _internetSubscription?.cancel();
    return super.close();
  }
}
