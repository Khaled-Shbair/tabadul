import 'dart:async';

import '/config/all_imports.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._loginRepo) : super(LoginInitial()) {
    phoneController.addListener(() => selectCursorPosition(phoneController));
    on<LoginProcess>(_loginProcess);
    on<SelectCodeCountry>(_selectCodeCountry);
  }

  final formKey = GlobalKey<FormState>();
  final LoginRepo _loginRepo;

  final TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer()
    ..onTap = () => Get.toNamed(Routes.createAccountScreen);

  final TextEditingController phoneController = TextEditingController();

  void _selectCodeCountry(SelectCodeCountry event, Emitter emit) async {
    if (event.value != null) {
      emit(SelectedCodeCountry(event.value!));
    }
  }

  void _loginProcess(LoginProcess event, Emitter emit) async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      (await _loginRepo.login(LoginRequest(phoneNumber: phoneController.text)))
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
    phoneController.dispose();
    tapGestureRecognizer.dispose();
    return super.close();
  }
}
