import 'package:flutter/material.dart';
import 'package:proj_login/controller/user_controller.dart';
import 'package:proj_login/model/user_model.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  bool _isChecked = false;
  UserController userController = UserController();

  final nomeController = TextEditingController();
  final emailController = TextEditingController(); // Adicionando controlador para o email
  final senhaController = TextEditingController();
  final senhaConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Cadastre-se no Haki List!',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Image.asset('/listacadastro.png', width: 225),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: nomeController,
                    decoration: const InputDecoration(
                      hintText: 'Usuário',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: emailController, // Adicionando controlador para o email
                    keyboardType: TextInputType.emailAddress, // Tipo de teclado para email
                    decoration: const InputDecoration(
                      hintText: 'E-mail',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: senhaController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Senha',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: senhaConfirm,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Repita sua senha',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                      ),
                      Text('Aceito os termos e condições.'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      User user = User(
                        nome: nomeController.text,
                        email: emailController.text, // Usando o texto do campo de email
                        senha: senhaController.text,
                      );
                      userController.cadastrar(context, user);
                      Navigator.pop(context);
                    },
                    child: const Text('Finalize seu cadastro'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
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

