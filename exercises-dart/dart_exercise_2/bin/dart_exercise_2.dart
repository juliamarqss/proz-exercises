import 'dart:io';

void main(List<String> arguments) {
  print("Digite o valor total da compra:");
  final valorTotal = stdin.readLineSync();

  if (valorTotal != null) {
    print(
      "\nDigite o tipo de cliente: \n 1. Cliente Comum\n 2. Funcionário \n 3. Vip\n",
    );
    final tipoDeCliente = stdin.readLineSync();

    double valorTotalDouble = double.parse(valorTotal);

    switch (tipoDeCliente) {
      case '1':
        print(
          "Valor Total: R\$ $valorTotal\nValor a pagar: R\$ ${valorTotalDouble.toStringAsFixed(2)}",
        );
        break;
      case '2':
        double valorAPagar = valorTotalDouble * 0.9;

        print(
          "Valor Total: R\$ $valorTotal\nValor a pagar: R\$ ${valorAPagar.toStringAsFixed(2)}",
        );

        break;
      case '3':
        double valorAPagar = valorTotalDouble * 0.95;

        print(
          "Valor Total: R\$ $valorTotal\nValor a pagar: R\$ ${valorAPagar.toStringAsFixed(2)}",
        );

        break;
      default:
        print("Opção inválida para tipo de cliente.");
        break;
    }
  }
}
