part of 'termsAndConditionsImports.dart';
class TermsAndConditionsData{
  final GenericCubit<ModelTerm> termCubit=GenericCubit<ModelTerm>(null);
  onFetchTermsData()async{
    var response=await Utils().api().get(url: "terms?lang=ar");
    ModelTerm modelTerm=ModelTerm.fromJson(response.data);
    termCubit.onUpdateData(modelTerm);
  }
}