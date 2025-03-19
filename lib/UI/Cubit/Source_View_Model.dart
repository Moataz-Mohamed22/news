import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news/repository/sources/repository/sourceRepository.dart';

import 'Source_states.dart';

class SourceViewModel extends Cubit<SourceStates>{
  int selectedIndex = 0;

  late SourceRepository sourceRepository ;
  SourceViewModel({required this.sourceRepository} ):super(SourceLoadingState()) {



  }
  void getSource (String categoryId) async{
    try{
      emit(SourceLoadingState());
   var response= await  sourceRepository.getSources(categoryId);
   if(response?.status !="ok"){
emit(SourceErrorState(errorMessage: response!.message!));
return ;
   }
   if(response?.status =="ok"){
     emit(SourceSuccessState(sourcesList: response!.sources!));
     return ;
   }
  }catch(e){
      emit(SourceErrorState(errorMessage: e.toString()));
    }
}

}