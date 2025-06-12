import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_first_app/core/constants/app_image.dart';
import 'package:nti_first_app/core/theme/app_color.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMi result'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FutureBuilder(
          future: null,
          builder: (context, snapshot) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColor.purpl2),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'name samy',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                color: AppColor.white),
                          ),
                          SvgPicture.asset(AppImage.body)
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
