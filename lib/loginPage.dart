import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFBFCFC),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Image.asset('images/coverlight.png'),
                ),
              ),
              Container(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (input) {
                          if (input.isEmpty) return "Enter email";
                        },
                        decoration: InputDecoration(
                          hintText: "Enter email",
                          labelText: "Username",
                          prefixIcon: Icon(Icons.email),
                        ),
                        onSaved: (input) => _email = input,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        validator: (input) {
                          if (input.length < 6)
                            return "Password should be minimum 6 characters";
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter password",
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock)),
                        onSaved: (input) => _password = input,
                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: Text("Login"),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
