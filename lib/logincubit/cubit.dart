import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smalltask/logincubit/states.dart';
class NotesCubit extends Cubit<AppStates> {
  NotesCubit() :super(AppInitialStates());
  static NotesCubit get(context) => BlocProvider.of(context);
  bool isPassword = false;
  IconData suffix = Icons.visibility;
 void ChangeVisibility()
  {
    isPassword=!isPassword;
    suffix= isPassword ?  Icons.visibility_off:Icons.visibility;
    emit(AppVisibilityStates());
  }


}

