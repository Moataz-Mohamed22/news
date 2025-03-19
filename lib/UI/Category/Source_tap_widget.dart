import 'package:flutter/material.dart';
import 'package:news/UI/Category/Source_Name_Item.dart';
import 'package:news/UI/Category/source_tab_widget.dart';
import 'package:news/UI/Home/News/NewsWidget.dart';
import 'package:news/di/di.dart';
import 'package:news/utils/App_Colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit/Source_View_Model.dart';
import '../Cubit/Source_states.dart';

class _SourceTapWidgetState extends State<SourceTapWidget> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SourceViewModel(sourceRepository: injectSourceRepository()),
      child: BlocBuilder<SourceViewModel, SourceStates>(
        builder: (context, state) {
          var viewModel = context.read<SourceViewModel>();

          return DefaultTabController(
            initialIndex: 0,
            length: widget.sourceList.length,
            child: Column(
              children: [
                TabBar(
                  dividerColor: AppColors.transparent,
                  onTap: (index) {
                   viewModel. selectedIndex = index;
                    viewModel.getSource(widget.sourceList[viewModel.selectedIndex].id ?? "");
                  },
                  tabAlignment: TabAlignment.start,
                  indicatorColor: Theme.of(context).indicatorColor,
                  isScrollable: true,
                  tabs: widget.sourceList.map((source) {
                    return SourceNameItem(
                      source: source,
                      isSelected: viewModel.selectedIndex == widget.sourceList.indexOf(source),
                    );
                  }).toList(),
                ),
                if (state is SourceLoadingState)
                  Center(
                    child: CircularProgressIndicator(color: AppColors.grey),
                  )
                else if (state is SourceErrorState)
                  Center(
                    child: Column(
                      children: [
                        Text(state.errorMessage),
                        ElevatedButton(
                          onPressed: () {
                            viewModel.getSource(widget.sourceList[viewModel.selectedIndex].id ?? "");
                          },
                          child: const Text("Try again!"),
                        ),
                      ],
                    ),
                  )
                else if (state is SourceSuccessState)
                    Expanded(
                      child: NewsWidget(source: widget.sourceList[viewModel.selectedIndex]),
                    ),
              ],
            ),
          );
        },
      ),
    );
  }
}
