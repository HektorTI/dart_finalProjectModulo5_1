void main() {
  String name = 'Heitor de Camargo Azevedo';
  print(name);

  bool brasileiro = true;

  if (brasileiro == true) {
    print('Nacionalidade Brasileira');
  } else {
    print('Nacionalidade nao Braiseira');
  }

  double altura = 1.79;
  print('$altura de altura');

  int idade = 34;
  print('$idade anos');

  List<String> listDePaisesQueMorou = ['Brasil', 'Austrália'];
  listDePaisesQueMorou.add('EUA');
  print('Lista de lugares onde morou: $listDePaisesQueMorou');

  // dynamic quer dizer que ele aceita um tipo de dado qualquer
  Map<String, dynamic> formuLarioCompleto = {
    'Nome': 'Heitor de Camargo Azevedo',
    'Nacionalidade': 'Brasileiro',
    'Altura': '1.79',
    'Idade': '34',
    'Lugares que morou': 'Brasil, Australia, EUA',
  };
  print(formuLarioCompleto);

  print('\n');

  print('Lugars desejados para viajar:');

  List<String> listDestiny = [
    'Florianopolis',
    'Bahia',
    'California',
    'Espanha'
  ];
  for (var pais in listDestiny) {
    print(pais);
  }

  //Escolher viagem aqui:
  var viagensDestino = "Florianopolis";

  switch (viagensDestino) {
    case 'Florianopolis':
      print('Você escolheu sua proxima viajem para a Florianopolis.');
      break;
    case "Bahia":
      print('Você escolheu sua proxima viajem para Bahia.');
      break;
    case 'California':
      print('Você escolheu sua proxima viajem para a Califórnia.');
      break;
    case 'Espanha':
      print('Você escolheu viajar para a Espanha.');
      break;
    default:
      print('Desculpe, o destino selecionado não está disponível.');
  }

  print('\n');

  print('Sua economia anual para a viagem em foi 2022 foi:');
  economiaAnual(economiaMensal: 250);
}

void economiaAnual({double economiaMensal = 1.0}) {
  double resultado = economiaMensal * 12;
  print('$resultado reais');
}
