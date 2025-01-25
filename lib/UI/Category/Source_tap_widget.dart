import 'package:flutter/material.dart';
import 'package:news/UI/Category/Source_Name_Item.dart';
import 'package:news/UI/Home/News/NewsWidget.dart';
import 'package:news/model/SourceRespons.dart';
import 'package:news/utils/App_Colors.dart';

class SourceTapWidget extends StatefulWidget {
  List<Source> sourceList;

  SourceTapWidget({required this.sourceList});

  @override
  State<SourceTapWidget> createState() => _SourceTapWidgetState();
}

class _SourceTapWidgetState extends State<SourceTapWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
              dividerColor: AppColors.transparent,
              onTap: (index ){
               selectedIndex =index;
               setState(() {

               });
              },
              tabAlignment:TabAlignment.start,
              indicatorColor: Theme.of(context).indicatorColor,
              isScrollable: true,
                tabs: widget.sourceList.map((source) {
              return SourceNameItem(source: source, isSelected: selectedIndex ==
              widget.sourceList.indexOf(source));
            }).toList()),
            NewsWidget(source: widget.sourceList[selectedIndex]),
          ],
        ));
  }
}
