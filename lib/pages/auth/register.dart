import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  height: 350,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            child: Text(
                              "Register & Find over 54,000 properties",
                              style: TextStyle(
                                  fontSize: 40.0,
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            ),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ), //BoxDecoration
                          ), //Container
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        // Text(
                        //     'Register and get access to 54,000 database records'),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: Container(
                              child: const Image(
                                fit: BoxFit.contain,
                                image: AssetImage('assets/images/banner6.png'),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ) //BoxDecoration
                              ), //Container
                        )
                      ])),
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 25, color: Colors.purple),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: const InputDecoration(
                      hoverColor: Colors.purple,
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      labelText: 'User Name',
                      labelStyle: TextStyle(color: Colors.purple)),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.purple)),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.purple),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Re-enter your password',
                      labelStyle: TextStyle(color: Colors.purple)),
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.purple),
                    child: const Text('Register'),
                    onPressed: () {},
                  )),
            ],
          )),
    );
  }
}
