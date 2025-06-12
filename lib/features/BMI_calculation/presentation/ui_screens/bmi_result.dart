import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_first_app/core/constants/app_image.dart';
import 'package:nti_first_app/core/theme/app_color.dart';
import 'package:nti_first_app/features/BMI_calculation/presentation/controllers/calculate_bmi_cubit/calculate_bmi_cubit.dart';

class BmiResult extends StatefulWidget {
  const BmiResult({super.key, required this.height, required this.weight});

  final double height;
  final double weight;

  @override
  State<BmiResult> createState() => _BmiResultState();
}

class _BmiResultState extends State<BmiResult> {
  late double bmiRes;
  @override
  void initState() {
    // amount of bmi
    // TODO: implement initState
    super.initState();
   bmiRes= context
        .read<CalculateBmiCubit>()
        .calculateBMI(height: widget.height, weight: widget.weight);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMi result'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            // this container for  bmi details
            Container(
              padding: EdgeInsets.all(20),
              height: screenSize.height * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppColor.purpl2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // this is the first section of texts name , age , bmi , height and weight
                  Expanded(
                    child: Column(
                      children: [
                        // row  of name and age
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'name samy',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                      color: AppColor.white),
                                ),
                                Text(
                                  'the age is 23 ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: AppColor.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // bmi calc
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  bmiRes.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                      color: AppColor.white),
                                ),
                                Text(
                                  'BMI Calc ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: AppColor.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        // weight and height
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  '185 CM',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                      color: AppColor.white),
                                ),
                                Text(
                                  'Height ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: AppColor.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 40,
                              width: 2,
                              color: AppColor.lightGrey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  '70 KG',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                      color: AppColor.white),
                                ),
                                Text(
                                  'Weight ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: AppColor.white),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  // first half
                  SvgPicture.asset(
                    AppImage.body,
                    height: screenSize.height * 0.25,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.all(16),
              height: screenSize.height * 0.3,
              width: screenSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: AppColor.green,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'under weight',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: AppColor.white),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'under weight',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: AppColor.white),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    maxLines: 5,
                    'Lorem ipsum dolor sit amet consectetur. Sagittis interdum dui enim imperdiet sapien cursus velit pharetra. Viverra justo tempor dictum odio. Nisl non dui integer orci nulla eget laoreet tellus. Orci nunc a orci convallis ac orci. Urna auctor at elementum sit ante maecenas ullamcorper rhoncus dictum. Morbi venenatis lectus ultrices euismod. Laoreet purus risus amet enim sagittis ut. Consectetur libero orci urnager dignissi est.',
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: AppColor.white),
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: screenSize.width * 0.8,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColor.purpl2),
                child: Center(
                  child: Text(
                    'Calculate BMI Again',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColor.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
