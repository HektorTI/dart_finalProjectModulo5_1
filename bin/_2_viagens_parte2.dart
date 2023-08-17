// ignore_for_file: public_member_api_docs, sort_constructors_first
//import 'dart:ffi';
import 'dart:io';
import '_1_viagens_parte1.dart' as teste;

void main() {
  print('Economia anual para a viagem no ano de 2022 foi:');
  teste.economiaAnual(economiaMensal: 250.00);
  double arrecadacaoAnual = 3000.00;
  print('\n');

  print('Vamos cancular o valor da viagem de carro para: Florianópolis');
  print('\n');

  double distancia = 675; // Distância em quilômetros
  double consumoMedio = 12; // Consumo médio do veículo em km/l
  double precoCombustivel = 5; // Preço do combustível em reais por litro

  double gastosViagem =
      calcularGastosViagem(distancia, consumoMedio, precoCombustivel);

  print(
      "Os gastos da viagem ida/volta serão de R\$${gastosViagem.toStringAsFixed(2)}");
  print('\n');

  double valorFinalGastos = arrecadacaoAnual - gastosViagem;
  print(
      "Valor restante para viajar apos o combustivel é: R\$${valorFinalGastos.toStringAsFixed(2)}");
  print('\n');

  print('\n');

  String? destino;
  String? companhia;

  do {
    stdout.write('Você deseja mudar o destino? (sim/não): ');
    String? mudarDestino = stdin.readLineSync();

    if (mudarDestino?.toLowerCase() == 'sim') {
      print(
          'Reinicie o programa a partir do viagens parte 1 para alterar o destino.');
      break;
    }

    print('\n');

    stdout.write('Digite o destino: ');
    destino = stdin.readLineSync();
    print('\n');

    stdout.write('A resposta é: $destino');
    print('\n');

    stdout.write('Você vai sozinho? ');
    companhia = stdin.readLineSync();
    print('\n');

    stdout.write('O destino é: $destino, vai sozinho? $companhia');
    print('\n');
  } while (false); // Repete apenas uma vez
}

double calcularGastosViagem(
    double distancia, double consumoMedio, double precoCombustivel) {
  double gastos = (distancia / consumoMedio) * precoCombustivel;
  return gastos * 2;
}
