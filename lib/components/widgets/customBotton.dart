import 'package:flutter/cupertino.dart';

class CustomBotton extends StatefulWidget {
  Color? textColor;
  Color? backgroundColor;
  String? text;
  CustomBotton({Key? key,this.textColor,this.backgroundColor,this.text}) : super(key: key);

  @override
  State<CustomBotton> createState() => _CustomBottonState();
}

class _CustomBottonState extends State<CustomBotton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 97,
      height: 38,
      decoration: BoxDecoration(color: widget.backgroundColor,borderRadius: BorderRadius.circular(50)),
      child: Center(child: Text("${widget.text}",style: TextStyle(color: widget.textColor,fontWeight: FontWeight.w600,fontSize: 15),)),
    );
  }
}
