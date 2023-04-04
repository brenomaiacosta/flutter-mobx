import 'package:mobx/mobx.dart';
part 'item_controller.g.dart';

class ItemController = ItemControllerBase with _$ItemController;

//A utilização do mixin Store é para geração dos códigos automáticos
abstract class ItemControllerBase with Store {

  @observable
  bool marcado = false;

  final String titulo;

  ItemControllerBase(this.titulo);

  void alterarMarcado() {
    marcado = !marcado;
  }

}