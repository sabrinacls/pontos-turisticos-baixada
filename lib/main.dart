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

