export 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
export 'package:get/get.dart';

export 'package:flutter/services.dart';
export 'package:animate_do/animate_do.dart';
export 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
export 'package:percent_indicator/circular_percent_indicator.dart';

// export 'package:get_it/get_it.dart';
export 'package:flutter/gestures.dart';
export 'package:flutter/material.dart';
export 'package:flutter/foundation.dart';

// export 'package:dartz/dartz.dart' hide State;
export 'package:flutter_svg/flutter_svg.dart';
export 'package:fluttertoast/fluttertoast.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:firebase_core/firebase_core.dart';

// export 'package:pretty_dio_logger/pretty_dio_logger.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';

// export 'package:cached_network_image/cached_network_image.dart';
export 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
export 'package:dartz/dartz.dart' hide State;
export '/core/internet_checker/internet_checker.dart';

///firebase_options file
// export '/firebase_options.dart';

///routes file
export '/routes/routes.dart';
export '/routes/route_generator.dart';

///config file
export '/config/all_imports.dart';
export '/config/constants/images.dart';
export '/config/dependency_injection.dart';
export '/config/constants/app_constants.dart';
export '/config/constants/firebase_constants.dart';
export '/config/constants/locale_constants.dart';
export '/config/constants/shared_preference_keys.dart';
export '/core/networking/firebase/firebase_auth_controller.dart';
export '/Widget/custom_button.dart';

///core file
export '/core/language/ar.dart';

export '/core/language/en.dart';
export '/core/util/size_util.dart';
export '/core/language/translation.dart';
export '/core/widgets/custom_appBar.dart';
export '/core/extensions/extensions.dart';
export '/core/service/theme_service.dart';
export '/core/widgets/custom_loading.dart';
export '/core/widgets/custom_spacing.dart';
export '/core/helper/function_helper.dart';
export '/core/resource/manager_sizes.dart';
export '/core/resource/manager_fonts.dart';
export '/core/widgets/custom_button.dart';
export '/core/resource/manager_assets.dart';
export '/core/resource/manager_colors.dart';
export '/core/theme/manager_dark_theme.dart';
export '/core/resource/manager_strings.dart';
export '/core/widgets/custom_rich_text.dart';
export '/core/models/code_country_model.dart';
export '/core/theme/manager_light_theme.dart';
export '/core/middleware/route_middleware.dart';
export '/core/error_handler/error_handler.dart';
export '/core/error_handler/response_code.dart';
export '/core/resource/manager_text_styles.dart';
export '/core/resource/manager_text_theme_dark.dart';
export '/core/resource/manager_text_theme_light.dart';
export '/core/widgets/custom_error_message_animation.dart';
export '/core/widgets/custom_enter_phone_number_filed.dart';
export '/core/storage/local/shared_preference/pref_controller.dart';
export '/core/networking/firebase/firebase_firestore_controller.dart';
export '/core/storage/local/shared_preference/shared_preferences_controller.dart';

///features file
//splash feature
export '/feature/splash/view/screens/splash_screen.dart';
export '/feature/splash/view/widgets/custom_appear_logo.dart';
export '/feature/splash/view/widgets/custom_circle_animation.dart';

//on_boarding feature
export '/feature/on_boarding/view/widgets/custom_slider.dart';
export '/feature/on_boarding/controller/on_boarding_bloc.dart';
export '/feature/on_boarding/view/screens/on_boarding_screen.dart';
export '/feature/on_boarding/view/widgets/custom_phone_animation.dart';
export '/feature/on_boarding/view/widgets/custom_avatar_animation.dart';
export '/feature/on_boarding/view/widgets/custom_title_on_boarding.dart';
export '/feature/on_boarding/view/widgets/custom_button_on_boarding.dart';
export '/feature/on_boarding/view/widgets/custom_sub_title_on_boarding.dart';
export '/feature/on_boarding/view/widgets/custom_first_page_on_boarding.dart';
export '/feature/on_boarding/view/widgets/custom_second_page_on_boarding.dart';

//login feature
export '/feature/login/controller/login_bloc.dart';
export '/feature/login/view/screens/login_screen.dart';
export '/feature/login/data/request/login_request.dart';
export '/feature/login/data/response/login_response.dart';
export '/feature/login/data/repo/login_repo.dart';
export '/feature/login/data/data_source/remote_login_data_source.dart';

//create_account
export '/feature/create_account/controller/create_account_bloc.dart';
export '/feature/create_account/view/screens/create_account_screen.dart';

//security_code
export '/feature/security_code/data/repo/security_code_repo.dart';
export '/feature/security_code/controller/security_code_bloc.dart';
export '/feature/security_code/view/screens/security_code_screen.dart';
export '/feature/security_code/view/widgets/custom_filed_security_code.dart';
export '/feature/security_code/data/request/send_security_code_request.dart';
export '/feature/security_code/data/response/send_security_code_response.dart';
export '/feature/security_code/data/request/verify_security_code_request.dart';
export '/feature/security_code/data/response/verify_security_code_response.dart';
export '/feature/security_code/data/data_source/remote_security_code_data_source.dart';

//logout feature
export '/feature/logout/presentation/controller/logout_bloc.dart';
export '/feature/logout/presentation/view/screens/logout_screen.dart';
export '/feature/logout/presentation/controller/logout_controller.dart';

//main feature
export '/feature/main/presentation/controller/main_controller.dart';
export '/feature/main/presentation/view/screens/main_screen.dart';

////////////////////////////////

export 'package:tabadul/Widget/custom_menu_choose.dart';
export 'package:tabadul/core/validator/validator.dart';

export '../../../../../Widget/custom_text_field.dart';
