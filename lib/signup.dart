import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class SignUP extends StatelessWidget {
  String _email,_password,_fullName, _mobileNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/news.png"),
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("SIGN UP",
                          style: TextStyle(
                            color: Color(0xFFFFBD73),
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          )),
                    ],
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.person,
                          color: Color(0xFFFFBD73),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (value){
                            _fullName=value;
                          },
                          decoration: InputDecoration(
                            hintText: "Full Name",
                          ),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.phone,
                          color: Color(0xFFFFBD73),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (value){
                            _mobileNumber=value;
                          },
                          decoration: InputDecoration(
                            hintText: "Mobile Number",
                          ),
                        ),
                      ),

                    ],
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.alternate_email,
                          color: Color(0xFFFFBD73),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (value){
                            _email=value;
                          },
                          decoration: InputDecoration(
                            hintText: "Email Address",
                          ),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.lock,
                          color: Color(0xFFFFBD73),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (value){
                            _password=value;
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                          ),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    child: Container(
                      color: Color(0xFFFFBD73),
                      margin: EdgeInsets.only(top: 10.0),
                      width: double.infinity,
                      height: 80.0,
                      child: Center(
                        child: Text('Sign Up',
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                      ),
                    ),
                    onTap: () async {
                      UserCredential user= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
                      if(user!=null)
                      {
                       await FirebaseFirestore.instance.collection('Users').doc(_email).set({
                          'FullName':_fullName,
                          'MobileNumber':_mobileNumber,
                          'Email':_email,
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return SignInScreen();
                          }),
                        );
                      }
                      else
                      {
                        print('user does not exist');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
