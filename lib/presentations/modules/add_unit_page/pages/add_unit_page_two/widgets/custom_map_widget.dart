
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/add_unit_view_model.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../injection.dart';
import '../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../components/inputs/custom_text_form.dart';
import '../../../../../shared_widget/permission_dialog.dart';




class MapLocation extends StatefulWidget {
  const MapLocation({super.key,  this.latitude,  this.longitude, this.changeLocation=true});
  final String? latitude ;
  final String? longitude ;
  final bool? changeLocation ;

  @override
  State<MapLocation> createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  AddUnitViewModel provider =getIt();
  LocalUserData saveData =getIt();
  TextEditingController mapSearchController =TextEditingController();

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
      LatLng newLocation;
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

        provider.latitude=position.latitude.toString();
        provider.longitude=position.longitude.toString();
        provider.address=newLocationName;

        print('${position.latitude}mmm${position.longitude}mmm$newLocationName');
        isLoading = false;
      });
      // Update this line to include zoom level
      mapController.animateCamera(
        CameraUpdate.newLatLngZoom(newLocation, 15),
      );
    } catch (e) {
      isLoading = false;
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

      provider.latitude=newLocation.latitude.toString();
      provider.longitude=newLocation.longitude.toString();
      provider.address=newLocationName;

      print('${newLocation.latitude}mmm${newLocation.longitude}mmm$newLocationName');
    });
  }

  void _moveMarker(LatLng newLocation) {
    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(newLocation, 15),
    );
    _updateAddress(newLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor,strokeWidth: 3.w),):
      Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            onMapCreated: _onMapCreated,
            onTap: widget.changeLocation == true ? _moveMarker : null,
            initialCameraPosition: CameraPosition(
              target: currentLocation,
              zoom: 15, // Set initial zoom level
            ),
            markers: <Marker>{
              Marker(
                markerId: const MarkerId('current_location'),
                position: currentLocation,
                draggable: true,
                onDragEnd: (newPosition) {
                  _updateAddress(newPosition);
                  // Optional: zoom to new position when dragged
                  mapController.animateCamera(
                    CameraUpdate.newLatLngZoom(newPosition, 15),
                  );
                },
              ),
            },
          ),
          Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimens.padding_12h),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      elevation: 3,
                      borderRadius:
                      BorderRadius.circular(8.r),
                      child: CustomTextFormField(
                        controller: mapSearchController,
                        bgColor: AppColors.white,
                        width: 248.w,
                        height: 35.h,
                        onChange: (value){
                          // final newLatLng = await
                          searchAddress(value, 'AIzaSyBJ4shhmSia3lS_qlIeueaCeYBg7-LUiF4', saveData.getLang());
                          // _moveMarker(newLatLng, isSearch: false);
                        },
                        underLineColor: Colors.transparent,
                        borderRaduis: 8.r,
                        suffix: CustomSvgIcon(
                          assetName: AppAssets.searchIcon,
                          width: 16.w,
                          height: 16.h,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimens.padding_8h),
                      ),
                    ),
                    Container(
                      width: 35.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(8.r),
                          color: AppColors.primaryColor),
                      child: Center(
                          child: CustomSvgIcon(
                              assetName: AppAssets.doneIcon,
                              width: 20.5.w,
                              height: 16.5.h)),
                    )
                  ],
                ),
              ))
        ],
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
      await openAppSettings();
    } else if (status.isRestricted) {
      // Permission is restricted (iOS only)
      if (kDebugMode) {
        print('Location permission restricted');
      }
    }
    _getCurrentLocation();
  }

  Future<LatLng> searchAddress(String query, String apiKey, String lang) async {
    final encodedQuery = Uri.encodeComponent(query);
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$encodedQuery&key=$apiKey&language=$lang');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == 'OK' && data['results'].isNotEmpty) {
          final location = data['results'][0]['geometry']['location'];
          final lats = location['lat'] as double;
          final lng = location['lng'] as double;

          currentLocation = LatLng(lats, lng);
          _updateAddress(LatLng(lats, lng));
          setState(() {
            lat = lats.toString();
            long = lng.toString();
          });

          // Zoom to the new location
          mapController.animateCamera(
            CameraUpdate.newLatLngZoom(LatLng(lats, lng), 15),
          );

          return currentLocation;
        } else {
          throw Exception('No results found for "$query".');
        }
      } else {
        throw Exception('API error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to search for locations: $e');
    }
  }}