import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pronight_vendor/core/screen_state/no_data.dart';
import 'package:pronight_vendor/presentations/app_loader.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/visit_permits_screens/visit_permit_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../core/dimens/dimens.dart';
import '../../../../injection.dart';
import 'custom_visit_permits_item.dart';

class CustomVisitPermitsList extends StatefulWidget {
  const CustomVisitPermitsList({super.key});

  @override
  State<CustomVisitPermitsList> createState() => _CustomVisitPermitsListState();
}

class _CustomVisitPermitsListState extends State<CustomVisitPermitsList> {
  VisitPermitViewModel provider =getIt();
  @override
  void initState() {
    super.initState();
WidgetsBinding.instance.addPostFrameCallback((timeStamp){
  provider.initVisitPermit();
});
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<VisitPermitViewModel>(
      builder: (context,data,_) {
        return (data.isLoading)?const AppLoader():
        data.allVisitPermitList?.isEmpty==true?const NoDataScreen():
        AnimationLimiter(
          child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v),
              shrinkWrap: true,
              itemCount: data.allVisitPermitList?.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredGrid(
                    duration:const Duration(milliseconds: 900),
                    position: index,
                    columnCount: 1,
                    child: ScaleAnimation(
                        duration:const Duration(milliseconds: 1000),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(child:
                        CustomVisitPermitsItem(model: data.allVisitPermitList?[index],)
                        )));
              }),
        );
      }
    );
  }
}
