part of 'operatorNameImports.dart';
class OperatorNameData {
  Widget buildCarousel(BuildContext context, ModelProviderDetails modelProviderDetails) {
    if (modelProviderDetails.data.info.image.isEmpty) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Center(child: Text('لا يوجد صور')),
      );
    }
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: true,
        height: MediaQuery.of(context).size.height * 0.25,
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            modelProviderDetails.data.info.image,
            fit: BoxFit.fill,
          ),
        );
      },
      itemCount: modelProviderDetails.data.info.image.length,
    );
  }

}