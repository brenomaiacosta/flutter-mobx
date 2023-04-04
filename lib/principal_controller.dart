import 'package:mobx/mobx.dart';
import 'package:mobx_aula/item_controller.dart';
part 'principal_controller.g.dart';

class PrincipalController = PrincipalControllerBase with _$PrincipalController;

//A utilização do mixin Store é para geração dos códigos automáticos
abstract class PrincipalControllerBase with Store {

  @observable
  String novoItem = "";

  ObservableList<ItemController> listaItens = ObservableList<ItemController>();

  @action
  void setNovoItem(String valor) => novoItem = valor;

  @action
  void adicionarItem() {
    if (novoItem.isNotEmpty && listaItens.indexOf(novoItem) == -1) {
      listaItens.add(ItemController(novoItem));
      novoItem = "";
    }
  }

}