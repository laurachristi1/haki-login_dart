import 'package:flutter/material.dart';
import 'package:proj_login/controller/user_controller.dart';
import 'package:proj_login/userInterface/pages/cadastro.dart';
import 'package:proj_login/userInterface/pages/tarefas.dart';

class TelaLogin extends StatefulWidget {
  final int index;

  TelaLogin({required this.index}) : super();

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  UserController userController = UserController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bem-vindo ao Haki List!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    userController.login(
                      context,
                      emailController.text,
                      passwordController.text,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TelaTarefas(
                                    index: 1,
                                  )),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 16.0),
                  ),
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TelaCadastro()),
                    );
                  },
                  child: const Text(
                    'Não tem conta? Cadastre-se',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.purple,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const Text('Ou entre com'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.apple),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.mail),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.outlined_flag),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
