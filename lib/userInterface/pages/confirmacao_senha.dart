import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj_login/controller/user_controller.dart';
import 'package:proj_login/userInterface/pages/login.dart';

class AlterarSenha extends StatefulWidget {
  final int index;
  
   AlterarSenha({Key? key, required this.index});

  @override
  State<AlterarSenha> createState() => _AlterarSenhaState();
}

class _AlterarSenhaState extends State<AlterarSenha> {
  UserController metodos = UserController();

  final senhaAntiga = TextEditingController();
  final senhainsert = TextEditingController();
  final senhaConfirm = TextEditingController();

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
            SizedBox(height: 8,),
            TextFormField(
                controller: senhaAntiga,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: 'Senha atual', fillColor: Colors.black,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withAlpha(80), width: 0),
                            borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                ))),   
            ),
            SizedBox(height: 8,),
            TextFormField(
                controller: senhainsert,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: 'Nova senha', fillColor: Colors.black,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withAlpha(80), width: 0),
                            borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                ))),   
            ),
            SizedBox(height: 8,),
            TextFormField(
                controller: senhaConfirm,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: 'Confirmar nova senha', fillColor: Colors.black,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withAlpha(80), width: 0),
                            borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                ))),   
            ),
            SizedBox(height: 8,),
            GestureDetector(
              onTap: () {
              setState(() {
              metodos.verificarSenhaIgual(context, senhaConfirm.text, senhainsert.text,senhaAntiga.text, widget.index);
              });
              },
              child: Container(
                  width: double.infinity,
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.green[600], borderRadius: BorderRadius.circular(8)),
                  child: Center(child: Text('Atualizar senha', style: GoogleFonts.nunitoSans(color: Colors.white, fontSize: 16), )),
                ),
            ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> TelaLogin(index: widget.index,)));
                  },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.red[600], borderRadius: BorderRadius.circular(8)),
                  child: Center(child: Text('Fechar', style: GoogleFonts.nunitoSans(color: Colors.white, fontSize: 16), )),
                ),
              ),],
        ),
         ),
      ),
    );
  }
}
