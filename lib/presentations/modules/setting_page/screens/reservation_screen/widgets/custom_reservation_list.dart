import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/screen_state/no_data.dart';
import 'package:pronight_vendor/presentations/app_loader.dart';
import 'package:pronight_vendor/presentations/modules/home_page/home_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/dimens/dimens.dart';
import 'custom_reservation_item.dart';

class CustomReservationList extends StatefulWidget {
  const CustomReservationList({super.key, required this.isNew, this.fromHome= false});
final bool isNew;
final bool? fromHome;
  @override
  State<CustomReservationList> createState() => _CustomReservationListState();
}

class _CustomReservationListState extends State<CustomReservationList> {

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context,data,_) {
        return RefreshIndicator(
          color: AppColors.primaryColor,
          onRefresh: ()async{
            data.allReservation();
          },
          child: AnimationLimiter(
            child:data.isReservationLoading?const Center(child: AppLoader()):
            data.reservationsModel?.data?.isEmpty==true?(widget.fromHome==true)?NoDataScreen():ListView(
              physics:const AlwaysScrollableScrollPhysics(),
              children: const [
                 NoDataScreen(),
              ],
            ): ListView.builder(
              physics: (widget.fromHome==true)?NeverScrollableScrollPhysics():AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v,horizontal: Dimens.padding_16h),
                shrinkWrap: true,
                itemCount: data.reservationsModel?.data?.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                      duration:const Duration(milliseconds: 900),
                      position: index,
                      columnCount: 1,
                      child: ScaleAnimation(
                          duration:const Duration(milliseconds: 1000),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: FadeInAnimation(child:
                          CustomReservationItem(isNew: widget.isNew, model:  data.reservationsModel?.data?[index],)
                          )));
                }),
          ),
        );
      }
    );
  }
}
