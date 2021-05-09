import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_frist_try/providers/auth_provider.dart';
import 'package:flutter_frist_try/screens/Orders/order_details.dart';
import 'package:flutter_frist_try/screens/auth_screens/forgot_password.dart';
import 'package:flutter_frist_try/screens/auth_screens/login/login_screen.dart';
import 'package:flutter_frist_try/screens/auth_screens/restore_password.dart';
import 'package:flutter_frist_try/screens/auth_screens/signup/signup_screen.dart';
import 'package:flutter_frist_try/screens/auth_screens/verify_account/verify_acc_screen.dart';
import 'package:flutter_frist_try/screens/cart/cartScreen/cartScreenImports.dart';
import 'package:flutter_frist_try/screens/cart/choose_payment_method.dart';
import 'package:flutter_frist_try/screens/chooseLanguage/choose_language_imports.dart';
import 'package:flutter_frist_try/screens/localization/demo.dart';
import 'package:flutter_frist_try/screens/localization/language_constant.dart';
import 'package:flutter_frist_try/screens/more_info_screens/account_info/accountInfoImports.dart';
import 'package:flutter_frist_try/screens/more_info_screens/call_us.dart';
import 'package:flutter_frist_try/screens/more_info_screens/more_info_language/more_info_language_imports.dart';
import 'package:flutter_frist_try/screens/more_info_screens/who_we_are/who_we_are_imports.dart';
import 'package:flutter_frist_try/screens/notification/notificationImports.dart';
import 'package:flutter_frist_try/screens/routePage/route_page_imports.dart';
import 'package:flutter_frist_try/screens/splash/splash_screenImports.dart';
import 'package:flutter_frist_try/screens/termsAndConditions/termsAndConditionsImports.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'base/Bloc/BlocObserver.dart';
import 'my_info/base/Injection/Locator.dart';
part 'main.dart';