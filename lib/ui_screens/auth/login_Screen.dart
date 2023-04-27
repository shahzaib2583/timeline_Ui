import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/constants/app_colors.dart';
import '../../components/widgets/custom_textfeild.dart';
import '../notifications.dart';


bool isDashboardIsCalling = false;
bool isLogin = false;

dynamic globalTotalBirds = 0;
dynamic globalTotalMortality = 0;
dynamic globalTotalFeeds = 0;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _checkboxValue = false;

  String username = "";
  String password = "";

  var provider;
  @override
  void initState() {
    // TODO: implement initState
    checkRemeber();
    super.initState();
   // provider = Provider.of<AuthProvider>(context, listen: false);

  }

  Future<void> checkRemeber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    String? password = prefs.getString('password');
    if(username != null){
      _checkboxValue = true;
      setState(() {
        userController.text = username;
        passwordController.text = password!;
      });

      print('$_checkboxValue');
    }
  }
  TextEditingController userController =  TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/loginbackground.png',
                height: size.height * 0.39,
                width: size.width,
              ),
            ),
            SingleChildScrollView(
              child: Form(
                // key: formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 121,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/loginlogo.png',
                           height: 98.h,
                          width: 181.w,
                        ),
                      ),
                      SizedBox(
                        height: 46.16.h,
                      ),
                      Text(
                        'Welcome to - J7 Konnect!',
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'Please sign-in to your account and',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400,color: AppColors.textColor),
                      ),
                       Text(
                        ' start the adventure',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400,color: AppColors.textColor),
                      ),

                      SizedBox(
                        height: 61.h,
                      ),
                      TextFieldWidget(
                        controller: userController,
                        hintText: 'Your username',
                        // obscureText: true,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextFieldWidget(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: hidePassword,
                        suffixIcon: IconButton(
                          icon: hidePassword
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: const Text("Forgot Password?",style: TextStyle(fontSize: 12,
                            fontWeight: FontWeight.w600,color: AppColors.forgotPassColor),),
                      ),
                      SizedBox(
                        height: 29.h,
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(const Notifications());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.borderColor,
                              width: 0,
                            ),
                            color: AppColors.borderColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          height: 46.h,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: const AlwaysStoppedAnimation(90 / 360),
                child: Image(
                  image: const AssetImage('assets/icons/disable.png'),
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              SizedBox(width: 10.w,),
              Text(
                'Login Failed',
               // style: GoogleFonts.lato(color: AppColors.appColor),
              ),
            ],
          ),
          SizedBox(height: 10.h)
        ],
      ),

      content: Text(
        'You have enter invalid login credentials. Please check your username/password and try again.',
        textAlign: TextAlign.center,
      //  style: GoogleFonts.lato(),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () async {
              Navigator.pop(context, 'back');
            },
            child: Center(
              child: Text(
                "OK",
              //   style: GoogleFonts.lato(
              //       fontSize: 18.0, color: AppColors.appColor,fontWeight: FontWeight.w700),
               ),
            )),
      ],
    ),
  );
}

