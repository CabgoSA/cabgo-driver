import 'package:map_launcher/map_launcher.dart';

class MapUtil{


void drive(Coords coords, String title, String description) async{

if (await MapLauncher.isMapAvailable(MapType.google)) {
  await MapLauncher.showMarker(
    mapType: MapType.google,
    coords: coords,
    title: title,
    description: description,
  );
}

}

}