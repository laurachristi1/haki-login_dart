import 'package:proj_login/database/list_dados.dart';
import 'package:proj_login/model/list_model.dart';


class ListController {

  void addItem(Lista list){
    if(list.texto.isNotEmpty){
      ListaUsuarios.lista.add(list);
      print(list);
    }
  }

  void removeItem(index){
    ListaUsuarios.lista.removeAt(index);
  }

  void checarItem(index){
   bool checar = ListaUsuarios.lista[index].isChecked;
   ListaUsuarios.lista[index].isChecked = !checar;
   print(checar);
  }
}