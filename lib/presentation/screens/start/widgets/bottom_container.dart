import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:homerecipes/presentation/theme/color.dart';
import 'package:homerecipes/app.dart';
import 'package:homerecipes/presentation/common/line.dart';
import 'package:homerecipes/presentation/theme/styles.dart';
import 'package:homerecipes/presentation/theme/palette.dart';

class BottomContainer extends StatefulWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationSize;
  late Animation<double> _animationOpacity;
  bool isExpanded = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _animationSize = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _animationOpacity =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 900), () => _controller.forward());
    return SizeTransition(
      sizeFactor: _animationSize,
      child: Container(
          height: 36.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor(),
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
            child: FadeTransition(
              opacity: _animationOpacity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text('Give your day a fresh start',
                          style: AppStyles.mainHeadlineColor17spw700Poppins),
                      SizedBox(
                        height: 6,
                      ),
                      Line(),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Start cooking \nwhatever you crave',
                          style: AppStyles.secondaryGreyColor12spw700Poppins),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        minimumSize: Size(32.w, 6.h),
                        primary: AppPalette.primary,
                      ),
                      onPressed: () {
                        _controller.reverse().whenComplete(
                              () => Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, _) {
                                    return HomeRecipes();
                                  },
                                  opaque: false,
                                ),
                              ),
                            );
                      },
                      child: Text('Start',
                          style: AppStyles.whiteColor14spw700NotoSans),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
