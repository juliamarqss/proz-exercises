// import 'dart:developer';
import 'dart:convert';
import 'dart:io';

var cursos = [];
var input = '';

void main(List<String> arguments) {
  do {
    print('________________________________________________________\n');

    print('MENU PRINCIPAL \n\n1) Adicionar curso \n2) Remover curso \n3) Editar curso \n4) Ordenar os cursos \n5) Mostrar lista \n0) Sair\n');

    print('Digite o número da ação que deseja realizar:');
    input = stdin.readLineSync(encoding: utf8)!;

    print('________________________________________________________\n');

    switch (input) {
      case '1':
        // Adicionar curso
        addCurso();
        listarCursos(input);
        break;
      case '2':
        // Remover curso
        listarCursos(input);
        rmvCurso();
        break;
      case '3':
        // Atualizar curso
        editarCurso();
        break;
      case '4':
        // Ordenar os cursos
        ordernarCurso();
        // listarCursos(input);
        break;
      case '5':
        // Mostrar lista
        exibirInfo(cursos);
        break;
      case '0':
        print("Obrigado por usar nosso app, volte sempre!");
        break;
      default:
        print("Opção digitada é inválida, tente novamente!");
        break;
    }
  } while (input != "0");
}

void addCurso() {
  print('Digite um curso a ser adicionado:');
  var curso = stdin.readLineSync(encoding: utf8)!;
  print('');
  print('Digite um professor(a) a ser adicionado:');
  var prof = stdin.readLineSync(encoding: utf8)!;
  print('');
  print('Digite a carga horária total(em horas) a ser adicionada:');
  var hr = stdin.readLineSync(encoding: utf8)!;

  var info = [{
    'Curso': curso,
    'Professor(a)': prof,
    'Carga Horária': '$hr horas',
  }];

  cursos.addAll(info);
  
  print('________________________________________________________');
  print('\n↓ Curso adicionado a lista! ↓');
}

void rmvCurso() {
  if(cursos.isEmpty) {
    print('\nNão é possível realizar essa ação no momento.\n(É necessário adicionar um curso a lista)');
  } else {
    print('\nDigite o ID do curso a ser removido:');
    var rmv = stdin.readLineSync(encoding: utf8)!;
    int idx = int.parse(rmv);
    print('________________________________________________________');

    if (idx > cursos.length) {
      print('\nID não encontrado.');
    } else {
      print('\nTem certeza que deseja remover ${cursos[idx - 1]['Curso']}? \n1) Sim \n2) Não\n');
      
      print('Digite o número da ação:');
      var valor = stdin.readLineSync(encoding: utf8)!;

      if (valor == '1') {
         print('________________________________________________________');
        cursos.removeAt(idx - 1);
        print('\nCurso removido com sucesso!');
      } else {
        print('________________________________________________________');
        print('\nAção cancelada!');
      }
    }
  }
}

