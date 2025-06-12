import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_first_app/bmi_result.dart';
import 'package:nti_first_app/compoments/cutsom_text_field.dart';
import 'package:nti_first_app/compoments/iamge_container.dart';
import 'package:nti_first_app/core/constants/app_image.dart';
import 'package:nti_first_app/core/theme/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController controller = TextEditingController();
  TextEditingController weightController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  String genderSelection = '';

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'B M I',
          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
        ),
        backgroundColor: AppColor.lightBlue,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Name'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [Text('Birth Date')],
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Choose Gender',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // male image
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            genderSelection = 'male';
                          });
                          print('male');
                        },
                        child: IamgeContainer(
                          genderSelection: genderSelection,
                          path: AppImage.maleImage,
                          value: 'male',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'male',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  //female images
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            genderSelection = 'female';
                          });
                        },
                        child: IamgeContainer(
                          genderSelection: genderSelection,
                          path: AppImage.femaleImage,
                          value: 'female',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'female',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 21,
              ),
              Row(
                children: [
                  Text(
                    'Your Height(cm)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.lightBlue2,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none),
                  prefixIcon: GestureDetector(
                    onTap: () {
                      if (controller.text.isNotEmpty) {
                        var res = int.parse(controller.text);
                        res -= 1;
                        controller.text = (res).toString();
                        setState(() {});
                      }
                    },
                    child: Icon(Icons.remove),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      if (controller.text.isNotEmpty) {
                        var res = int.parse(controller.text);
                        res += 1;
                        controller.text = (res).toString();
                        setState(() {});
                      }
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Row(
                children: [
                  Text(
                    'Your Weight(kg)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: weightController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.lightBlue2,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none),
                  prefixIcon: GestureDetector(
                    onTap: () {
                      if (controller.text.isNotEmpty) {
                        var res = int.parse(weightController.text);
                        res -= 1;
                        weightController.text = (res).toString();
                        setState(() {});
                      }
                    },
                    child: Icon(Icons.remove),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      if (weightController.text.isNotEmpty) {
                        var res = int.parse(weightController.text);
                        res += 1;
                        weightController.text = (res).toString();
                        setState(() {});
                      }
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) =>BmiResult() ,));
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) => BmiResult(),
                  ), (route) {
                    return false;
                  },);

                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: AppColor.purpl2,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Calculate BMI',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
