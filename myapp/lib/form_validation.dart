import 'package:flutter/material.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({Key? key}) : super(key: key);

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (isValid!) {
      _formKey.currentState?.save();
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Alert Dialog Box"),
          content: Text("${_formKey.currentState}"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text("okay"),
            ),
          ],
        ),
      );
      // if (_formKey.currentState! != null) {
      //   print(_formKey.currentState());
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Validation"),
      ),
      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          //form
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const Text(
                  "Form-Validation In Flutter ",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ((value?.isEmpty)!) return 'Username is not valid';
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'E-Mail'),
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ((value?.isEmpty)! ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!)) {
                      return 'Enter a valid email!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value) {},
                  obscureText: true,
                  validator: (value) {
                    if ((value?.isEmpty)!) {
                      return 'Enter a valid password!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                TextButton(
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                  onPressed: () => _submit(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