void editarCurso() {
  if (cursos.isEmpty) {
    print('Não é possível realizar essa ação no momento.\n(É necessário adicionar um curso a lista)');
  } else {
    exibirInfo(cursos);
    print('________________________________________________________');
    print('\nDigite o ID do curso a ser editado:');
    var edit = stdin.readLineSync(encoding: utf8)!;
    int idx2 = int.parse(edit);
    print('________________________________________________________');

    if (idx2 > cursos.length) {
      print('\nID não encontrado.');
    } else {
      print('\n1) Curso → ${cursos[idx2 - 1]['Curso']} \n2) Professor(a) → ${cursos[idx2 - 1]['Professor(a)']} \n3) Carga Horária Total  → ${cursos[idx2 - 1]['Carga Horária']}');

      print('\nDigite o número do campo para editar:');
      var campo = stdin.readLineSync(encoding: utf8)!;
      int campoIdx = int.parse(campo);

      if (campo == '1') {
        print('\nDigite o novo valor para o campo Curso:');
        var valorCurso = stdin.readLineSync(encoding: utf8)!;
        cursos[idx2 - 1]['Curso'] = valorCurso;
        print('________________________________________________________');
        print('\n↓ Atualizado com sucesso! ↓');
        print('________________________________________________________\n');
        exibirInfo(cursos);
      } else if (campo == '2') {
        print('\nDigite o novo valor para o campo Professor(a):');
        var valorProf = stdin.readLineSync(encoding: utf8)!;
        cursos[idx2 - 1]['Professor(a)'] = valorProf;
        print('________________________________________________________');
        print('\n↓ Atualizado com sucesso! ↓');
        print('________________________________________________________\n');
        exibirInfo(cursos);
      } else if (campo == '3') {
        print('\nDigite o novo valor para o campo Carga Horária Total:');
        var valorCarga = stdin.readLineSync(encoding: utf8)!;
        cursos[idx2 - 1]['Carga Horária'] = valorCarga;
        print('________________________________________________________');
        print('\n↓ Atualizado com sucesso! ↓');
        print('________________________________________________________\n');
        exibirInfo(cursos);
      } else {
        print('________________________________________________________\n');
        print('Ação inválida!');
      }
    }
  }
}

void ordernarCurso() {

  if (cursos.isEmpty) {
    print('Não é possível realizar essa ação no momento.\n(É necessário adicionar um curso a lista)');
  } else {
    print('1) Reordenar a lista \n2) Ordem alfabética');
    print('\nDigite o número da ação:');
    var ordenar = stdin.readLineSync(encoding: utf8)!;
    int index = int.parse(ordenar);

    if (index - 1 > cursos.length) {
      print('________________________________________________________\n');
      print('Ação inválida!');
    } else {
      if (ordenar == '1') {
        cursos.shuffle();
        print('_______________________________________________________');
        print('\n↓ Lista reordenada com sucesso! ↓');
        listarCursos(ordenar);
      } else if (ordenar == '2') {
        // final cursosOrdernados = [{}];
        cursos.sort((a, b) => a['Curso'].compareTo(b['Curso']));
        print('________________________________________________________\n');
        print('↓ Lista ordenada com sucesso! ↓');
        print('________________________________________________________\n');
        // print(cursosOrdernados);
        print('Lista de cursos cadastrados:\n');
        for(var i = 0; i < cursos.length; i++){
          print('${i + 1}. ${cursos[i]['Curso']}');
        }
      } else {
        print('\n________________________________________________________\n');
        print('Ação inválida! Necessário acrescentar curso a lista.');
        print('________________________________________________________');
      }
    }
  }
}

void listarCursos(input) {
  if(input == '1') {
    if (cursos.isEmpty){
      print('________________________________________________________');
      print('\nLista vazia!');
    } else {
      print('________________________________________________________');
      print('\nLista de cursos cadastrados:\n');
      for(var i = 0; i < cursos.length; i++){
        print('${i + 1}. ${cursos[i]['Curso']}');
      }
    }
  } else if (input == '2') {
     if (cursos.isEmpty){
      print('Lista vazia!');
      print('________________________________________________________');
    } else {
      print('Lista de cursos cadastrados:\n');
      for(var i = 0; i < cursos.length; i++){
        print('Id: ${i + 1} | Curso: ${cursos[i]['Curso']}');
      }
      print('________________________________________________________');
    }
  } else {
    print('\nOpção inválida!');
  }
}

void exibirInfo(list) {
  if (list.isEmpty){
    print('A lista está vazia!');
  } else {
    print('Lista de cursos cadastrados:\n');
    for(var i = 0; i < cursos.length; i++){
      // print('${i + 1}. ${cursos[i]}');
      print('Id: ${i + 1}\nCurso: ${list[i]['Curso']}\nProfessor(a): ${list[i]['Professor(a)']}\nCarga Horária Total: ${list[i]['Carga Horária']}\n');
    }
  }
}
