import 'package:flutter/material.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({super.key});

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController taskController = TextEditingController();

  void submitForm() {
    if (formKey.currentState!.validate()) {
      Navigator.pop(context, taskController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 200,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                    controller: taskController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a task';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Add Location',
                      border: OutlineInputBorder(),
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  // print('hi${taskController.text}');

                  submitForm();
                },
                child: Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
