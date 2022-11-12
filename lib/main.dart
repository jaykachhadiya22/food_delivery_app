import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:state_hotel_project/adapter/adepter_modal.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:state_hotel_project/app_util/app_util.dart';
import 'package:state_hotel_project/locator/locator.dart';
import 'package:state_hotel_project/ui/screens/home_view/bottam_navigaton_view.dart';
import 'package:state_hotel_project/ui/screens/login_view/login_view.dart';

var foodBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  setup();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  foodBox = await Hive.openBox<Todo>('category');
  runApp(MyApp()
      // DevicePreview(
      //   enabled: true,
      //   builder: (context) => MyApp(), // Wrap your app
      // ),
      );

  AppUtil().easyLoadingInit();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    // runApp( MaterialApp(
    //   title: 'custom fonts',
    //   theme: ThemeData(fontFamily: 'Poppins'),
    //   home: WelComeScreenView(),
    //   debugShowCheckedModeBanner: false,
    // )
    // );
  });
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Color(0XFFD6D6D6), // status bar color
  ));
}

class MyApp extends StatelessWidget {
  Future<bool> checkUserStats() async {
    const storage = FlutterSecureStorage();
    var value = await storage.read(key: "uid");

    if (value == null) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)

    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (ctx, child) {
        // child = DevicePreview.appBuilder(context,child);
        return GetMaterialApp(
          builder: EasyLoading.init(),
          useInheritedMediaQuery: true,

          debugShowCheckedModeBanner: false,
          // You can use the library anywhere in the app even in theme
          title: 'custom fonts',
          theme: ThemeData(fontFamily: 'Poppins'),
          home: child,
        );
      },
      child: FutureBuilder(
        future: checkUserStats(),
        builder: (context, snapshot) {
          if (snapshot.data == false) {
            return LoginView();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                color: Colors.white,
                child: const Center(
                  child: CircularProgressIndicator(),
                ));
          }
          return const BottamNavigatonView();
        },
      ),
    );
  }
}
