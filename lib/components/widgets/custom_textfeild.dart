import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({Key? key,
    required TextEditingController controller, this.hintText, this.obscureText, this.inputEnable,this.validator, this.suffixIcon

  })
      : _controller = controller,
        super(key: key);

  final String? hintText;
  final bool? obscureText;
  final TextEditingController? _controller;
  final bool? inputEnable;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextFormField(
        controller: _controller,
        validator: validator,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:  const BorderSide(color: AppColors.borderNotSlectedColor)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:  const BorderSide(color: AppColors.borderColor)
            ),
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 14.h),
            filled: true,
            fillColor: AppColors.whiteColor,
            hintText: "$hintText",
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              //color: Color.fromRGBO(0, 0, 0, 0.68)
            )
        ),
        obscureText: obscureText ?? false,

        enabled: inputEnable ?? true,
      ),
    );
  }
}

