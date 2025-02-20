import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_style.dart';



class ShowMapWidget extends StatelessWidget {
   const ShowMapWidget({super.key,  this.latitude,  this.longitude});
  final String? latitude ;
  final String? longitude ;

  Future<BitmapDescriptor> _setCustomMapPin() async {
   return BitmapDescriptor.asset(width: 48.w, height: 48.w, ImageConfiguration(size: Size(48.w, 48.w)), 'assets/images/icons/pin_show.png');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BitmapDescriptor>(
        future: _setCustomMapPin(), // Load the marker icon
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator()));
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading marker'));
          }
          BitmapDescriptor? customIcon = snapshot.data;
          return GoogleMap(
          scrollGesturesEnabled: false,
          mapToolbarEnabled: false,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: false,
          myLocationButtonEnabled: false,
          padding: EdgeInsets.symmetric(vertical: 60.h),
          myLocationEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            controller.setMapStyle(mapStyle);
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(double.parse(latitude??'0'), double.parse(longitude??'0')),
            zoom: 15,
          ),
          markers: <Marker>{
            Marker(
              markerId: const MarkerId('customPin'),
              position: LatLng(double.parse(latitude??'0'), double.parse(longitude??'0')),
              icon:customIcon ?? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
            ),
          },
        );
      }
    );
  }
}