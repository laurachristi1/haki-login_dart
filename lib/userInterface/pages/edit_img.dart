import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj_login/controller/user_controller.dart';
import 'package:proj_login/database/user_database.dart';
import 'package:proj_login/model/user_model.dart';
import 'package:proj_login/userInterface/pages/perfil.dart';


class AlterarImagem extends StatefulWidget {
  final int index;
  
   AlterarImagem({super.key, required this.index});
   
  @override
  State<AlterarImagem> createState() => _AlterarImagemState();
}

class _AlterarImagemState extends State<AlterarImagem> {
  UserController metodos = UserController();
  
  List<User> lista = ListaDoUsuario.getterUsuarios();

  final imagemNova = TextEditingController();

    void initState () {
    super.initState();
    imagemNova.text = lista[widget.index].imagem;
  }
  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: 
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
                controller: imagemNova,
                style: const TextStyle(color: Colors.black, fontSize: 12),
                decoration: InputDecoration(
                    labelText: 'Insira o link da imagem', fillColor: Colors.black,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withAlpha(80), width: 0),
                            borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                ))),   
            ),
            SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(height: 100, width: 50, '${lista[widget.index].imagem}', )),
            SizedBox(height: 8),
            Container(
                width: double.infinity,
                height: 30,
                margin: EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                    metodos.adicionarImagem(context, imagemNova.text, widget.index,);
                    });
                  }, 
                  child:  Text('Atualizar imagem', style: GoogleFonts.nunitoSans(color: Colors.purple, fontSize: 16), )),
              ),
          GestureDetector(
            onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> TelaPerfilUm(index: widget.index,)));
                  },
            child: Container(
                  width: double.infinity,
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.red[600], borderRadius: BorderRadius.circular(8)),
                  child: Center(child: Text('Fechar', style: GoogleFonts.nunitoSans(color: Colors.white, fontSize: 16), )),
                ),
          )],
        ),
         ),
      ),
    );
  }
}