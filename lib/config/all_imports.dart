export 'dart:async';
export 'package:get/get.dart';
export 'package:flutter/services.dart';
export 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
export 'package:animate_do/animate_do.dart';
export 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
export 'package:percent_indicator/circular_percent_indicator.dart';
export 'package:dartz/dartz.dart' hide State, Order;
export 'package:cloud_firestore/cloud_firestore.dart';

export 'package:get_it/get_it.dart';
export 'package:flutter/gestures.dart';
export 'package:flutter/material.dart';
export 'package:flutter/foundation.dart' hide kIsWasm;
export 'package:dropdown_search/dropdown_search.dart'
    hide defaultScrollNotificationPredicate;

export 'package:flutter_svg/flutter_svg.dart';
export 'package:fluttertoast/fluttertoast.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:firebase_core/firebase_core.dart';

export 'package:shared_preferences/shared_preferences.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';

export 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

///firebase_options file
export '/firebase_options.dart';

///routes file
export '/routes/routes.dart';
export '/routes/route_generator.dart';

///config file
export '/config/all_imports.dart';
export '/config/dependency_injection.dart';
export '/config/constants/app_constants.dart';
export '/config/constants/firebase_constants.dart';
export '/config/constants/locale_constants.dart';
export '/config/constants/shared_preference_keys.dart';

///core file
export '/core/language/ar.dart';
export '/core/language/en.dart';
export '/core/util/size_util.dart';
export '/core/models/user_model.dart';
export '/core/validator/validator.dart';
export '/core/widgets/custom_toast.dart';
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
export '/core/widgets/custom_text_field.dart';
export '/core/middleware/route_middleware.dart';
export '/core/error_handler/error_handler.dart';
export '/core/error_handler/response_code.dart';
export '/core/resource/manager_text_styles.dart';
export '/core/widgets/custom_dropdown_search.dart';
export '/core/resource/manager_text_theme_dark.dart';
export '/core/resource/manager_text_theme_light.dart';
export '/core/internet_checker/internet_checker.dart';
export '/core/networking/firebase/firebase_auth_controller.dart';
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

//auth feature (login & create account)
export '/feature/auth/data/repo/auth_repo.dart';
export '/feature/auth/controller/login_bloc.dart';
export '/feature/auth/view/screens/login_screen.dart';
export '/feature/auth/data/request/auth_request.dart';
export '/feature/auth/data/response/auth_response.dart';
export '/feature/auth/controller/create_account_bloc.dart';
export '/feature/auth/view/screens/create_account_screen.dart';
export '/feature/auth/data/data_source/remote_auth_data_source.dart';
export '/feature/auth/view/widgets/custom_enter_phone_number_filed.dart';

//security_code
export '/feature/security_code/controller/timer_bloc.dart';
export '/feature/security_code/data/repo/security_code_repo.dart';
export '/feature/security_code/controller/security_code_bloc.dart';
export '/feature/security_code/view/screens/security_code_screen.dart';
export '/feature/security_code/view/widgets/custom_filed_security_code.dart';
export '/feature/security_code/data/request/send_security_code_request.dart';
export '/feature/security_code/data/response/send_security_code_response.dart';
export '/feature/security_code/data/request/verify_security_code_request.dart';
export '/feature/security_code/view/widgets/custom_error_message_animation.dart';
export '/feature/security_code/data/response/verify_security_code_response.dart';
export '/feature/security_code/data/data_source/remote_security_code_data_source.dart';

//logout feature
export '/feature/logout/date/repo/logout_repo.dart';
export '/feature/logout/presentation/controller/logout_bloc.dart';
export '/feature/logout/presentation/view/screens/logout_screen.dart';
export '/feature/logout/date/data_source/remote_logout_data_source.dart';

//main feature
export '/feature/main/controller/main_bloc.dart';
export '/feature/main/model/menu_item_model.dart';
export '/feature/main/view/widgets/custom_main_screen.dart';
export '/feature/main/view/widgets/custom_menu_screen.dart';

//home feature
export '/feature/home/view/screens/home_screen.dart';
export '/feature/home/view/widgets/custom_department_button.dart';

//add_personal_information feature
export '/feature/add_personal_information/data/response/cities_response.dart';
export '/feature/add_personal_information/data/response/regions_response.dart';
export '/feature/add_personal_information/view/widgets/custom_image_animation.dart';
export '/feature/add_personal_information/data/repo/add_personal_information_repo.dart';
export '/feature/add_personal_information/controller/add_personal_information_bloc.dart';
export '/feature/add_personal_information/view/screens/add_personal_information_screen.dart';
export '/feature/add_personal_information/data/request/add_personal_information_request.dart';
export '/feature/add_personal_information/data/response/add_personal_information_response.dart';
export '/feature/add_personal_information/view/screens/account_created_successfully_screen.dart';
export '/feature/add_personal_information/data/data_source/remote_add_personal_information_data_source.dart';

////////////////////////////////

export 'package:tabadul/Widget/custom_menu_choose.dart';

export '/feature/notifications/view/screens/notifications_screen.dart';
export '/feature/profile/view/screens/profile_screen.dart';
export '/Screen/Provide_Service_Screen/List_Provide_Service_Screen.dart';
