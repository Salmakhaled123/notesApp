import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smalltask/logincubit/states.dart';
class NotesCubit extends Cubit<AppStates> {
  NotesCubit() :super(AppInitialStates());
  static NotesCubit get(context) => BlocProvider.of(context);
  bool isPassword = false;
  IconData suffix = Icons.visibility;
  File ? image;
  final ImagePicker _picker = ImagePicker();
 void ChangeVisibility()
  {
    isPassword=!isPassword;
    suffix= isPassword ?  Icons.visibility_off:Icons.visibility;
    emit(AppVisibilityStates());
  }
  uploadPhotoFromGallery()async
  {

    final  picker= await _picker.pickImage(source: ImageSource.gallery);
    //emit(UploadedSuccessfullyFromGallery());
    if(picker?.path!=null)
    {
      image=File(picker!.path);
      emit(UploadedSuccessfullyFromGallery());

    }
  }

  uploadPhotoFromCamera()async
  {

    final  picker= await _picker.pickImage(source: ImageSource.camera);
   // emit(UploadedSuccessfully());
    if(picker?.path!=null)
    {
      image=File(picker!.path);
      emit(UploadedSuccessfullyFromCamera());

    }
  }


}

