import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:son_depremler/feature/home/model/home_model.dart';
import 'package:son_depremler/feature/map/viewmodel/map_view_model.dart';

import '../../../core/init/theme/color_scheme/color_scheme_light.dart';

class CustomMap extends StatelessWidget {
  final MapViewModel mapViewModel;
  final List<HomeModel>? quakes;
  const CustomMap({
    Key? key,
    required this.mapViewModel,
    required this.quakes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapViewModel.mapController,
      options: MapOptions(
        absorbPanEventsOnScrollables: true,
        center: LatLng(
          37.575275,
          36.922821,
        ),
        zoom: 9,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        CircleLayer(
          circles: List.generate(
            quakes?.length ?? 0,
            (index) => CircleMarker(
              color: ColorSchemeLight.instance.red.withOpacity(0.5),
              point: LatLng(
                double.parse(quakes![index].latitude!),
                double.parse(quakes![index].longitude!),
              ),
              radius: 5 * double.parse(quakes![index].magnitude!),
            ),
          ),
        ),
      ],
    );
  }
}
