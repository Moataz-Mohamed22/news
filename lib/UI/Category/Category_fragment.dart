import 'package:flutter/material.dart';
import 'package:news/model/Category_Model.dart';
import 'package:news/utils/App_Colors.dart';
import 'package:news/utils/App_styles.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = CategoryModel.getCategoryiesList();
Function onViewAllClicked ;
CategoryFragment({required this.onViewAllClicked});
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.04,
        vertical: height*0.02
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Good Morning\nHere is Some News For You",style: AppStyles.mediuem24White,
      ),
          SizedBox(
            height: height* 0.02,
          ),
          Expanded(child: ListView.separated( separatorBuilder: (context, index ) {
            return SizedBox(
              height:  height *0.02,
            );
          },itemBuilder: (context ,index) {
            return Stack(
              alignment: index%2 ==0 ?Alignment.bottomRight :Alignment.bottomLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(categoriesList[index].imagePath),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: height *0.02
                  )
                  ,child: ToggleSwitch(

                    customWidths: [
                      110,50
                    ],
                    cornerRadius: 20.0,
                    activeBgColors: [[AppColors.grey], [AppColors.black]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: AppColors.grey,
                    inactiveFgColor: Colors.white,
                    initialLabelIndex: 1,
                    totalSwitches: 2,
                    customWidgets: [
                      Text("View All" ,style:  AppStyles.mediuem14White, ),
                      CircleAvatar(backgroundColor: AppColors.black,
                        radius: 70, child: Icon(Icons.arrow_forward_ios
                      ,color: AppColors.white,),)
                    ],
                    animate: true,
                    radiusStyle: true,
                    onToggle: (index1) {
                      print('switched to: $index');
                      onViewAllClicked(categoriesList[index]);
                    },
                  ),
                ),
              ],
            );
          } ,itemCount:categoriesList.length,)
          ) ,
           ]),
    );
  }
}
