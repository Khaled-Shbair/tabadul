import 'dart:async';

import '/config/all_imports.dart';

part 'security_code_event.dart';

part 'security_code_state.dart';

class SecurityCodeBloc extends Bloc<SecurityCodeEvent, SecurityCodeState> {
  SecurityCodeBloc(this._repo) : super(SecurityCodeInitial()) {
    on<ResendSecurityCode>(_resendSecurityCode);
    on<VerifySecurityCode>(_verifySecurityCode);
    on<StartResendTimer>(_startResendTimer);
    on<TickResendTimer>(_tickResendTimer);
  }

  final SecurityCodeRepo _repo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstCode = TextEditingController();
  final TextEditingController secondCode = TextEditingController();
  final TextEditingController thirdCode = TextEditingController();
  final TextEditingController fourthCode = TextEditingController();
  final TextEditingController fifthCode = TextEditingController();
  final TextEditingController sixthCode = TextEditingController();
  final FocusNode firstFocusNode = FocusNode();
  final FocusNode secondFocusNode = FocusNode();
  final FocusNode thirdFocusNode = FocusNode();
  final FocusNode fourthFocusNode = FocusNode();
  final FocusNode fifthFocusNode = FocusNode();
  final FocusNode sixthFocusNode = FocusNode();
  String _verificationId = '';
  int _seconds = 45;
  Timer? timer;

  void _resendSecurityCode(ResendSecurityCode event, Emitter emit) async {
    add(StartResendTimer());
    (await _repo.sendSecurityCode(
            SendSecurityCodeRequest(phoneNumber: event.phoneNumber)))
        .fold(
      (l) {
        if (l.message == ManagerStrings.noInternetConnection) {
          emit(VerifiedSecurityCodeFailed(l.message));
        }
      },
      (r) {
        _verificationId = r.verificationId;
      },
    );
  }

  void _verifySecurityCode(VerifySecurityCode event, Emitter emit) async {
    if (Validator.securityCodeValidator(
      firstCode.text,
      secondCode.text,
      thirdCode.text,
      fourthCode.text,
      fifthCode.text,
      sixthCode.text,
    )) {
      emit(VerifiedSecurityCodeLoading());
      (await _repo.verifySecurityCode(VerifySecurityCodeRequest(
              securityCode: event.code, verificationId: _verificationId)))
          .fold(
        (l) async {
          emit(VerifiedSecurityCodeFailed(l.message));
        },
        (r) {
          emit(VerifiedSecurityCodeSuccessfully());
        },
      );
    } else {
      emit(VerifiedSecurityCodeFailed(ManagerStrings.pleaseEnterCodeCorrectly));
    }
  }

  void _startResendTimer(StartResendTimer event, Emitter emit) async {
    _seconds = 45;
    timer?.cancel();
    emit(SecurityCodeTimerState(seconds: _seconds, canResend: false));
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!isClosed) {
        add(TickResendTimer());
      }
    });
  }

  void _tickResendTimer(TickResendTimer event, Emitter emit) async {
    if (_seconds > 0) {
      _seconds--;
      emit(SecurityCodeTimerState(seconds: _seconds, canResend: false));
    } else {
      timer?.cancel();
      emit(SecurityCodeTimerState(seconds: 00, canResend: true));
    }
  }

  @override
  Future<void> close() {
    timer?.cancel();
    firstCode.clear();
    secondCode.clear();
    thirdCode.clear();
    fourthCode.clear();
    fifthCode.clear();
    sixthCode.clear();
    firstCode.dispose();
    secondCode.dispose();
    thirdCode.dispose();
    fourthCode.dispose();
    fifthCode.dispose();
    sixthCode.dispose();
    firstFocusNode.dispose();
    secondFocusNode.dispose();
    thirdFocusNode.dispose();
    fourthFocusNode.dispose();
    fifthFocusNode.dispose();
    sixthFocusNode.dispose();

    return super.close();
  }
}
