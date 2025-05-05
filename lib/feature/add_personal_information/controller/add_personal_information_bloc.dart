import '/config/all_imports.dart';

part 'add_personal_information_event.dart';

part 'add_personal_information_state.dart';

class AddPersonalInformationBloc
    extends Bloc<AddPersonalInformationEvent, AddPersonalInformationState> {
  AddPersonalInformationBloc(this._repo)
      : super(AddPersonalInformationInitial()) {
    on<AddPersonalInformationProcess>(_addPersonalInformationProcess);
    on<SelectCity>(_selectCity);
    on<SelectRegionAndStreet>(_selectRegionAndStreet);
    on<GetCities>(_getCities);
    on<GetRegions>(_getRegions);
    add(GetCities());
    add(GetRegions());
    _monitorConnection();
  }

  final AddPersonalInformationRepo _repo;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? _selectedCity;
  String? _selectedRegionAndStreet;
  StreamSubscription<InternetStatus>? _internetSubscription;
  bool _citiesLoadingFailure = false;
  bool _regionsLoadingFailure = false;

  void _monitorConnection() {
    _internetSubscription =
        InternetConnection().onStatusChange.listen((status) {
      debugPrint('monitor connection:${status == InternetStatus.connected}');
      if (status == InternetStatus.connected) {
        if (_citiesLoadingFailure) {
          add(GetCities());
          _citiesLoadingFailure = false;
        }
        if (_regionsLoadingFailure) {
          add(GetRegions());
          _regionsLoadingFailure = false;
        }
      }
    });
  }

  void _getCities(GetCities event, Emitter emit) async {
    (await _repo.getCities()).fold(
      (l) {
        if (l.code == -1) {
          emit(AddPersonalInformationFailure(l.message));
          _citiesLoadingFailure = true;
        }
      },
      (r) {
        emit((state as AddPersonalInformationInitial).copyWith(
            cities: r.cities.map<String>((e) => e.nameAr ?? '').toList()));
      },
    );
  }

  void _getRegions(GetRegions event, Emitter emit) async {
    (await _repo.getRegions()).fold(
      (l) {
        if (l.code == -1) {
          emit(AddPersonalInformationFailure(l.message));

          _regionsLoadingFailure = true;
        }
      },
      (r) {
        emit((state as AddPersonalInformationInitial).copyWith(
            regions: r.regions.map<String>((e) => e.nameAr ?? '').toList()));
      },
    );
  }

  void _selectCity(SelectCity event, Emitter emit) async {
    _selectedCity = event.city;
  }

  void _selectRegionAndStreet(SelectRegionAndStreet event, Emitter emit) async {
    _selectedRegionAndStreet = event.regionAndStreet;
  }

  void _addPersonalInformationProcess(
      AddPersonalInformationProcess event, Emitter emit) async {
    if (formKey.currentState!.validate()) {
      emit(AddPersonalInformationLoading());
      (await _repo.addPersonalInformation(
        AddPersonalInformationRequest(
          phoneNumber: event.phoneNumber,
          firstName: firstName.text,
          lastName: lastName.text,
          regionAndStreet: _selectedRegionAndStreet ?? '',
          city: _selectedCity ?? '',
        ),
      ))
          .fold(
        (l) {
          emit(AddPersonalInformationFailure(l.message));
        },
        (r) {
          emit(AddPersonalInformationSuccessfully());
        },
      );
    }
  }

  @override
  Future close() async {
    firstName.clear();
    lastName.clear();
    _selectedCity = null;
    _selectedRegionAndStreet = null;
    firstName.dispose();
    lastName.dispose();
    _internetSubscription?.cancel();
    await _internetSubscription?.cancel();

    return super.close();
  }
}
