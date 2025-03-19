import 'package:flutter/material.dart';
import 'package:news/model/SourceRespons.dart';

class SourceTapWidget extends StatefulWidget {
  List<Source> sourceList;

  SourceTapWidget({required this.sourceList});

  @override
  State<SourceTapWidget> createState() => _SourceTapWidgetState();
}

class _SourceTapWidgetState extends State<SourceTapWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Source Tab Widget"),
      ),
      body: ListView.builder(
        itemCount: widget.sourceList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.sourceList[index].name ?? "No Name"),
            subtitle: Text(widget.sourceList[index].description ?? "No Description"),
          );
        },
      ),
    );
  }
}