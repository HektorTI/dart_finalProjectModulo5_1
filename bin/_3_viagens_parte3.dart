// Altere o destino método principal para mudar o destino caso queira.

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  Florianopolis viagem = Florianopolis(
    nome: "Florianopolis",
    diaMesIda: 25.07,
    diaMesVolta: 05.08,
    praiaDaJOaquina: "Joaquina",
  );

  viagem.saudacoes();
  viagem.irPraiaJaquina();

  Whatsapp whatsapp = Whatsapp();
  whatsapp.sendMessage();

  await viagem.displayWeatherCondition(); // Chamada API

//---------------------------------------//

  // Bahia viagem2 = Bahia(
  //   nome: "Florianopolis",
  //   diaMesIda: 25.07,
  //   diaMesVolta: 05.08,
  //   praiaEspelhoTrancoso: "Joaquina",
  // );

  // viagem2.saudacoes();
  // viagem2.irPraiaEspelhoTrancoso();

  // await viagem2.displayWeatherCondition(); // Chamada API

//---------------------------------------//

  // California viagem3 = California(
  //   nome: "California",
  //   diaMesIda: 25.07,
  //   diaMesVolta: 05.08,
  //   praiaVeniceBeach: "Venice Beach",
  // );

  // viagem3.saudacoes();
  // await viagem3.displayWeatherCondition(); // Chamada API

//----------------------------------------//

//   Espanha viagem4 = Espanha(
//     nome: "Espanha",
//     diaMesIda: 25.07,
//     diaMesVolta: 05.08,
//     praiaCalaSalada: "Venice Beach",
//   );

//   viagem4.saudacoes();
//   viagem4.irPraiaCalaSalada();
//   await viagem4.displayWeatherCondition(); // Chamada API
//
}

//----------------------------------------//

class Viagens {
  String nome;
  double diaMesIda;
  double diaMesVolta;

  Viagens(
    this.nome,
    this.diaMesIda,
    this.diaMesVolta,
  );

  void saudacoes() {
    print('Você não escolheu um destino');
  }
}

//---------------------------------------//
class Florianopolis extends Viagens {
  String praiaDaJOaquina;

  Florianopolis({
    required String nome,
    required double diaMesIda,
    required double diaMesVolta,
    required this.praiaDaJOaquina,
  }) : super(nome, diaMesIda, diaMesVolta);

  @override
  void saudacoes() {
    print('Destino escolhido: Florianopolis');
  }

  void irPraiaJaquina() {
    print('Você escolheu visitar a praia Joaquina em Florianopolis');
  }

  Future<void> displayWeatherCondition() async {
    try {
      Map<String, dynamic> weatherData = await getWeather();
      double temperatureKelvin = weatherData['main']['temp'];
      double temperatureCelsius = temperatureKelvin - 273.15;
      String weatherDescription = weatherData['weather'][0]['description'];

      print('Condições climáticas de Floriaópolis:');
      print('Temperatura: ${temperatureCelsius.toStringAsFixed(1)}°C');
      print('Descrição: $weatherDescription');
    } catch (e) {
      print('Erro ao obter condições climáticas: $e');
    }
  }

  Future<Map<String, dynamic>> getWeather() async {
    String apiKey =
        '183bc01e95d9553494b168b73fa9d9ba'; // Substitua pela sua chave de API válida
    String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=Florianopolis,br&appid=$apiKey';

    http.Response response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception(
          'Erro ao obter condições climáticas: ${response.statusCode}');
    }
  }
}

//---------------------------------------//

// class Bahia extends Viagens {
//   String praiaEspelhoTrancoso;

//   Bahia({
//     required String nome,
//     required double diaMesIda,
//     required double diaMesVolta,
//     required this.praiaEspelhoTrancoso,
//   }) : super(nome, diaMesIda, diaMesVolta);

//   @override
//   void saudacoes() {
//     print('Destino escolhido: Bahia');
//   }

//   void irPraiaEspelhoTrancoso() {
//     print(
//         'Você escolheu visitar a praia do Espelho em Trancoso, Salvador/Bahia.');
//   }

//   Future<void> displayWeatherCondition() async {
//     try {
//       Map<String, dynamic> weatherData = await getWeather();
//       double temperatureKelvin = weatherData['main']['temp'];
//       double temperatureCelsius = temperatureKelvin - 273.15;
//       String weatherDescription = weatherData['weather'][0]['description'];

//       print('Condições climáticas de Salvador:');
//       print('Temperatura: ${temperatureCelsius.toStringAsFixed(1)}°C');
//       print('Descrição: $weatherDescription');
//     } catch (e) {
//       print('Erro ao obter condições climáticas: $e');
//     }
//   }

