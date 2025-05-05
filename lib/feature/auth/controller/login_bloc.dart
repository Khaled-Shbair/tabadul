import 'dart:async';

import '/config/all_imports.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._authRepo) : super(LoginInitial()) {
    phoneController.addListener(() => selectCursorPosition(phoneController));
    on<LoginProcess>(_loginProcess);
    on<SelectCodeCountry>(_selectCodeCountry);
  }

  final formKey = GlobalKey<FormState>();
  final AuthRepo _authRepo;

  final TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();

  final TextEditingController phoneController = TextEditingController();

  void _selectCodeCountry(SelectCodeCountry event, Emitter emit) async {
    if (event.value != null) {
      emit(SelectedCodeCountry(event.value!));
    }
  }

  void _loginProcess(LoginProcess event, Emitter emit) async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      (await _authRepo.login(AuthRequest(phoneNumber: phoneController.text)))
          .fold(
        (l) {
          emit(LoginFailure(l.message));
        },
        (r) {
          emit(LoginSuccessfully(phoneController.text));
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
