
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../shared_widget/permission_dialog.dart';


// LoginViewModel authProvider =getIt();
// UpdateProfileLawyerViewModel updateProfileProvider =getIt();
class MapLocation extends StatefulWidget {
  const MapLocation({super.key,  this.latitude,  this.longitude, this.changeLocation=true});
  final String? latitude ;
  final String? longitude ;
  final bool? changeLocation ;

  @override
  State<MapLocation> createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  late GoogleMapController mapController;
  LatLng currentLocation = const LatLng(0, 0);
  bool isLoading = false;
  String lat = '';
  String long = '';
  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

  void _getCurrentLocation() async {
    setState(() {
      isLoading = true;
    });
    try {
      print("kdfnvkdfnbjkdfnbjkdfbffffffffffffffffffffffffffffffffffffffffffuu${widget.latitude??'0'}");
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks;
      LatLng newLocation ;
      if((widget.longitude?.isNotEmpty??false)&&(widget.latitude?.isNotEmpty??false)){
        newLocation = LatLng(double.parse(widget.latitude??'0'), double.parse(widget.longitude??'0'));
        placemarks= await placemarkFromCoordinates(double.parse(widget.latitude??'0'), double.parse(widget.longitude??'0'));
      }else{
        newLocation = LatLng(position.latitude, position.longitude);
        placemarks= await placemarkFromCoordinates(position.latitude, position.longitude);
      }
      String newLocationName = placemarks.isNotEmpty ? '${placemarks[0].street}' : '';
      setState(() {
        currentLocation = newLocation;
        lat = position.latitude.toString();
        long = position.longitude.toString();
        // authProvider.latitude=position.latitude.toString();
        // authProvider.longitude=position.longitude.toString();
        // authProvider.address=newLocationName;
        // updateProfileProvider.late=position.latitude.toString();
        // updateProfileProvider.long=position.longitude.toString();
        // updateProfileProvider.representativeAddressController.text=newLocationName;
        print('${position.latitude}mmm${position.longitude}mmm$newLocationName');
        isLoading = false;
      });
      mapController.animateCamera(CameraUpdate.newLatLng(newLocation));
    } catch (e) {
      // setState(() {
      isLoading = false;
      // });
      if (kDebugMode) {
        print(e);
      }
    }
  }



  void _onMapCreated(GoogleMapController controller) {
    // setState(() {
    mapController = controller;
    // });
  }

  void _updateAddress(LatLng newLocation) async{
    List<Placemark> placemarks = await placemarkFromCoordinates(newLocation.latitude, newLocation.longitude);
    String newLocationName = placemarks.isNotEmpty ? placemarks[0].street ?? '' : '';
    setState(()  {
      currentLocation = newLocation;
      lat = newLocation.latitude.toString();
      long = newLocation.longitude.toString();
      // authProvider.latitude=newLocation.latitude.toString();
      // authProvider.longitude=newLocation.longitude.toString();
      // authProvider.address=newLocationName;
      // updateProfileProvider.late=newLocation.latitude.toString();
      // updateProfileProvider.long=newLocation.longitude.toString();
      // updateProfileProvider.representativeAddressController.text=newLocationName;
      print('${newLocation.latitude}mmm${newLocation.longitude}mmm$newLocationName');
    });
  }

  void _moveMarker(LatLng newLocation) {
    mapController.animateCamera(CameraUpdate.newLatLng(newLocation));
    _updateAddress(newLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),):
      GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        onMapCreated: _onMapCreated,

        onTap:widget.changeLocation==true? _moveMarker:null,
        initialCameraPosition: CameraPosition(
          target: currentLocation,
          zoom: 15,
        ),
        markers: <Marker>{
          Marker(
            markerId: const MarkerId('current_location'),
            position: currentLocation,
            draggable: true,
            onDragEnd: (newPosition) => _updateAddress(newPosition),
          ),
        },
      ),
    );
  }
  Future<void> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      print('Location permission granted');
    } else if (status.isDenied) {
      print('Location permission denied');
    } else if (status.isPermanentlyDenied) {
      print('Location permission permanently denied');
      showPermissionDialog('LocaleKeys.enterSiteData.tr()');
      // await openAppSettings();
    } else if (status.isRestricted) {
      // Permission is restricted (iOS only)
      if (kDebugMode) {
        print('Location permission restricted');
      }
    }
    _getCurrentLocation();
  }

}