//   Future<Map<String, dynamic>> getWeather() async {
//     String apiKey =
//         '183bc01e95d9553494b168b73fa9d9ba'; // Substitua pela sua chave de API válida
//     String apiUrl =
//         'https://api.openweathermap.org/data/2.5/weather?q=Salvador,br&appid=$apiKey';

//     http.Response response = await http.get(Uri.parse(apiUrl));
//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = json.decode(response.body);
//       return data;
//     } else {
//       throw Exception(
//           'Erro ao obter condições climáticas: ${response.statusCode}');
//     }
//   }
// }

//---------------------------------------//

// class California extends Viagens {
//   String praiaVeniceBeach;

//   California({
//     required String nome,
//     required double diaMesIda,
//     required double diaMesVolta,
//     required this.praiaVeniceBeach,
//   }) : super(nome, diaMesIda, diaMesVolta);

//   @override
//   void saudacoes() {
//     print('Destino escolhido: California');
//   }

//   void irPraiaVeniceBeach() {
//     print('Você escolheu visitar a praia Venice Beach, California.');
//   }

//   Future<void> displayWeatherCondition() async {
//     try {
//       Map<String, dynamic> weatherData = await getWeather();
//       double temperatureKelvin = weatherData['main']['temp'];
//       double temperatureCelsius = temperatureKelvin - 273.15;
//       String weatherDescription = weatherData['weather'][0]['description'];

//       print('Condições climáticas de Venice Beach, California:');
//       print('Temperatura: ${temperatureCelsius.toStringAsFixed(1)}°C');
//       print('Descrição: $weatherDescription');
//     } catch (e) {
//       print('Erro ao obter condições climáticas: $e');
//     }
//   }

//   Future<Map<String, dynamic>> getWeather() async {
//     String apiKey =
//         '183bc01e95d9553494b168b73fa9d9ba'; // Sua chave de API válida OpennWeather
//     String apiUrl =
//         'https://api.openweathermap.org/data/2.5/weather?q=Venice%20Beach,california,us&appid=$apiKey';

//     http.Response response = await http.get(Uri.parse(apiUrl));
//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = json.decode(response.body);
//       return data;
//     } else {
//       throw Exception(
//           'Erro ao obter condições climáticas: ${response.statusCode}');
//     }
//   }
// }

//---------------------------------------//

// class Espanha extends Viagens {
//   String praiaCalaSalada;

//   Espanha({
//     required String nome,
//     required double diaMesIda,
//     required double diaMesVolta,
//     required this.praiaCalaSalada,
//   }) : super(nome, diaMesIda, diaMesVolta);

//   @override
//   void saudacoes() {
//     print('Destino escolhido: Espanha');
//   }

//   void irPraiaCalaSalada() {
//     print('Você escolheu visitar a praia do Espelho em Trancoso, Bahia.');
//   }

//   Future<void> displayWeatherCondition() async {
//     try {
//       Map<String, dynamic> weatherData = await getWeather();
//       double temperatureKelvin = weatherData['main']['temp'];
//       double temperatureCelsius = temperatureKelvin - 273.15;
//       String weatherDescription = weatherData['weather'][0]['description'];

//       print('Condições climáticas de Cala Salada/Espanha:');
//       print('Temperatura: ${temperatureCelsius.toStringAsFixed(1)}°C');
//       print('Descrição: $weatherDescription');
//     } catch (e) {
//       print('Erro ao obter condições climáticas: $e');
//     }
//   }

//   Future<Map<String, dynamic>> getWeather() async {
//     String apiKey =
//         '183bc01e95d9553494b168b73fa9d9ba'; // Substitua pela sua chave de API válida
//     String apiUrl =
//         'https://api.openweathermap.org/data/2.5/weather?q=Ibiza,spain&appid=$apiKey';

//     http.Response response = await http.get(Uri.parse(apiUrl));
//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = json.decode(response.body);
//       return data;
//     } else {
//       throw Exception(
//           'Erro ao obter condições climáticas: ${response.statusCode}');
//     }
//   }
// }

//---------------------------------------//

abstract class EnviarMensagem {
  void sendMessage();
  void sendMessage2();
}

class Whatsapp implements EnviarMensagem {
  @override
  void sendMessage() {
    print('Seu vou vai sair 25.07 às 16h da tarde. Boa Viagem!');
  }

  @override
  void sendMessage2() {
    print('Vou Cancelado');
  }
}
