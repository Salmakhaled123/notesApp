import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smalltask/logincubit/cubit.dart';
import 'package:smalltask/logincubit/states.dart';
import 'package:smalltask/modules/notes_screen.dart';
import 'package:smalltask/sharedpref/cache.dart';
import '../components/components.dart';

class LoginScreen extends StatelessWidget
{
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var nameController=TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>NotesCubit(),
      child: BlocConsumer<NotesCubit,AppStates>(
        listener:(context,state){} ,
        builder:(context,state){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Log in to Notes App',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),

                      defaultTextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderSide:  BorderSide(color: Colors.indigo.shade200),
                                  borderRadius: BorderRadius.circular(35))),
                        validatemode: AutovalidateMode.onUserInteraction,
                          controller: nameController,
                          type: TextInputType.text,
                          prefix: Icons.person,
                          label: 'Name',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your name';
                            }
                          }),
                      SizedBox(height: 20.0,),
                      defaultTextField(validatemode: AutovalidateMode.onUserInteraction,
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          prefix: Icons.mail_outline,
                          label: 'email address',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your  email';
                            }
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      defaultTextField(validatemode: AutovalidateMode.onUserInteraction,
                          controller: passwordController,

                          type: TextInputType.visiblePassword,
                          prefix: Icons.lock,
                          label: 'password',
                          validate: (value){
                            if(value!.isEmpty)
                              {
                                return ' please enter your password';
                              }
                          },
                          suffix: NotesCubit.get(context).suffix,
                          suffixpressed: ()
                          {
                            NotesCubit.get(context).ChangeVisibility();
                          }
                          ,obsecure: NotesCubit.get(context).isPassword
                      ),
                      SizedBox(height: 50.0,),
                      Center(
                        child: Container(width: 150,
                          decoration: BoxDecoration(color:Colors.indigo.shade200,
                            borderRadius: BorderRadius.circular(35.0)),
                          child: TextButton(
                              onPressed: ()
                          {
                            if(formKey.currentState!.validate())
                              {
                                CacheHelper.savedata(key: 'Name', value: nameController.text);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>NotesScreen()));
                              }

                          }, child: Text('Login',style: TextStyle(color: Colors.white,
                          fontSize: 20),)),
                        ),
                      )

                    ]),
              ),
            ),
          ),
        );
        } ,

      ),
    );


  }
}

