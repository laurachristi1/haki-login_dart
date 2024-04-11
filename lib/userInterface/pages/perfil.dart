import 'package:flutter/material.dart';
import 'package:proj_login/controller/user_controller.dart';
import 'package:proj_login/database/user_database.dart';
import 'package:proj_login/model/user_model.dart';
import 'package:proj_login/userInterface/pages/confirmacao_email.dart';
import 'package:proj_login/userInterface/pages/confirmacao_senha.dart';
import 'package:proj_login/userInterface/pages/edit_img.dart';
import 'package:proj_login/userInterface/pages/login.dart';

class TelaPerfilUm extends StatefulWidget {
  final int index;
  
  const TelaPerfilUm({Key? key, required this.index}) : super(key: key);

  @override
  State<TelaPerfilUm> createState() => _TelaPerfilUmState();
}

class _TelaPerfilUmState extends State<TelaPerfilUm> {
  List<User> lista = ListaDoUsuario.getterUsuarios();
  UserController metodos = UserController();

  final emailEdit = TextEditingController();
  final nomeEdit = TextEditingController();
  final senhaEdit = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailEdit.text = lista[widget.index].email;
    nomeEdit.text = lista[widget.index].nome;
    senhaEdit.text = lista[widget.index].senha;
  }

  void _atualizarNome() {
    setState(() {
      lista[widget.index].nome = nomeEdit.text;
      ListaDoUsuario.atualizarUsuario(widget.index, nome: nomeEdit.text);
    });
  }

  void _atualizarEmail() {
    setState(() {
      lista[widget.index].email = emailEdit.text;
      ListaDoUsuario.atualizarUsuario(widget.index, email: emailEdit.text);
    });
  }

  void _atualizarSenha() {
    setState(() {
      lista[widget.index].senha = senhaEdit.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, size: 30),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 25.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/foto_perfil.jpg'),
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 188, 228, 242),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                    ),
                    Expanded(
                      child: ListTile(
                        title: TextField(
                          controller: nomeEdit,
                          decoration: const InputDecoration(
                            labelText: 'Nome',
                          ),
                          onChanged: (_) => _atualizarNome(),
                        ),
                        subtitle: TextField(
                          controller: emailEdit,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                          onChanged: (_) => _atualizarEmail(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 65),
                const Text(
                  'Minha Conta',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlterarSenha(index: widget.index);
                      },
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.lock, color: Colors.black),
                      SizedBox(width: 20),
                      Text(
                        'Alterar Senha',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Color.fromARGB(255, 2, 41, 72)),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlterarEmail(index: widget.index);
                      },
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.email, color: Colors.black),
                      SizedBox(width: 20),
                      Text(
                        'Alterar Email',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Color.fromARGB(255, 2, 41, 72)),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlterarImagem(index: widget.index);
                      },
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.image, color: Colors.black),
                      SizedBox(width: 20),
                      Text(
                        'Alterar Imagem',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Color.fromARGB(255, 2, 41, 72)),
                const SizedBox(height: 50),
                const Text(
                  'Central de ajuda',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Adicione a lógica para abrir a página de suporte
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.help, color: Colors.black),
                      SizedBox(width: 10),
                      Text(
                        'Suporte- perguntas frequentes',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Color.fromARGB(255, 2, 41, 72)),
                const SizedBox(height: 50),
                const Text(
                  'Privacidade',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Adicione a lógica para abrir a página de termos e políticas
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.article, color: Colors.black),
                      SizedBox(width: 10),
                      Text(
                        'Termos e Políticas',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Color.fromARGB(255, 2, 41, 72)),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TelaLogin(index: 0,)));
                    },
                    child: const Text(
                      'Sair da conta',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Colors.red, width: 1),
                      ),
                      minimumSize: const Size(400, 65),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
