import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Form Implementation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              // Name
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Phone
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.length != 10) {
                    return 'Enter valid 10-digit phone';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Email
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Enter valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Password
              TextFormField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  else if (value.length < 6) {
                    return 'Minimum 6 characters required';
                  }
                  else if (!value.contains(RegExp(r'[A-Z]'))) {
                    return 'Must contain at least 1 uppercase letter';
                  }
                  else if (!value.contains(RegExp(r'[0-9]'))) {
                    return 'Must contain at least 1 number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('Name: ${name.text}');
                    print('Mobile No: ${phone.text}');
                    print('Email Id: ${email.text}');
                    print('Password: ${password.text}');
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}