import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smalltask/cubit/cubit.dart';
import 'package:smalltask/cubit/states.dart';
import 'package:smalltask/modules/notesDetails.dart';
import 'package:smalltask/sharedpref/cache.dart';
import '../components/components.dart';

class NotesScreen extends StatelessWidget {
  String name = CacheHelper.getData(key: 'Name');
  var titleController =TextEditingController();
  var dateController =TextEditingController();
  var bodyController =TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<MyAppCubit,AppCubitStates>(
      listener:(context,state){} ,
      builder: (context,state){
        var list=MyAppCubit.get(context).notes;
        var cubit=MyAppCubit.get(context);
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(actions:
        [
          IconButton(onPressed: ()
          {
            showDialog(context: context, builder: (context)
            {
              return Container(width: 15.0,height: 15,
                child: AlertDialog(icon: Icon(Icons.delete_forever,size: 25),
                  backgroundColor: Colors.indigo.shade200,
                  content:Text('Are you sure you want to delete All Notes ?',
                    style: TextStyle(height:2),
                  ) ,
                  title:Text('Delete All notes ',style: TextStyle(fontSize:25),) ,
                  actions:
                  [
                    TextButton(
                      child: Container(width: 60.0,height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),color: Colors.green),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Yes',textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white,fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),),
                        ),),
                      onPressed: ()
                      {
                        cubit.deleteAllQueries();
                        Navigator.of(context).pop();

                      },
                    ),
                    TextButton(
                      child: Container(width: 60.0,height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),color: Colors.red),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('No',textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white,fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),),
                        ),),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),

                    //  TextButton(onPressed: (){}, child: Text('Yes'))

                  ],),
              );

            });


          }, icon: Icon(Icons.delete_outline,color: Colors.black,))

        ],
          backgroundColor: Colors.white,
          elevation: 0.0,
          title:   Text(
            'Welcome $name, ',
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child:buildNotesBuilder(notes: list)
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo.shade200,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NotesDetails()));
          },
          child: Icon(Icons.add),
        ),
      );
      },

    );
  }
}
