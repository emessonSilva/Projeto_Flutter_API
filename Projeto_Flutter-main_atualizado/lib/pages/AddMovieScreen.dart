import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_create_vscode/pages/HomeScreen.dart';


//Tela Adicionar Filme

class AddMovieScreen extends StatelessWidget {
  const AddMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Voltar para a tela anterior
          },
          color: const Color(0xFF5E548E),
          iconSize: 30,
        ),
        title: Container(
          margin: const EdgeInsets.only(left: 40),
          child: Text(
            'Adicionar Filme',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (context) {
              return {'Assistidos', 'Favoritos', 'Não Assistidos'}
                  .map((choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            onSelected: (String value) {
              // Lógica para lidar com a escolha selecionada
              print('Selecionado: $value');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: ClipRRect(
                  child: Container(
                    width: 400,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                    ),
                    child: const Icon(
                      Icons.movie,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Título',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Gênero',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Direção',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Atuação',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enredo',
                ),
              ),
              SizedBox(height: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Avaliação',
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xFF646464),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: RatingBar.builder(
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemSize: 30,
                            itemPadding: EdgeInsets.only(right: 8),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          OptionList(context);
                        },
                        child: Icon(
                          Icons.add_circle_rounded,
                          size: 30,
                          color: const Color(0xFF646464),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 26),
              Container(
                margin: const EdgeInsets.only(
                  left: 60,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5E548E),
                    minimumSize: const Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Salvar',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Função para mostrar as opções de avaliação ao clicar no ícone de mais
  void OptionList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.circle_outlined),
                title: Text('Assistidos'),
                onTap: () {
                  // Lógica para lidar com a escolha "Assistidos"
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.circle_outlined),
                title: Text('Favoritos'),
                onTap: () {
                  // Lógica para lidar com a escolha "Favoritos"
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.circle_outlined),
                title: Text('Não Assistidos'),
                onTap: () {
                  // Lógica para lidar com a escolha "Não Assistidos"
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}