import 'package:flutter/material.dart';
import 'package:news/model/SourceRespons.dart';
import 'package:news/utils/App_styles.dart';

class SourceNameItem extends StatelessWidget {
  Source source;
  bool isSelected;
  SourceNameItem({required this.source ,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Text(source.name??"" ,
        style: isSelected?Theme.of(context).textTheme.labelLarge:Theme.of(context).textTheme.titleMedium);
  }
}
