part of 'who_we_are_imports.dart';
class WhoWeAreData{
  final GenericCubit<ModelTerm> aboutUsCubit=GenericCubit<ModelTerm>(null);
  onFetchAboutUsData()async{
    var response=await Utils().api().get(url: "about-us?lang=ar");
    ModelTerm modelTerm=ModelTerm.fromJson(response.data);
    aboutUsCubit.onUpdateData(modelTerm);
  }
}