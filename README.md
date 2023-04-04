# mobx_aula
Projeto que tem como objetivo demonstrar a utilização da biblioteca MobX e suas ferramentas de gestão de estado em aplicativos desenvolvidos com flutter.
Para o desenvolvimento deste projeto foi utilizado as seguintes bibliotecas:

- [mobx](https://pub.dev/packages/mobx/install)
   MobX é uma biblioteca para gerenciar de forma reativa o estado dos aplicativos, usando o poder de observáveis, ações e reações para sobrecarregar os aplicativos Dart e Flutter.

- [flutter_mobx](https://pub.dev/packages/flutter_mobx/install)
   Ele fornece um conjunto de widgets Observer que são reconstruídos automaticamente quando os observables rastreados mudam.

- [mobx_codegen](https://pub.dev/packages/mobx_codegen)
   Gerador de código para MobX que adiciona suporte para anotar seu código com @observable, @computed, @action e também criar classes Store.
   
- [build_runner](https://pub.dev/packages/build_runner/install)
   Um sistema de compilação para geração de código Dart e compilação modular.
   Para executa-lo é preciso rodar os comandos:
      - Executar sem escuta de alterações no código: flutter pub run build_runner build
      - Executar com escuta de alterações no código: flutter pub run build_runner watch

- [provider](flutter pub add provider)
   Um wrapper em torno do InheritedWidget para torná-los mais fáceis de usar e mais reutilizáveis.


# Criar seu próprio snippet no VSCode para facilitar a construção da classe MobX
   Acesso o seguinte caminho "Code/Preferences/Configure User Snippets" e cole o código abaixo:

   ```code
   {
      "Print to console": {
         "scope": "dart",
         "prefix": "mobx",
         "body": [
            "import 'package:mobx/mobx.dart';",
            "part '${TM_FILENAME_BASE}.g.dart';",
            "",
            "class ${1:${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}} = ${1:${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}}Base with _$${1:${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}};",
            "",
            "abstract class ${1:${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}}Base with Store {",
            "",
            "}",
            "$2"
         ],
         "description": "Criar classe base para MobX"
      }
   }

