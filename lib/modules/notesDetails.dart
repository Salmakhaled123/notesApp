import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smalltask/cubit/cubit.dart';
import '../cubit/states.dart';
class NotesDetails extends StatelessWidget {
  var dateController = TextEditingController();
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyAppCubit,AppCubitStates>(
      builder:(context,state){
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.indigo.shade200,
              title: const Text('Notes Details')),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35)),
                        labelText: 'Title'),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 250.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(35.0),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 24.0),
                      controller: bodyController,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 10,
                      decoration: const InputDecoration(
                          border: InputBorder.none, labelText: 'Body'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () {
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2025-12-31'))
                                .then((value) {
                              if (value != null) {
                                dateController.text =
                                    DateFormat.yMMMd().format(value);
                                print(dateController.text);
                              }
                            });
                          },
                          child: const Icon(
                            Icons.calendar_today_sharp,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35)),
                      labelText: 'date'),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                GestureDetector(
                  onTap: () {
                    MyAppCubit.get(context).insertToDatabase(
                      title: titleController.text,
                      body: bodyController.text,
                      date: dateController.text,
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.indigo.shade200,
                    ),
                  ),
                )
              ]),
            ),
          ),
        );
      } ,
      listener: (context,state){},

    );
  }
}
