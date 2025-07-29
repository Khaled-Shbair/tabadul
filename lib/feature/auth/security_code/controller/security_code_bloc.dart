import '/config/all_imports.dart';

part 'security_code_event.dart';

part 'security_code_state.dart';

class SecurityCodeBloc extends Bloc<SecurityCodeEvent, SecurityCodeState> {
  SecurityCodeBloc(this._repo) : super(SecurityCodeInitial()) {
    on<ResendSecurityCode>(_resendSecurityCode);
    on<VerifySecurityCode>(_verifySecurityCode);
  }

  final AuthRepo _repo;
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
  int? _resendToken;

  String _verificationId = '';

  void _resendSecurityCode(ResendSecurityCode event, Emitter emit) async {
    (await _repo.sendSecurityCode(SendSecurityCodeRequest(
      phoneNumber: event.phoneNumber,
      resendToken: _resendToken,
    )))
        .fold(
      (l) {
        if (l.message == ManagerStrings.noInternetConnection) {
          emit(VerifiedSecurityCodeFailed(l.message));
        }
      },
      (r) {
        _resendToken = r.resendToken;
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
      (await _repo.verifySecurityCode(
        VerifySecurityCodeRequest(
          phoneNumber: event.phoneNumber,
          securityCode: event.code,
          verificationId: _verificationId,
        ),
      ))
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

  @override
  Future<void> close() {
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
