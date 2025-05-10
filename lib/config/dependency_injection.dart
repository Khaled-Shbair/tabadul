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

initNetworkInfo() async {
  if (!GetIt.I.isRegistered<InternetConnection>()) {
    instance.registerLazySingleton<InternetConnection>(
      () => InternetConnection(),
    );
    debugPrint(
        'InternetConnection: ${await instance<InternetConnection>().hasInternetAccess}');
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
  if (!GetIt.I.isRegistered<FirebaseApp>()) {
    final firebase = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseFirestore.instance.settings =
        const Settings(persistenceEnabled: true);
    instance.registerLazySingleton<FirebaseApp>(() => firebase);
  }
  if (!GetIt.I.isRegistered<FirebaseAuth>()) {
    instance.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  }
  if (!GetIt.I.isRegistered<FbAuthController>()) {
    instance.registerLazySingleton<FbAuthController>(
      () => FbAuthController(instance<FirebaseAuth>()),
    );
  }
  if (!GetIt.I.isRegistered<FirebaseFirestore>()) {
    instance.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
  }
  if (!GetIt.I.isRegistered<FbFirestoreController>()) {
    instance.registerLazySingleton<FbFirestoreController>(
        () => FbFirestoreController(instance<FirebaseFirestore>()));
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
    instance.unregister<OnBoardingBloc>();
  }
}

initLogin() {
  if (!GetIt.I.isRegistered<RemoteAuthDataSource>()) {
    instance.registerLazySingleton<RemoteAuthDataSource>(
      () => RemoteAuthDataSourceImpl(instance<FbFirestoreController>()),
    );
  }
  if (!GetIt.I.isRegistered<AuthRepo>()) {
    instance.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(
        instance<RemoteAuthDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<LoginBloc>()) {
    instance.registerLazySingleton<LoginBloc>(
      () => LoginBloc(instance<AuthRepo>()),
    );
  }
}

disposeLogin() {
  if (GetIt.I.isRegistered<RemoteAuthDataSource>()) {
    instance.unregister<RemoteAuthDataSource>();
  }
  if (GetIt.I.isRegistered<AuthRepo>()) {
    instance.unregister<AuthRepo>();
  }
  if (GetIt.I.isRegistered<LoginBloc>()) {
    instance.unregister<LoginBloc>();
  }
}

initCreateAccount() {
  if (!GetIt.I.isRegistered<RemoteAuthDataSource>()) {
    instance.registerLazySingleton<RemoteAuthDataSource>(
      () => RemoteAuthDataSourceImpl(instance<FbFirestoreController>()),
    );
  }
  if (!GetIt.I.isRegistered<AuthRepo>()) {
    instance.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(
        instance<RemoteAuthDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<CreateAccountBloc>()) {
    instance.registerLazySingleton<CreateAccountBloc>(
      () => CreateAccountBloc(instance<AuthRepo>()),
    );
  }
}

disposeCreateAccount() {
  if (GetIt.I.isRegistered<CreateAccountBloc>()) {
    instance.unregister<CreateAccountBloc>();
  }
}

initSecurityCode() {
  if (!GetIt.I.isRegistered<RemoteSecurityCodeDataSource>()) {
    instance.registerLazySingleton<RemoteSecurityCodeDataSource>(
      () => RemoteSecurityCodeDataSourceImpl(
        instance<FbAuthController>(),
        instance<FbFirestoreController>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<SecurityCodeRepo>()) {
    instance.registerLazySingleton<SecurityCodeRepo>(
      () => SecurityCodeRepoImpl(
        instance<RemoteSecurityCodeDataSource>(),
        instance<NetworkInfo>(),
        instance<SharedPreferencesController>(),
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
  if (!GetIt.I.isRegistered<TimerBloc>()) {
    instance.registerLazySingleton<TimerBloc>(() => TimerBloc());
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
  if (GetIt.I.isRegistered<TimerBloc>()) {
    instance.unregister<TimerBloc>();
  }
}

initAddPersonalInformation() {
  if (!GetIt.I.isRegistered<RemoteAddPersonalInformationDataSource>()) {
    instance.registerLazySingleton<RemoteAddPersonalInformationDataSource>(
      () => RemoteAddPersonalInformationDataSourceImpl(
        instance<FbFirestoreController>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<AddPersonalInformationRepo>()) {
    instance.registerLazySingleton<AddPersonalInformationRepo>(
        () => AddPersonalInformationRepoImpl(
              instance<RemoteAddPersonalInformationDataSource>(),
              instance<NetworkInfo>(),
            ));
  }
  if (!GetIt.I.isRegistered<AddPersonalInformationBloc>()) {
    instance.registerLazySingleton<AddPersonalInformationBloc>(() =>
        AddPersonalInformationBloc(instance<AddPersonalInformationRepo>()));
  }
}

disposeAddPersonalInformation() async {
  if (GetIt.I.isRegistered<RemoteAddPersonalInformationDataSource>()) {
    instance.unregister<RemoteAddPersonalInformationDataSource>();
  }
  if (GetIt.I.isRegistered<AddPersonalInformationRepo>()) {
    instance.unregister<AddPersonalInformationRepo>();
  }
  if (GetIt.I.isRegistered<AddPersonalInformationBloc>()) {
    instance.unregister<AddPersonalInformationBloc>();
  }
}

initMain() {
  disposeLogin();
  disposeCreateAccount();
  if (!GetIt.I.isRegistered<MainBloc>()) {
    instance.registerLazySingleton<MainBloc>(() => MainBloc());
  }
}

disposeMain() {
  if (GetIt.I.isRegistered<MainBloc>()) {
    instance.unregister<MainBloc>();
  }
}

initLogout() {
  if (!GetIt.I.isRegistered<RemoteLogoutDataSource>()) {
    instance.registerLazySingleton<RemoteLogoutDataSource>(
        () => RemoteLogoutDataSourceImpl(instance<FbAuthController>()));
  }
  if (!GetIt.I.isRegistered<LogoutRepo>()) {
    instance.registerLazySingleton<LogoutRepo>(() => LogoutRepoImpl(
          instance<RemoteLogoutDataSource>(),
          instance<NetworkInfo>(),
        ));
  }
  if (!GetIt.I.isRegistered<LogoutBloc>()) {
    instance.registerLazySingleton<LogoutBloc>(() => LogoutBloc(
          instance<SharedPreferencesController>(),
          instance<LogoutRepo>(),
        ));
  }
}

disposeLogout() async {
  if (GetIt.I.isRegistered<RemoteLogoutDataSource>()) {
    instance.unregister<RemoteLogoutDataSource>();
  }
  if (GetIt.I.isRegistered<LogoutRepo>()) {
    instance.unregister<LogoutRepo>();
  }
  if (GetIt.I.isRegistered<LogoutBloc>()) {
    instance.unregister<LogoutBloc>();
  }
}
