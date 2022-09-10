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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(isCreatingAccount == true
                  ? 'Zarejestruj się'
                  : "Zaloguj się"),
              const Padding(
                padding: EdgeInsets.all(20.0),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(136, 122, 117, 117),
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
                  hintText: "Hasło",
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
                  if (isCreatingAccount == true) {
                    // rejestracja
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
                    // logowanie
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
                child: Text(isCreatingAccount == true
                    ? 'Zarejestruj się '
                    : 'Zaloguj się'),
              ),
              const SizedBox(height: 20),
              if (isCreatingAccount == false) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      isCreatingAccount = true;
                    });
                  },
                  child: const Text('Utwórz konto'),
                ),
              ],
              if (isCreatingAccount == true) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      isCreatingAccount = false;
                    });
                  },
                  child: const Text('Masz już konto?'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
