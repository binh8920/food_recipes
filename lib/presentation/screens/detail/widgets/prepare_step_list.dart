import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import './prepare_step.dart';

class PrepareStepList extends StatelessWidget {
  final List content;
  const PrepareStepList({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 2.h, right: 3.w, left: 3.w),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 2.h),
              child: PrepareStep(
                content: content[index]['display_text'],
                prepareStepNumber: content[index]['position'],
              ),
            );
          },
          childCount: content.length,
        ),
      ),
    );
  }
}
