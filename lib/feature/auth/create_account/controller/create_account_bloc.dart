import '/config/all_imports.dart';

part 'create_account_event.dart';

part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc(this._authRepo) : super(CreateAccountInitial()) {
    phoneController.addListener(() => selectCursorPosition(phoneController));
    on<CreateAccountProcess>(_createAccountProcess);
    on<SelectCodeOfCountry>(_selectCodeCountry);
  }

  final formKey = GlobalKey<FormState>();
  final AuthRepo _authRepo;

  final TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();

  final TextEditingController phoneController = TextEditingController();

  void _selectCodeCountry(SelectCodeOfCountry event, Emitter emit) async {
    if (event.value != null) {
      emit(SelectedCodeOfCountry(event.value!));
    }
  }

  void _createAccountProcess(CreateAccountProcess event, Emitter emit) async {
    if (formKey.currentState!.validate()) {
      emit(CreateAccountLoading());
      (await _authRepo
              .createAccount(AuthRequest(phoneNumber: phoneController.text)))
          .fold(
        (l) {
          emit(CreateAccountFailure(l.message));
        },
        (r) {
          emit(CreateAccountSuccessfully(phoneController.text));
        },
      );
    }
  }

  @override
  Future<void> close() {
    phoneController.clear();
    phoneController.dispose();
    tapGestureRecognizer.dispose();
    return super.close();
  }
}
