import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

//a utilização do mixin Store é para geração dos códigos automáticos
abstract class ControllerBase with Store {

  ControllerBase() {
    //Função que é chamada sempre que houver uma alteração em um observable ou em um valor computado.
    autorun((_) {
      // print(email);
      // print(senha);
    });
  }

  @observable
  String email = '';

  @observable
  String senha = '';

  @observable
  String nome = '';

  @observable
  bool usuarioLogado = false;

  @observable
  bool carregando = false;

  @computed
  bool get formularioValidado => email.length >= 5 && senha.length >= 5;

  @action
  void setEmail(valor) => email = valor;

  @action
  void setSenha(valor) => senha = valor;

  @action
  Future<void> logar() async {
    carregando = true;

    //Processando...
    await Future.delayed(Duration(seconds: 3));

    nome = "Breno Maia Costa";
    carregando = false;
    usuarioLogado = true;
  }
}