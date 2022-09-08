// import 'package:dart_exercise_1/dart_exercise_1.dart' as dart_exercise_1;
import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  print('Qual exercicio deseja executar? (Exemplo: 1, 2, 3...)');
  String answer = stdin.readLineSync(encoding: utf8)!;

  if (answer == '1'){
    print('');
    print('1) Soma');
    print('');
    print('Digite um número:');
    String num1 = stdin.readLineSync(encoding: utf8)!;
    print('Digite outro número:');
    String num2 = stdin.readLineSync(encoding: utf8)!;
    print('');

    num result1 = num.parse(num1) + num.parse(num2);
    print('O resultado da soma é: ${result1.toStringAsFixed(2)}');
    print('E o tipo do resultado é: ${result1.runtimeType}');

  } else if (answer == '2') {
    print('');
    print('2) Subtração');
    print('');
    print('Digite um número:');
    String num3 = stdin.readLineSync(encoding: utf8)!;
    print('Digite outro número:');
    String num4 = stdin.readLineSync(encoding: utf8)!;
    print('');

    num result2 = num.parse(num3) - num.parse(num4);
    print('O resultado da subtração é: ${result2.toStringAsFixed(2)}');
    print('E o tipo do resultado é: ${result2.runtimeType}');

  } else if (answer == '3') {
    print('');
    print('3) Multiplicação');
    print('');
    print('Digite um número:');
    String num5 = stdin.readLineSync(encoding: utf8)!;
    print('Digite outro número:');
    String num6 = stdin.readLineSync(encoding: utf8)!;
    print('');

    num result3 = num.parse(num5) * num.parse(num6);
    print('O resultado da multiplicação é: ${result3.toStringAsFixed(2)}');
    print('E o tipo do resultado é: ${result3.runtimeType}');

  } else if (answer == '4') {
    print('');
    print('4) Divisão');
    print('');
    print('Digite um número:');
    String num7 = stdin.readLineSync(encoding: utf8)!;
    print('Digite outro número:');
    String num8 = stdin.readLineSync(encoding: utf8)!;
    print('');

    num result4 = num.parse(num7) / num.parse(num8);
    print('O resultado da divisão é: ${result4.toStringAsFixed(2)}');
    print('E o tipo do resultado é: ${result4.runtimeType}');

  } else if (answer == '5') {
    print('');
    print('5) Calcule a área de um retângulo');
    print('Formula: A = (b x h) / 2');
    print('');
    print('Digite o valor da base:');
    String num9 = stdin.readLineSync(encoding: utf8)!;
    print('Digite o valor da altura:');
    String num10 = stdin.readLineSync(encoding: utf8)!;
    print('');

    num result5 = (num.parse(num9) * num.parse(num10)) / 2;
    print('O resultado da área do retângulo é: ${result5.toStringAsFixed(2)}');
    print('E o tipo do resultado é: ${result5.runtimeType}');

  } else if (answer == '6') {
    print('');
    print('6) Calcule a área de um triângulo equilátero');
    print('Formula: A = n² x √3 / 4 ');
    print('');
    print('Digite o valor de um dos lados do triângulo:');
    String num11 = stdin.readLineSync(encoding: utf8)!;
    print('');

    num value1 = num.parse(num11);
    num result6 = pow(value1, 2) * sqrt(3) / 4;
    // ref.: https://api.dart.dev/stable/2.17.6/dart-math/pow.html
    // ref.: https://api.dart.dev/stable/2.17.6/dart-math/sqrt.html

    print('O resultado da área de um triângulo equilátero é: ${result6.toStringAsFixed(2)}');
    print('E o tipo do resultado é: ${result6.runtimeType}');

  } else if (answer == '7') {
    print('');
    print('7) Calcule o raio de uma circunferência');
    print('Formula: r = d / 2 ');
    print('');
    print('Digite o valor do diâmetro:');
    String num12 = stdin.readLineSync(encoding: utf8)!;
    print('');

    num result7 = num.parse(num12) / 2;
    print('O resultado do raio da circuferência é: ${result7.toStringAsFixed(2)}');
    print('E o tipo do resultado é: ${result7.runtimeType}');
  } else if (answer == '8') {
    print('');
    print('8) Idade');
    print('');
    print('Digite uma idade em dias:');
    String num13 = stdin.readLineSync(encoding: utf8)!;
    print('');

    num result8 = num.parse(num13);
    num result9 = num.parse(num13) / 365;
    num result10 = result9 * 12;
    print('O resultado em anos: ${result9.toStringAsFixed(2)} anos');
    print('O resultado em meses: ${result10.toStringAsFixed(2)} meses');
    print('O resultado em dias: ${result8.toStringAsFixed(2)} dias');
  } else {
    print('');
    print('Opção inválida!');
  }
}
