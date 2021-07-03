

import 'package:ecommerce/login.dart';
import 'package:ecommerce/messagebox.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autoValidate = false;
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _phonenumberController = TextEditingController();
final TextEditingController confirmpassController =  TextEditingController();

String name = "Full Name";
String contactnumber = "Contact number";
String password = "Password";
String confirmpassword = "Re-enter password";
String email = 'Email';
bool confirmedit = true;
FocusNode myFocusNode = new FocusNode();
//bordercolors
Color emailcolor = Colors.blue;
Color passwordcolor = Colors.blue;
Color phcolor = Colors.blue;
Color namecolor = Colors.blue;
Color confirmpasscolor = Colors.blue;
void displayDialog(context, title, text) => showDialog(
  context: context,
  builder: (context) =>
      AlertDialog(
          title: Text(title),
          content: Text(text)
      ),
);


FocusNode focusNode = new FocusNode();

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    MessageBox mb = new MessageBox();

    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.white,
      body: Column(
        children: [
          Spacer(),
          Expanded(
            flex: 2,
            child: Text('Create New Account',
              style: GoogleFonts.laila(
                  textStyle: TextStyle(color: Colors.black),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                controller: _nameController,
                onChanged: (val) {
                  if (val.length < 3) {
                    setState(() {
                      name = "Please enter valid name";

                      namecolor = Colors.red;
                    });
                  } else if (val.length > 3) {
                    setState(() {
                      namecolor = Colors.green;
                      name = "Valid Name";
                    });
                  }
                },
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.black,
                ),

                decoration: InputDecoration(

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: namecolor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: namecolor),
                    ),
                    labelText: name,
                    labelStyle: TextStyle(
                        color: myFocusNode.hasFocus
                            ? Colors.blue
                            : namecolor),
                    hintText: name,
                    prefixIcon: Icon(
                      Icons.person,
                      color: namecolor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: namecolor),
                    )),
              ),
            ),
          ),

          Expanded(
            flex: 2,

            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                onChanged: (val) {
                  if (EmailValidator.validate(val) == true) {
                    setState(() {
                      email = "Email Valid";
                      emailcolor = Colors.green;
                    });
                  } else {
                    setState(() {
                      emailcolor = Colors.red;
                      email = "Invalid Email";
                    });
                  }
                },
                keyboardType: TextInputType.emailAddress,

                controller: _emailController,
                style: TextStyle(
                  color: Colors.black,
                ),

                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: emailcolor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: emailcolor),
                    ),
                    labelText: email,
                    labelStyle: TextStyle(
                        color: myFocusNode.hasFocus
                            ? Colors.blue
                            : emailcolor),
                    hintText: email,
                    prefixIcon: Icon(
                      Icons.email,
                      color: emailcolor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: emailcolor),
                    )),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                controller: _phonenumberController,
                onChanged: (val) {
                  if (val.length < 10) {
                    setState(() {
                      contactnumber = "Please enter valid contact number";
                      phcolor = Colors.red;
                    });
                  } else if (val.length == 10) {
                    setState(() {
                      phcolor = Colors.green;
                      contactnumber = " Valid Contact Number";
                    });
                  }
                },
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.black,
                ),
                // decoration: decoration(phcolor,contactnumber)
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: phcolor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: phcolor),
                    ),
                    labelText: contactnumber,
                    labelStyle: TextStyle(
                        color:
                        myFocusNode.hasFocus ? Colors.blue : phcolor),
                    hintText: contactnumber,
                    prefixIcon: Icon(
                      Icons.call,
                      color: phcolor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: phcolor),
                    )),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                controller: _passwordController,
                onChanged: (val) {
                  if (val.length < 7) {
                    setState(() {
                      password = "Please enter valid password";

                      passwordcolor = Colors.red;
                    });
                  } else if (val.length > 7) {
                    setState(() {
                      passwordcolor = Colors.green;
                      password = "Valid Password";
                      confirmedit = false;
                    });
                  }
                },

                obscureText: true,
                style: TextStyle(
                  color: Colors.black,
                ),
                // decoration:  decoration(passwordcolor,password),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: passwordcolor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: passwordcolor),
                    ),
                    labelText: password,
                    labelStyle: TextStyle(
                        color: myFocusNode.hasFocus
                            ? Colors.blue
                            : passwordcolor),
                    hintText: password,

                    prefixIcon: Icon(
                      Icons.lock,
                      color: passwordcolor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: passwordcolor),
                    )),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                controller: confirmpassController,
                readOnly: confirmedit,
                onChanged: (val) {
                  if (val == _passwordController.text) {
                    setState(() {
                      confirmpassword = "Valid";
                      confirmpasscolor = Colors.green;
                    });
                  } else {
                    setState(() {
                      confirmpasscolor = Colors.red;
                      confirmpassword = "Password Doesnot Match";
                    });
                  }
                },
                obscureText: true,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: confirmpasscolor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: confirmpasscolor),
                    ),
                    labelText: confirmpassword,
                    labelStyle: TextStyle(
                        color: myFocusNode.hasFocus
                            ? Colors.blue
                            : confirmpasscolor),
                    hintText: confirmpassword,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: confirmpasscolor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: confirmpasscolor),
                    )),
              ),
            ),
          ),
          Spacer(),


          Expanded(
            flex:1,
            child: Container(
              width: MediaQuery.of(context).size.width/1.2,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.09),
                  borderRadius: BorderRadius.all(
                      Radius.circular(50)
                  )
              ),
              child: RaisedButton(

                  elevation: 11,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(5.0))),
                  color: Colors.blue,
                  onPressed: () async {
                    var email = _emailController.text;
                    var password = _passwordController.text;

                    if (email.length < 4)
                      mb.Display(context, "Invalid email",  "email should be at least 4 characters long", Colors.red);
                    else if (password.length < 4)
                      mb.Display(context, "Invalid Password",
                          "The password should be at least 4 characters long", Colors.red);







                    setState(() {
                      if (_nameController.text.length < 3) {
                        name = "Invalid Name";
                        namecolor = Colors.red;
                      }
                      if (_phonenumberController.text.length < 10) {
                        contactnumber = "Phone Number Required";
                        phcolor = Colors.red;
                      }

                      if (_passwordController.text.length < 7) {
                        password = "Password Required";
                        passwordcolor = Colors.red;
                      }

                      if (_emailController.text.isEmpty) {
                        email = "Email Required";
                        emailcolor = Colors.red;
                      }
                      if (confirmpassController.text.isEmpty) {
                        confirmpassword = "Password Required";
                        confirmpasscolor = Colors.red;
                      }


                    });
                  },

                  child: Text("Sign Up",style: TextStyle(color: Colors.white),)
              ),
            ),
          ),


          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                    child: Text("Already have an account?", style: GoogleFonts.laila(fontSize: 15,),)),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Login', style: TextStyle(color: Colors.white, fontSize: 15,),)),
              ],
            ),
          ),


        ],

      ),
    );
  }


}