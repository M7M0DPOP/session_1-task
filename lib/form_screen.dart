import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final nameControler = TextEditingController();
  final emailControler = TextEditingController();
  final phoneControler = TextEditingController();
  final ageControler = TextEditingController();
  final bioControler = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    nameControler.dispose();
    emailControler.dispose();
    phoneControler.dispose();
    ageControler.dispose();
    bioControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Form Screen'),
          backgroundColor: const Color.fromARGB(255, 154, 158, 255),
          centerTitle: true,
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                TextFormField(
                  controller: nameControler,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hint: Text('John Doe'),
                    label: Text('Full Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailControler,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hint: Text('examle@gmail.com'),
                    label: Text('Email'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Email';
                    }
                    if (!value.contains('@')) {
                      return 'The email must contain @';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: phoneControler,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hint: Text('0123456789'),
                    label: Text('Phone Number'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Phone Number';
                    }
                    if (value.contains(RegExp(r'\D'))) {
                      return 'the phone number must contain only digits';
                    }

                    if (value.length < 10 || value.length > 11) {
                      return 'the phone number must be 10 or 11 digits';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: ageControler,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.calendar_month),
                    hint: Text('18'),
                    label: Text('Age'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your age';
                    }
                    if (value.contains(RegExp(r'\D'))) {
                      return 'Please enter a valid age';
                    }
                    if (int.parse(value) < 18) {
                      return 'You must be at least 18 years old';
                    }
                    if (int.parse(value) > 100) {
                      return 'Please enter a valid age';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: bioControler,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.article),
                    hint: Text('Tell us about yourself'),
                    label: Text('Bio'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  maxLength: 200,
                  maxLines: 6,
                  minLines: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //submit button
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Form Submitted Successfully',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    'The name is : ${nameControler.text}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    'The email is : ${emailControler.text}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    'The phone number is : ${phoneControler.text}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    'The age is : ${ageControler.text}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  bioControler.text == ''
                                      ? SizedBox()
                                      : Text(
                                          'The bio is :\n${bioControler.text}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          const Color.fromARGB(255, 161, 0, 241),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    //clear button
                    ElevatedButton(
                      onPressed: () {
                        nameControler.clear();
                        emailControler.clear();
                        phoneControler.clear();
                        ageControler.clear();
                        bioControler.clear();
                        setState(() {});
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          const Color.fromARGB(255, 161, 0, 241),
                        ),
                      ),
                      child: Text(
                        'Clear Form',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
