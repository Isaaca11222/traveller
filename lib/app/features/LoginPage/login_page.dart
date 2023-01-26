import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 238, 233),
      body: Center(
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bckb.jpg'), fit: BoxFit.cover),
          ),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              children: [
                Center(
                  child: Text(
                      style: const TextStyle(fontSize: 30),
                      isCreatingAccount == true ? 'Sing up' : "Login"),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(136, 122, 117, 117),
                    label: Text('Email'),
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(136, 122, 117, 117),
                    label: const Text('Password'),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                Text(errorMessage),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (isCreatingAccount == false) {
                      //logowanie
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      } catch (error) {
                        setState(() {
                          errorMessage = error.toString();
                        });
                      }
                    } else {
                      //rejestracja
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      } catch (error) {
                        setState(() {
                          errorMessage = error.toString();
                        });
                      }
                    }
                  },
                  child: Text(isCreatingAccount == true ? 'Sing up ' : 'Login'),
                ),
                const SizedBox(height: 20),
                if (isCreatingAccount == false) ...[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isCreatingAccount = true;
                      });
                    },
                    child: const Text('Create new account'),
                  ),
                ],
                if (isCreatingAccount == true) ...[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isCreatingAccount = false;
                      });
                    },
                    child: const Text('Already have an account?'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
