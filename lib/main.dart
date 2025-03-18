import 'package:flutter/material.dart';

void main() {
  runApp(LayoutProdutoApp());
}

class LayoutProdutoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Detalhes do Produto",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade800,
          title: Text(
            "Detalhe do Produto",
            style: TextStyle(color: Colors.white),
            )
        ),
        body: DetalheProduto()
      )
    );
  }
}

class DetalheProduto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FotoProduto(),
          TituloProduto(nome: "Fone de Ouvido", preco: 218.69),
        ],
      )
    );
  }
}

class TituloProduto extends StatelessWidget {

  // As variáveis são 'final' pois o valor atribuído a elas na criação não pode ser alterado.
  final String nome;
  final double preco;

  TituloProduto({super.key, required String this.nome, required double this.preco});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child:
          Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
                nome,
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ),
        Text("R\$ ${preco.toStringAsFixed(2)}"),
        IconButton(
          onPressed: () {
            print("Added to cart!");
          }, 
          icon: Icon(Icons.shopping_cart)
        )
      ],
    );
  }
}

class FotoProduto extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/fone.jpg",
      width: 350,
      height: 270,
      fit: BoxFit.fill
    );
  }
}