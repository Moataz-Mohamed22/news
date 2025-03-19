import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/UI/Category/source_tab_widget.dart';
import 'package:news/model/Category_Model.dart';
import 'package:news/utils/App_Colors.dart';
import '../../di/di.dart';
import '../Cubit/Source_View_Model.dart';
import '../Cubit/Source_states.dart';

class CategoryDetails extends StatefulWidget {

  CategoryModel category;
  CategoryDetails({required this.category});
  static const String routName = "categoryDetails";

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();

}
SourceViewModel viewModel = SourceViewModel(sourceRepository: injectSourceRepository());

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSource(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> viewModel,
      child: BlocBuilder<SourceViewModel, SourceStates>(
          builder: (context, state) {
            if (state is SourceLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.grey,
                ),
              );
            } else if (state is SourceErrorState) {
              return Column(
                children: [
                  Text(state.errorMessage, style: Theme
                      .of(context)
                      .textTheme
                      .headlineLarge,),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getSource(widget.category.id);
                      },
                      child: Text("Try Again"))
                ],
              );
            } else if (state is SourceSuccessState) {
              return SourceTapWidget(
                sourceList: state.sourcesList,
              );
            }
            return Container();
          }),
    );
  }
}
    /*FutureBuilder<SourceResponse?>(
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

          }

          //TODO:Success
          var sourcesList = snapshot.data!.sources!;
          return SourceTapWidget(
            sourceList: sourcesList,
          );
        });
  }*/

