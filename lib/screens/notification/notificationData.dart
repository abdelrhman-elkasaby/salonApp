part of 'notificationImports.dart';

class NotificationData{
  final GenericCubit<ModelNotification> notificationCubit=GenericCubit<ModelNotification>(null);
  onFetchNotificationData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = preferences.getInt('userId');
    print('the use id is :$userId');
    Map<String, dynamic> body = {
      'user_id': userId,
      'lang': 'ar',
    };
    var response = await Utils().api().post(url: 'user-notification', body: body);
    ModelNotification modelNotification = ModelNotification.fromJson(response.data);
    notificationCubit.onUpdateData(modelNotification);
  }
}