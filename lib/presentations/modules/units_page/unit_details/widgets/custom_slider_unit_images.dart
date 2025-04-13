
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import '../../../../../core/resources/app_assets.dart';
import '../../../../../data/models/response/one_unit_model.dart';
import '../../../../components/images/network_image.dart';

class CustomSliderUnitImages extends StatefulWidget {
  final List<OneUnitImage>? image;
  const CustomSliderUnitImages({
    super.key, this.image
  });

  @override
  State<CustomSliderUnitImages> createState() => _CustomSliderUnitImagesState();
}

class _CustomSliderUnitImagesState extends State<CustomSliderUnitImages> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
            children: [
              (widget.image?.isEmpty==true)?const SizedBox():
              CarouselSlider.builder(
                  itemCount: widget.image?.length ,
                  itemBuilder: (_, index, realIndex) {
                    return
                      AppNetworkImage(imageUrl: widget.image?[index].image??'',width: double.infinity,
                        errorImage: AppAssets.bgItemDetails,
                        height: 250.h,
                        fit: BoxFit.cover,);
                  },
                  options: CarouselOptions(
                    // onPageChanged:(index, _) {
                    //   context.read<MyPropertiesDetailsViewModel>().updateCurrentPage(index);
                    // },
                    height: 250.h,
                    autoPlay: false,
                    aspectRatio: 2,
                    pageSnapping: true,
                    initialPage: 0,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    //autoPlayAnimationDuration: Duration(seconds: 1),
                    enlargeCenterPage: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    viewportFraction: 1,
                  )),

            ],
          );

  }
}