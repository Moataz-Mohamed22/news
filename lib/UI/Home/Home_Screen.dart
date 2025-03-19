
import 'package:flutter/material.dart';
import 'package:news/UI/Category/Category_Details.dart';
import 'package:news/UI/Category/Category_fragment.dart';
import 'package:news/UI/Category/drawer/drawer_Home_tab.dart';
import 'package:news/model/Category_Model.dart';

class HomeScreen extends StatefulWidget {
  static String routName = "Home Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      drawer: DrawerWidget(
        onDrawerRowClick: () {
          setState(() {
            selectedCategory = null;
          });
        },
      ),
      body: selectedCategory == null
          ? CategoryFragment(onViewAllClicked: onViewAllClicked)
          : CategoryDetails(category: selectedCategory!),
    );
  }

  void onViewAllClicked(CategoryModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }
}
