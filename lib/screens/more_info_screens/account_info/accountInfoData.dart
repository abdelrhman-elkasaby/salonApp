part of 'accountInfoImports.dart';
class AccountInfoData{
  final GenericCubit<ModelProfile> profileCubit=GenericCubit<ModelProfile>(null);
  onFetchProfileData()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var userId = preferences.getInt('userId');
    print(userId);

    Map <String,dynamic>body={
      'user_id':userId
    };
    var response = await Utils().api().post(url: 'user-profile', body: body);
    ModelProfile modelProfile = ModelProfile.fromJson(response.data);
    profileCubit.onUpdateData(modelProfile);
  }
}