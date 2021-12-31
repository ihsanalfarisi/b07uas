import 'dart:convert';
import 'package:b07uas/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'user.dart' as user;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String password1 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      drawer: MainDrawer(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
// Form
              Form(
                key: _loginFormKey,
                child: Container(
                  child: Column(
                    children: [
// Username
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(250, 250, 250, 0.95),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          onChanged: (String value) {
                            username = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(200, 200, 200, 1),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.cyan, width: 10),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Username tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
// Password
                      Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(250, 250, 250, 0.95),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            onChanged: (String value) {
                              password1 = value;
                            },
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(200, 200, 200, 1),
                              ),
                              suffixIcon: IconButton(
                                color: Color.fromRGBO(200, 200, 200, 1),
                                splashRadius: 1,
                                icon: Icon(isPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                                onPressed: togglePasswordView,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.cyan, width: 10)),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password tidak boleh kosong";
                              }
                              return null;
                            },
                          )),
                      SizedBox(
                        height: 30,
                      ),
// Login Button
                      Container(
                        width: double.infinity,
                        height: 40,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.cyan),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Color.fromRGBO(255, 0, 0, 1);
                              return null; // Defer to the widget's default.
                            }),
                          ),
                          onPressed: () async {
                            print(username + " " + password1);
                            if (_loginFormKey.currentState!.validate()) {
                              final response = await http.post(
                                  Uri.parse(
                                      "https://pbp-b07.herokuapp.com/loginf"),
                                  headers: <String, String>{
                                    'Content-Type':
                                        'application/json;charset=UTF-8',
                                  },
                                  body: jsonEncode(<String, String>{
                                    'username': username,
                                    'password': password1,
                                  }));
                              dynamic dataJSON =
                                  await jsonDecode(response.body);
                              print(response);
                              print(response.body);

                              if (dataJSON["status"] == "logged in") {
                                user.user.insert(0, dataJSON);
                                print(user.user[0]['status']);
                                print(user.user[0]);
                                Navigator.pushNamed(context, "/", arguments: {
                                  "userID": dataJSON["userID"],
                                  "task": "fetchData"
                                });
                              }
                            } else {
                              print("Ga valid");
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // RichText(
              //   text: TextSpan(
              //       text: "Belum memiliki akun?",
              //       style: TextStyle(
              //         color: Colors.black,
              //       ),
              //       recognizer: TapGestureRecognizer()
              //         ..onTap = () {
              //           Navigator.popAndPushNamed(context, "/register");
              //         }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
