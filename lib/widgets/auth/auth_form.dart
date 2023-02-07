import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    validator: (val) {
                      if (val == null) {
                        return 'Please enter a value';
                      }
                      if (val.isEmpty || !val.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(labelText: 'Email address'),
                    onSaved: (val) {
                      _userEmail = val!;
                    },
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val == null) {
                        return 'Please enter a value';
                      }
                      if (val.isEmpty || val.length < 4) {
                        return 'Please enter at least 4 chars long';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(labelText: 'Username'),
                    onSaved: (val) {
                      _userName = val!;
                    },
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val == null) {
                        return 'Please enter a value';
                      }
                      if (val.isEmpty || val.length < 7) {
                        return 'Password must be at least 7 chars long';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onSaved: (val) {
                      _userPassword = val!;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('Login')),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Create new account')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
