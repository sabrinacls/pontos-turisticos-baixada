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

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pontos Turísticos da Baixada Santista - Sabrina Clemente da Silva'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: _locais.length,
            itemBuilder: (context, index) {
              return _construirCartaoTuristico(_locais[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget _construirCartaoTuristico(PontoTuristico local) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
            child: Image.network(
              local.imagemUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.broken_image, size: 50, color: Colors.grey),
                      SizedBox(height: 8),
                      Text('Imagem indisponível', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nome do Local
                Text(
                  local.nome,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0277BD),
                  ),
                ),
                const SizedBox(height: 4.0),
                // Cidade
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 4.0),
                    Text(
                      local.cidade,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                // Descrição Curta
                Text(
                  local.descricao,
                  style: const TextStyle(fontSize: 14.0, height: 1.4),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text('Favorito', style: TextStyle(fontSize: 14)),
                        value: local.favorito,
                        activeColor: Colors.amber,
                        onChanged: (bool? valor) {
                          setState(() {
                            local.favorito = valor ?? false;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text('Visitado', style: TextStyle(fontSize: 14)),
                        value: local.visitado,
                        activeColor: Colors.green,
                        onChanged: (bool? valor) {
                          setState(() {
                            local.visitado = valor ?? false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }}
