import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class MediaService {
  // Future<File> getImage() async {
  //   PickedFile image =
  //       await ImagePicker().getImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     return File(image.path);
  //   } else {
  //     return null;
  //   }
  // }
  //
  // Future<File> getVideo() async {
  //   PickedFile image =
  //       await ImagePicker().getVideo(source: ImageSource.gallery);
  //   if (image != null) {
  //     return File(image.path);
  //   } else {
  //     return null;
  //   }
  // }

  Future<List<Asset>> onPickMultiImages(
      {List<Asset> imagesMulti, String errorTxt}) async {
    List<Asset> resultList = [];
    resultList = await MultiImagePicker.pickImages(
      maxImages: 5,
      enableCamera: true,
      selectedAssets: imagesMulti,
      cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
      materialOptions: MaterialOptions(
        actionBarColor: "#abcdef",
        actionBarTitle: "Mansoura Zone",
        allViewTitle: "All Photos",
        selectionLimitReachedText: 'الحد المسموع به للصور هو 5 صور فقط',
        useDetailsView: false,
        selectCircleStrokeColor: "#000000",
      ),
    );
    return resultList;
  }
}
