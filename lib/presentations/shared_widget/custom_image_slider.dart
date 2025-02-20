import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../core/app_theme/app_colors.dart';
import '../components/images/network_image.dart';


class ImagesSlider extends StatefulWidget {
  const ImagesSlider({super.key, required this.images});
final List<String> images;
  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: widget.images.length,
            itemBuilder: (_, index, realIndex) {
              return SizedBox(
                width: double.infinity,
                height: 171.5.h,
                child: AppNetworkImage(
                  imageUrl: widget.images[index]??'',
                  fit: BoxFit.cover,
                ),
              );
            },
            options: CarouselOptions(
              onPageChanged:(index, _) { setState(() {

                print(index);
                print('dddddddddddddddd_${widget.images.length}');
                _currentPage = index;
              });},
              height: 171.5.h,
              autoPlay: true,
              aspectRatio: 2,
              pageSnapping: false,
              initialPage: 0,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayInterval: const Duration(seconds: 3),
              //autoPlayAnimationDuration: Duration(seconds: 1),
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              viewportFraction: 1,
            )),
        SizedBox(height:30.h,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.images.length??0,
              itemBuilder: (context, index) {
                return Row(children: [
                  Container(
                    // margin: EdgeInsets.symmetric(vertical:Dimens.padding_8h),
                    height: 6.h,
                    width:_currentPage == index ?20.w: 6.w,
                    decoration: BoxDecoration(
                        // color: _currentPage == index ? AppColors.primaryColor : AppColors.greyColor,
                        color: _currentPage == index ? AppColors.darkColor : AppColors.white,
                        borderRadius: BorderRadius.circular(20.r)
                    ),
                  ),
                  SizedBox(width: 4.w),
                ],)
                ;}),
        )
      ],
    );
  }
}
