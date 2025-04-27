import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'all_imports.dart';

final instance = GetIt.instance;

Future<void> initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  initNetworkInfo();
  await PrefController().initializeApp();
  await initFirebase();
  await initSharedPreference();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

initNetworkInfo() {
  if (!GetIt.I.isRegistered<InternetConnection>()) {
    instance.registerLazySingleton<InternetConnection>(
      () => InternetConnection(),
    );
  }
  if (!GetIt.I.isRegistered<NetworkInfo>()) {
    instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementation(
        instance<InternetConnection>(),
      ),
    );
  }
}

initSharedPreference() async {
  if (!GetIt.I.isRegistered<SharedPreferencesController>()) {
    final sharedPreferences = await SharedPreferences.getInstance();
    instance.registerLazySingleton<SharedPreferencesController>(
        () => SharedPreferencesController(sharedPreferences));
  }
}

initFirebase() async {
  if (!GetIt.I.isRegistered<OnBoardingBloc>()) {
    instance.registerLazySingleton<OnBoardingBloc>(
      () => OnBoardingBloc(instance<SharedPreferencesController>()),
    );
  }

  if (!GetIt.I.isRegistered<Firebase>()) {
    final firebase = await Firebase.initializeApp();
    instance.registerLazySingleton<FirebaseApp>(() => firebase);
  }
  if (!GetIt.I.isRegistered<FirebaseAuth>()) {
    final firebaseAuth = FirebaseAuth.instance;
    instance.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);
  }
  if (!GetIt.I.isRegistered<FbAuthController>()) {
    instance.registerLazySingleton<FbAuthController>(
      () => FbAuthController(instance<FirebaseAuth>()),
    );
  }
  if (!GetIt.I.isRegistered<FbFirestoreController>()) {
    final firestore = FirebaseFirestore.instance;
    instance.registerLazySingleton<FbFirestoreController>(
        () => FbFirestoreController(firestore));
  }
}

initOnBoarding() {
  if (!GetIt.I.isRegistered<OnBoardingBloc>()) {
    instance.registerLazySingleton<OnBoardingBloc>(
      () => OnBoardingBloc(instance<SharedPreferencesController>()),
    );
  }
}

disposeOnBoarding() {
  if (GetIt.I.isRegistered<OnBoardingBloc>()) {
    instance<OnBoardingBloc>().close();
    instance.unregister<OnBoardingBloc>();
  }
}

initLogin() {
  if (!GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.registerLazySingleton<RemoteLoginDataSource>(
      () => RemoteLoginDataSourceImpl(instance<FbFirestoreController>()),
    );
  }
  if (!GetIt.I.isRegistered<LoginRepo>()) {
    instance.registerLazySingleton<LoginRepo>(
      () => LoginRepoImpl(
        instance<RemoteLoginDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<LoginBloc>()) {
    instance.registerLazySingleton<LoginBloc>(
      () => LoginBloc(instance<LoginRepo>()),
    );
  }
}

disposeLogin() {
  if (GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.unregister<RemoteLoginDataSource>();
  }
  if (GetIt.I.isRegistered<LoginRepo>()) {
    instance.unregister<LoginRepo>();
  }
  if (GetIt.I.isRegistered<LoginBloc>()) {
    instance<LoginBloc>().close();
    instance.unregister<LoginBloc>();
  }
}

initSecurityCode() {
  if (!GetIt.I.isRegistered<RemoteSecurityCodeDataSource>()) {
    instance.registerLazySingleton<RemoteSecurityCodeDataSource>(
      () => RemoteSecurityCodeDataSourceImpl(instance<FbAuthController>()),
    );
  }
  if (!GetIt.I.isRegistered<SecurityCodeRepo>()) {
    instance.registerLazySingleton<SecurityCodeRepo>(
      () => SecurityCodeRepoImpl(
        instance<RemoteSecurityCodeDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<SecurityCodeBloc>()) {
    instance.registerLazySingleton<SecurityCodeBloc>(
      () => SecurityCodeBloc(
        instance<SecurityCodeRepo>(),
      ),
    );
  }
}

disposeSecurityCode() {
  if (GetIt.I.isRegistered<RemoteSecurityCodeDataSource>()) {
    instance.unregister<RemoteSecurityCodeDataSource>();
  }
  if (GetIt.I.isRegistered<SecurityCodeRepo>()) {
    instance.unregister<SecurityCodeRepo>();
  }
  if (GetIt.I.isRegistered<SecurityCodeBloc>()) {
    instance.unregister<SecurityCodeBloc>();
  }
}

initCreateAccount() {}

disposeCreateAccount() {}

initMainController() {
  Get.put<MainController>(MainController());
}

disposeMainController() async {
  await Get.delete<MainController>();
}

initLogoutController() {
  Get.put<LogoutController>(LogoutController());
}

disposeLogoutController() async {
  await Get.delete<LogoutController>();
}
