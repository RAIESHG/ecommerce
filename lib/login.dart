import 'package:ecommerce/messagebox.dart';
import 'package:ecommerce/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  String emaillabel = "Email- eg:test@gmail.com";
  Color emailcolor = Colors.blue;

  String passwordlabel = "Password";
  Color passwordcolor = Colors.blue;

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    MessageBox mb = new MessageBox();


    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.blueAccent,
        body:   ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3.5,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(90),
                    bottomRight: Radius.circular(90),
                  )
              ),
              child: Align(
                  alignment: Alignment.center,
                  child: Text("E-Peepal",style: GoogleFonts.laila(fontSize: 25),)),
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.05,),


            Container(
                height: MediaQuery.of(context).size.height/1,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          height: MediaQuery.of(context).size.height*0.08,
                          padding: EdgeInsets.only(
                              top: 4,left: 16, right: 16, bottom: 4
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(50)
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5
                                )
                              ]
                          ),

                          child: TextFormField(  onChanged: (value){
                            emailcolor = Colors.blue;setState(() {

                            });
                          },


                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText:emaillabel,
                              icon: Icon(Icons.email,
                                color:emailcolor,
                                size: 20,),
                              border: InputBorder.none,


                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                mb.Display(context, "Error", "Wrong Email/Password", Colors.red);
                              }
                              return null;
                            },
                          ),
                        ),



                        Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          height: MediaQuery.of(context).size.height*0.08,
                          margin: EdgeInsets.only(top: 32),
                          padding: EdgeInsets.only(
                              top: 4,left: 16, right: 16, bottom: 4
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(50)
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5
                                )
                              ]
                          ),
                          child: TextFormField(
                            onChanged: (value){
                              passwordcolor = Colors.blue;setState(() {

                              });
                            },
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: passwordlabel,
                              border: InputBorder.none,
                              icon: Icon(Icons.vpn_key,
                                color: passwordcolor, size: 20,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {

                                mb.Display(context, "Error", "Wrong Email/Password", Colors.red);
                              }

                              return null;
                            },

                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.1,),

                        Container(
                          height: MediaQuery.of(context).size.height*0.06,
                          width: MediaQuery.of(context).size.width/1.2,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(50)
                              )
                          ),
                          child: RaisedButton(



                            color: Colors.white,
                            elevation: 11,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                            onPressed: () async {
                              if(_emailController.text==""){
                                emaillabel = "Please Enter Email";
                                emailcolor = Colors.red;
                                setState(() {

                                });
                              }
                              if(_passwordController.text==""){
                                passwordlabel = "Please Enter Password";
                                passwordcolor = Colors.red;
                                setState(() {

                                });
                              }

                              if (_formKey.currentState!.validate()) {

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text('Processing Data')));
                              }

                              var email = _emailController.text;
                              var password = _passwordController.text;







                            },
                            child: Center(
                              child: Text('Login'.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.03,),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text("Don't have an account ?"),
                            ElevatedButton(

                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignupPage()),
                                  );


                                },
                                child: Text("Sign Up",style: TextStyle(color: Colors.white),)),
                          ],
                        ),
                      ]
                  ),
                )
            ),

            /*   SizedBox(height: MediaQuery.of(context).size.height*0.1,),
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Don't have an account ?"),
                  FlatButton(
                      onPressed: (){
                        _showMyDialog();
                      },
                      child: Text("Sign Up",style: TextStyle(color: Colors.white),)),
                ],
              ),*/




          ],
        )
    );
  }

}
