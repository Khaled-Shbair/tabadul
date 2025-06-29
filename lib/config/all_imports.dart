export 'dart:async';
export 'dart:io' hide HeaderValue;
export 'package:get_it/get_it.dart';
export 'package:flutter/gestures.dart';
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:animate_do/animate_do.dart';
export 'package:dropdown_search/dropdown_search.dart'
    hide defaultScrollNotificationPredicate;
export 'package:flutter_svg/flutter_svg.dart';
export 'package:fluttertoast/fluttertoast.dart';
export 'package:image_picker/image_picker.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:dartz/dartz.dart' hide State, Order;
export 'package:flutter/foundation.dart' hide kIsWasm;
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
export 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
export 'package:cached_network_image/cached_network_image.dart';
export 'package:firebase_storage/firebase_storage.dart' hide Task;
export 'package:percent_indicator/circular_percent_indicator.dart';
export 'package:easy_localization/easy_localization.dart' hide TextDirection;
export 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

///firebase_options file
export '/firebase_options.dart';

///routes file
export '/routes/routes.dart';
export '/routes/route_generator.dart';
export '/routes/app_route_observer.dart';

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
export '/core/helper/url_launcher.dart';
export '/core/widgets/custom_toast.dart';
export '/core/language/translation.dart';
export '/core/extensions/extensions.dart';
export '/core/service/theme_service.dart';
export '/core/widgets/custom_button.dart';
export '/core/widgets/custom_app_bar.dart';
export '/core/widgets/custom_loading.dart';
export '/core/widgets/custom_spacing.dart';
export '/core/helper/function_helper.dart';
export '/core/resource/manager_sizes.dart';
export '/core/resource/manager_fonts.dart';
export '/core/helper/image_compressor.dart';
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
export '/core/bloc_observer/app_bloc_observer.dart';
export '/core/resource/manager_text_theme_dark.dart';
export '/core/resource/manager_text_theme_light.dart';
export '/core/internet_checker/internet_checker.dart';
export '/core/widgets/custom_image_selection_box.dart';
export '/core/networking/firebase/firebase_auth_controller.dart';
export '/core/storage/local/shared_preference/pref_controller.dart';
export '/core/networking/firebase/firebase_storage_controller.dart';
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
export '/feature/auth/data/request/auth_request.dart';
export '/feature/auth/data/response/auth_response.dart';
export '/feature/auth/login/controller/login_bloc.dart';
export '/feature/auth/login/view/screens/login_screen.dart';
export '/feature/auth/security_code/controller/timer_bloc.dart';
export '/feature/auth/widgets/custom_menu_choose_code_country.dart';
export '/feature/auth/widgets/custom_enter_phone_number_filed.dart';
export '/feature/auth/data/request/send_security_code_request.dart';
export '/feature/auth/data/data_source/remote_auth_data_source.dart';
export '/feature/auth/data/response/send_security_code_response.dart';
export '/feature/auth/data/request/verify_security_code_request.dart';
export '../feature/auth/logout/controller/logout_bloc.dart';
export '/feature/auth/data/response/verify_security_code_response.dart';
export '/feature/auth/security_code/controller/security_code_bloc.dart';
export '/feature/auth/create_account/controller/create_account_bloc.dart';
export '../feature/auth/logout/view/screens/logout_screen.dart';
export '/feature/auth/security_code/view/screens/security_code_screen.dart';
export '/feature/auth/create_account/view/screens/create_account_screen.dart';
export '/feature/auth/security_code/view/widgets/custom_filed_security_code.dart';
export '/feature/auth/security_code/view/widgets/custom_error_message_animation.dart';

//main feature
export '/feature/main/controller/main_bloc.dart';
export '/feature/main/model/menu_item_model.dart';
export '/feature/main/view/screens/main_screen.dart';
export '/feature/main/view/widgets/custom_main_screen.dart';
export '/feature/main/view/widgets/custom_menu_screen.dart';

//home feature
export '/feature/home/view/screens/home_screen.dart';
export '/feature/home/view/widgets/custom_department_button.dart';

