part of 'assets.dart';

class ImagesAsset {
  ImagesAsset._();
  static ImagesAsset instance = ImagesAsset._();

  String get _assets => AppAssets.assets;

  String get _images => "$_assets/images";

  String get login => "$_images/login.png";
  String get weatherIcon => "$_images/weatherIcon.png";
  String get cloud => "$_images/cloud.png";
  String get cloudy => "$_images/cloudy.png";
  String get fog => "$_images/fog.png";
  String get heavycloudy => "$_images/heavycloudy.png";
  String get heavyrain => "$_images/heavyrain.png";
  String get humidity => "$_images/humidity.png";
  String get lightdrizzle => "$_images/lightdrizzle.png";
  String get lightrain => "$_images/lightrain.png";
  String get lightrainshower => "$_images/lightrainshower.png";

  String get mist => "$_images/mist.png";
  String get moderateorheavyrainshower =>
      "$_images/moderateorheavyrainshower.png";
  String get moderateorheavyrainwiththunder =>
      "$_images/moderateorheavyrainwiththunder.png";
  String get moderaterain => "$_images/moderaterain.png";
  String get moderaterainattimes => "$_images/moderaterainattimes.png";
  String get overcast => "$_images/overcast.png";
  String get partlycloudy => "$_images/partlycloudy.png";

  String get patchylightdrizzle => "$_images/patchylightdrizzle.png";
  String get patchylightrain => "$_images/patchylightrain.png";
  String get patchylightrainwiththunder =>
      "$_images/patchylightrainwiththunder.png";
  String get patchyrainpossible => "$_images/patchyrainpossible.png";
  String get sunny => "$_images/sunny.png";
  String get thunderyoutbreakspossible =>
      "$_images/thunderyoutbreakspossible.png";
  String get windspeed => "$_images/windspeed.png";
}
