import 'package:proj_login/model/user_model.dart';

class ListaDoUsuario {
  static List<User> user = [
    User(email: 'teste', senha: 'teste', nome: 'Lau') //0
  ];

  static List<User> getterUsuarios() {
    return user;
  }

  static void atualizarUsuario(int index, {String? nome, String? email}) {
    if (index >= 0 && index < user.length) {
      if (nome != null) user[index].nome = nome;
      if (email != null) user[index].email = email;
    }
  }
}
