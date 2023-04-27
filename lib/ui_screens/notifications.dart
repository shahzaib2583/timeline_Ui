import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j7globle_admin/components/constants/app_colors.dart';

import '../components/widgets/customBotton.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<ProcessCard> processCard = [];
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.pinkAccent,
    Colors.blue
  ];
  List status = [
    "approved",
    "pending",
    "declined",
    "approved",
    "declined",
    "approved"
  ];
  List images = ["excel", "powerpoint", "word", "pdf"];
  List reportsFile = [
    "Weekly Report.xls",
    "Weekly Report.ppt",
    "Weekly Report.docx",
    "Weekly Report.docx"
  ];
  bool all=true,pending = false,approved = false,declined = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    processCard = _getProcess();
  }

  List<ProcessCard> _getProcess() {
    List<ProcessCard> processCard = [];

    processCard.add(ProcessCard("Journal Voucher waiting for action",
        "Added 4 files to ", Icons.adjust_rounded));
    processCard.add(ProcessCard(
        "Journal Voucher waiting for action", "15 days ago", Icons.check));
    processCard.add(ProcessCard("Application Form Approval", "1 month ago",
        Icons.border_color_rounded));
    processCard.add(ProcessCard("Journal Voucher waiting for action",
        "15 days ago", Icons.call_merge_rounded));
    processCard.add(ProcessCard("Journal Voucher waiting for action",
        "1 month ago", Icons.change_circle_rounded));
    processCard.add(
        ProcessCard("Final Review", "15 days ago", Icons.bookmark_add_rounded));
    return processCard;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          // appBar: AppBar(centerTitle: false,
          //   backgroundColor: Colors.white,elevation: 0,
          //   title: Text("Notification"),
          //   titleTextStyle: TextStyle(color: AppColors.titleColor,fontWeight: FontWeight.w700,fontSize: 24.sp),
          //   actions: <Widget>[
          //    Padding(
          //      padding: const EdgeInsets.only(right: 23),
          //      child: Image.asset( "assets/icons/burgericon.png",   height: 10.37.sp,width: 21.33.sp,),
          //    ),
          //   ],
          // ),
          body: body(),
        ));
  }

  Widget body() {
    return Column(
      children: [
        appBar(),
        Expanded(
            flex: 1,
            child: Container(
              color: AppColors.backgroudNotification,
              child: ListView.builder(
                  itemCount: processCard.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return timeLine(index);
                  }),
            ))
      ],
    );
  }

  Widget appBar() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 54.sp,
          ),
          Container(
            padding: EdgeInsets.only(right: 23.sp, left: 24.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notification",
                  style: TextStyle(
                      color: AppColors.titleColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp),
                ),
                Image.asset(
                  "assets/icons/burgericon.png",
                  height: 10.37.sp,
                  width: 21.33.sp,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 18.sp,
          ),
          Container(
              padding: EdgeInsets.only(right: 25.sp, left: 23.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        all = true;
                        pending = false;
                        approved = false;
                        declined = false;
                        setState(() {

                        });
                      },
                      child: tabs("All", all)),
                  GestureDetector(
                      onTap: (){
                        print('jfjdsfjsdjf');
                        all = false;
                        pending = true;
                        approved = false;
                        declined = false;
                        setState(() {

                        });
                      },
                      child: tabs("Pending", pending)),
                  GestureDetector(
                      onTap: (){
                        all = false;
                        pending = false;
                        approved = true;
                        declined = false;
                        setState(() {

                        });
                      },
                      child: tabs("Approved", approved)),
                  GestureDetector(
                      onTap: (){
                        all = false;
                        pending = false;
                        approved = false;
                        declined = true;
                        setState(() {

                        });
                      },
                      child: tabs("Declined", declined)),
                ],
              )),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  Widget tabs(String name, bool color) {
    return Container(
      height: 32.sp,
      width: 66.sp,
      padding: EdgeInsets.only(left: 6,right: 6),
      decoration: color == true
          ? BoxDecoration(
              color: AppColors.tabColor,
              borderRadius: BorderRadius.circular(16.sp))
          : const BoxDecoration(),
      child: Center(
          child: FittedBox(
        child: Text(
          name,
          style: TextStyle(
              fontWeight: color == true ? FontWeight.w700 : FontWeight.w400,
              color:
                  color == true ? Colors.white : AppColors.unSelectedTabColor,
          fontSize: 14.sp),
        ),
      )),
    );
  }

  Widget timeLine(int index) {
    return Container(
        margin: EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: 2,
                  height: 0,
                  color: index == 0 ? Colors.white : Colors.black,
                ),
                Container(
                  height: 24.sp,
                  width: 24.sp,
                  margin: EdgeInsets.only(left: 8, right: 5),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: status[index] == "pending"
                          ? AppColors.pendingIconColor
                          : status[index] == "approved"
                              ? AppColors.approvedIconColor
                              : AppColors.declinedIconColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: Container(
                    padding: status[index] == "declined"
                        ? EdgeInsets.all(2)
                        : EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: status[index] == "approved"
                        ? Container(
                            decoration: BoxDecoration(
                                color: status[index] == "pending"
                                    ? AppColors.pendingIconColor
                                    : status[index] == "approved"
                                        ? AppColors.approvedIconColor
                                        : AppColors.declinedIconColor,
                                borderRadius: BorderRadius.circular(50)),
                          )
                        : status[index] == "declined"
                            ? Center(
                                child: const Icon(
                                  Icons.clear,
                                  size: 15,
                                  color: AppColors.declinedIconColor,
                                ),
                              )
                            : SizedBox(),
                  ),

                  // child: Icon(
                  //   processCard[index].icon,
                  //   color: Colors.white,
                  // ),
                ),
                Container(
                  width: 2,
                  height: status[index] == "pending"? 60:status[index] == "declined" ? 90: 240,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  color: AppColors.timeLineColor,
                ),
              ],
            ),
            SizedBox(
              width: 9.57.sp,
            ),
            Expanded(
                child: Container(
              //  margin: EdgeInsets.all(10),
              // decoration: BoxDecoration(
              //     color: Colors.white,
              //     border: Border(
              //       top: BorderSide(
              //         width: 3,
              //         color: colors[(index + 1) % 4],
              //       ),
              //       left: BorderSide(
              //         width: 3,
              //         color: colors[(index + 1) % 4],
              //       ),
              //     ),
              //     boxShadow: [
              //       BoxShadow(
              //         blurRadius: 5,
              //         color: Colors.black26,
              //       )
              //     ]),
              // height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    processCard[index].title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.hadingTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 4.sp,
                  ),
                  Text(
                    processCard[index].description,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.dateTextColor),
                  ),
                  SizedBox(
                    height: 16.sp,
                  ),
                  status[index] == "pending" ? Row(
                    children: [
                      CustomBotton(
                        text: "APPROVE",
                        backgroundColor: AppColors.approvedBottonColor,
                        textColor: AppColors.approvedBottonTextColor,
                      ),
                      SizedBox(
                        width: 11.1.sp,
                      ),
                      CustomBotton(
                        text: "DECLINE",
                        backgroundColor: AppColors.declinedBottonColor,
                        textColor: AppColors.declinedBottonTextColor,
                      ),
                    ],
                  )
                  :status[index] == "declined" ?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icons/commenticon.png",
                            height: 18,
                            width: 10.69,
                          ),
                          SizedBox(width: 2.62,),
                          Image.asset(
                            "assets/icons/commenticon.png",
                            height: 18,
                            width: 10.69,
                          ),
                          SizedBox(width: 11.29,),
                          Flexible(
                            child: RichText(
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              text: new TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: new TextStyle(
                                  fontSize: 12.0,
                                  color: AppColors.textColor,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(text: 'Comment:',style: TextStyle(color: AppColors.declinedBottonTextColor,fontSize: 12,fontWeight: FontWeight.w600,)),
                                  new TextSpan(text: 'We’ve learned that while former Gov.'
                                      'Eliot Spitzer spent a fortune hiring high-priced prostitutes,'
                                      'he frugally', style: new TextStyle(fontSize: 12,fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,),),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      Text(
                        "Declined Date: Sunday 05 March 2023",
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color: AppColors.declinedBottonTextColor),
                      ),
                    ],
                  )
                      :Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 195,
                    decoration: BoxDecoration(border: Border.all(width: 2,color: AppColors.cardBorderColor),
                        borderRadius: BorderRadius.circular(8),color: Colors.white),
                    child: ListView.builder(
                        itemCount:4,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(left: 10,top: 15),
                        itemBuilder: (context, index) {
                          return timeLineInerItem(index);
                        }),

                  ),
                  SizedBox(height: 13.8.sp,),
                  Text(
                    "Approvel Date: Sunday 05 March 2023",
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color: AppColors.approvedDateColor),
                  ),
                ],
              ),
                ],
              ),
            ))
          ],
        ));
  }

  Widget timeLineInerItem(int index) {
    return Container(
      //  height: 50,
      margin: EdgeInsets.only(bottom: 10),
      //   color:Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/${images[index]}.png",
            height: 25,
            width: 27,
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reportsFile[index],
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              SizedBox(
                height: 3,
              ),
              const Text(
                "4kb",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: AppColors.dateTextColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProcessCard {
  String title;
  String description;
  IconData icon;

  ProcessCard(this.title, this.description, this.icon);
}
