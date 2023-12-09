import 'package:flutter/material.dart';
import 'package:flutter_target_test/app/core/auth/auth_service.dart';
import 'package:flutter_target_test/app/modules/login/components/custom_login_textfield.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Auth _auth = Auth();

  final Uri _url = Uri.parse('https://google.com.br');

  @override
  Widget build(BuildContext context) {
    final TextEditingController userController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    /*final Uri _url = Uri.parse('https://google.com.br');

    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }*/

    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1f5466),
                    Color(0xff2d958e),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Usuário",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
                TextFormField(
                  key: const Key("user_key"),
                  controller: userController,
                  decoration: getLoginInputDecoration(
                    "",
                    const Icon(Icons.person),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Senha",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
                TextFormField(
                  key: const Key("password_key"),
                  controller: passwordController,
                  obscureText: true,
                  decoration: getLoginInputDecoration(
                    "",
                    const Icon(Icons.lock),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        final String? result = _auth.register(
                          userController.text,
                          passwordController.text,
                        );

                        if (result != null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(result),
                          ));
                        } else {
                          Navigator.pushReplacementNamed(context, "/home");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  _launchUrl();
                },
                child: const Text(
                  "Política de Privacidade",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
