// Nome do aluno: Sabrina Clemente da Silva

import 'package:flutter/material.dart';

void main() {
  runApp(const Principal());
}


class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pontos Turísticos da Baixada Santista',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Cores praianas: Azul oceano e cor de areia ao fundo
        primaryColor: const Color(0xFF0277BD), // Light Blue 800
        scaffoldBackgroundColor: const Color(0xFFFDF5E6), // Old Lace (Areia)
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0277BD),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const CatalogoScreen(),
    );
  }
}

class PontoTuristico {
  final String nome;
  final String cidade;
  final String descricao;
  final String imagemUrl;
  bool favorito;
  bool visitado;

  PontoTuristico({
    required this.nome,
    required this.cidade,
    required this.descricao,
    required this.imagemUrl,
    this.favorito = false,
    this.visitado = false,
  });
}


class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  final List<PontoTuristico> _locais = [
    PontoTuristico(
      nome: 'Aquário Municipal de Santos',
      cidade: 'Santos',
      descricao: 'O aquário mais antigo do Brasil, com diversas espécies marinhas e um foco forte em preservação ambiental.',
      imagemUrl: 'assets/aquario.jpg',
    ),
    PontoTuristico(
      nome: 'Museu do Café',
      cidade: 'Santos',
      descricao: 'Instalado no prédio da antiga Bolsa Oficial de Café, preserva a história da principal riqueza de exportação do país.',
      imagemUrl: 'assets/museu.jpg',
    ),
    PontoTuristico(
      nome: 'Orquidário Municipal',
      cidade: 'Santos',
      descricao: 'Um parque zoobotânico que abriga uma vasta coleção de orquídeas e animais silvestres soltos na natureza.',
      imagemUrl: 'assets/orquidario.jpg',
    ),
    PontoTuristico(
      nome: 'Monte Serrat',
      cidade: 'Santos',
      descricao: 'Mirante com vista panorâmica de Santos. O acesso pode ser feito por escadaria ou pelo tradicional bondinho funicular.',
      imagemUrl: 'assets/montseerat.jpg',
    ),
    PontoTuristico(
      nome: 'Fortaleza de Itaipu',
      cidade: 'Praia Grande',
      descricao: 'Forte histórico encravado na Mata Atlântica, oferece uma vista belíssima da baía de Santos e rica história militar.',
      imagemUrl: 'assets/fortaleza.jpg',
    ),
    PontoTuristico(
      nome: 'Parque Ecológico Voturuá',
      cidade: 'São Vicente',
      descricao: 'Área verde extensa que conta com zoológico, leões, aves e espaços para piquenique no coração da cidade.',
      imagemUrl: 'assets/voturua.jpg',
    ),
    PontoTuristico(
      nome: 'Ruínas do Abarebebê',
      cidade: 'Peruíbe',
      descricao: 'Sítio arqueológico das ruínas da primeira igreja do Brasil Império, importante marco da colonização.',
      imagemUrl: 'assets/ruinas.jpg',
    ),
  ];

}