//add_personal_information feature
export '../core/models/cities_model.dart';
export '../core/models/regions_model.dart';
export '/feature/add_personal_information/view/widgets/custom_image_animation.dart';
export '/feature/add_personal_information/data/repo/add_personal_information_repo.dart';
export '/feature/add_personal_information/controller/add_personal_information_bloc.dart';
export '/feature/add_personal_information/view/screens/add_personal_information_screen.dart';
export '/feature/add_personal_information/data/request/add_personal_information_request.dart';
export '/feature/add_personal_information/data/response/add_personal_information_response.dart';
export '/feature/add_personal_information/view/screens/account_created_successfully_screen.dart';
export '/feature/add_personal_information/data/data_source/remote_add_personal_information_data_source.dart';

//profile feature
export '/feature/profile/data/repo/profile_repo.dart';
export '/feature/profile/view/screens/profile_screen.dart';
export '/feature/profile/controller/edit_profile_bloc.dart'
    show EditProfileBloc;
export '/feature/profile/view/widget/custom_personal_data.dart';
export '/feature/profile/view/screens/edit_profile_screen.dart';
export '/feature/profile/data/request/edit_profile_request.dart';
export '../core/models/edit_profile_response.dart';
export '/feature/profile/data/data_source/remote_profile_data_source.dart';

//info feature
export '/feature/info/view/screens/info_screen.dart';

//notifications feature
export '/feature/notifications/data/repo/notifications_repo.dart';
export '/feature/notifications/controller/notifications_bloc.dart';
export '/feature/notifications/view/screens/notifications_screen.dart';
export '/feature/notifications/data/request/notifications_request.dart';
export '/feature/notifications/data/response/notifications_response.dart';
export '/feature/notifications/data/data_source/remote_notifications_data_source.dart';

//products feature
export '/feature/products/data/repo/products_repo.dart';
export '/feature/products/controller/add_product_bloc.dart';
export '/feature/products/view/widgets/custom_time_box.dart';
export '/feature/products/controller/shop_products_bloc.dart';
export '/feature/products/controller/delivery_time_bloc.dart';
export '/feature/products/data/response/product_response.dart';
export '/feature/products/data/response/products_response.dart';
export '/feature/products/view/screens/add_product_screen.dart';
export '/feature/products/data/request/add_product_request.dart';
export '/feature/products/view/screens/delivery_time_screen.dart';
export '/feature/products/data/request/get_products_request.dart';
export '/feature/products/view/screens/answer_is_yes_screen.dart';
export '/feature/products/data/response/add_product_response.dart';
export '/feature/products/view/screens/wait_for_pickup_screen.dart';
export '/feature/products/view/widgets/custom_add_product_tap.dart';
export '/feature/products/view/screens/product_details_screen.dart';
export '/feature/auth/security_code/view/widgets/custom_timer.dart';
export '/feature/products/view/screens/ready_to_receive_screen.dart';
export '/feature/products/view/widgets/custom_image_of_product.dart';
export '/feature/products/view/widgets/custom_shop_products_tap.dart';
export '/feature/products/view/screens/shop_and_add_products_screen.dart';
export '/feature/products/view/widgets/custom_box_of_product_details.dart';
export '/feature/products/data/data_source/remote_products_data_source.dart';
export '/feature/products/view/screens/added_product_successfully_screen.dart';
export '/feature/products/view/widgets/custom_box_of_add_photo_of_product.dart';

//provides_services feature
export '/feature/services_provides/data/repo/provides_services_repo.dart';
export '/feature/services_provides/view/screens/list_provides_services_screen.dart';
export '/feature/services_provides/view/screens/profile_provide_service_screen.dart';
export '/feature/services_provides/controller/register_as_service_provide_bloc.dart';
export '/feature/services_provides/controller/edit_profile_provide_service_bloc.dart';
export '/feature/services_provides/view/screens/register_as_service_provide_screen.dart';
export '/feature/services_provides/view/screens/edit_profile_provide_service_screen.dart';
export '/feature/services_provides/data/response/register_as_service_provide_response.dart';
export '/feature/services_provides/view/widgets/custom_widget_details_service_provide.dart';
export '/feature/services_provides/data/data_source/remote_provides_services_data_source.dart';
export '/feature/services_provides/view/screens/register_as_service_provide_successfully_screen.dart';
