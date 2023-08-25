import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocapp/app_states.dart';
import 'package:flutterblocapp/app_event.dart';


class AppBlocs extends Bloc<AppEvents,AppStates>{
  AppBlocs():super(InitialStates()){

    on<Increment>((event, emit){
      emit(AppStates(counter: state.counter+1));
    });

    on<Decrement>((event, emit){
      emit(AppStates(counter: state.counter-1));
    });

  }
}