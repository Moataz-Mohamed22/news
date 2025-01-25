import 'package:flutter/material.dart';
import 'package:news/Api/Api_Manager.dart';
import 'package:news/UI/Category/Source_tap_widget.dart';
import 'package:news/model/Category_Model.dart';
import 'package:news/model/SourceRespons.dart';
import 'package:news/utils/App_Colors.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;
  CategoryDetails({required this.category});
  static const String routName = "categoryDetails";

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSoureces(widget.category.id),
        builder: (context, snapshot) {
          //TODO:Loding

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.grey,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                const Text("Something went wrong"),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSoureces(widget.category.id);
                      setState(() {});
                    },
                    child: const Text("Try Again"))
              ],
            );
          } //TODO:handel Error
          if (snapshot.data!.status != "ok") {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSoureces(widget.category.id);
                      setState(() {});
                    },
                    child: Text("Try Again"))
              ],
            );
          }

          //TODO:Success
          var sourcesList = snapshot.data!.sources!;
          return SourceTapWidget(
            sourceList: sourcesList,
          );
        });
  }
}
