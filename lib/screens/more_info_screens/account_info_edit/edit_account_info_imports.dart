
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_frist_try/Models/model_profile_edit.dart';
import 'package:flutter_frist_try/base/Bloc/cubits/generic_cubit/generic_cubit.dart';
import 'package:flutter_frist_try/my_info/utils/Utils.dart';
import 'package:flutter_frist_try/screens/localization/language_constant.dart';
import 'package:flutter_frist_try/screens/more_info_screens/account_info/accountInfoImports.dart';
import 'package:flutter_frist_try/screens/more_info_screens/change_password/change_password_imports.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';


part 'edit_account_info.dart';
part 'edit_account_info_data.dart';