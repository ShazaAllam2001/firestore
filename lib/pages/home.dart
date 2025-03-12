import 'package:firestore/pages/users_list.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController hobbyController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Users Store'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null) {
                      return "Name is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Name",
                  )
                ),
              ),
        
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: ageController,
                  validator: (value) {
                    if (value == null) {
                      return "Age is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Age",
                  )
                ),    
              ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: hobbyController,
                  validator: (value) {
                    if (value == null) {
                      return "Hobby is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Hobby",
                  )
                ),
              ),

              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      debugPrint(nameController.text);
                      debugPrint(ageController.text);
                      debugPrint(hobbyController.text);
            
                      if (formKey.currentState!.validate()) {


                        SnackBar snackBar = SnackBar(
                          content: Text("User Saved"),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: "ok",
                            onPressed: () {},
                          ),
                        );
            
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      else {
                        SnackBar snackBar = SnackBar(
                          content: Text("Error in input fields"),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: "ok",
                            onPressed: () {},
                          ),
                        );
            
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }, 
                    child: const Text("Save"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UsersList())
                        );                  
                      }
                    }, 
                    child: const Text("Go To List"),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    ); 
  }
}