import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculate_bmi_state.dart';

class CalculateBmiCubit extends Cubit<CalculateBmiState> {
  CalculateBmiCubit() : super(CalculateBmiInitial());

  double calculateBMI({
    required double height,
    required double weight,
  }) {
    var heightInMeter = height / 100;
    var BMICalcuate = (weight / (heightInMeter * heightInMeter));
    print('========================= BMI calc =========================');
    print(BMICalcuate);
    print('============================================================');

    return BMICalcuate;
  }
}
