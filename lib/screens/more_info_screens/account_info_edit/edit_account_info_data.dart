part of 'edit_account_info_imports.dart';
class EditAccountData{
  TextEditingController phoneController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  File newImage;
  final GenericCubit<File> pictureCubit=GenericCubit<File>(null);
  final GenericCubit<ModelProfileEdit> profileEditCubit=GenericCubit<ModelProfileEdit>(null);
  onUpdateProfileData(BuildContext context)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var userId = preferences.getInt('userId');
    print(userId);
    Map <String,dynamic>body={
      'user_id':userId,
      'name':nameController.text,
      'phone':phoneController.text,
      'avatar': newImage
    };
    var response = await Utils().api().upload(url: 'update-profile',body: body);
    ModelProfileEdit modelProfile = ModelProfileEdit.fromJson(response.data);
    profileEditCubit.onUpdateData(modelProfile);
    if(modelProfile.key.contains('success')){
      Navigator.of(context).pushReplacementNamed(AccountInformation.routeName);
    }
  }


  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );
    newImage = image;
    pictureCubit.onUpdateData(newImage);
  }

  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );
    newImage = image;
    pictureCubit.onUpdateData(newImage);
  }


  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}