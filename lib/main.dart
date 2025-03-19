import 'package:flutter/material.dart';

void main() {
  runApp(LayoutProdutoApp());
}

class LayoutProdutoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TituloProduto(nome: "Fone de Ouvido", preco: 218.69),
            FotoProduto(imagem: "assets/suco.jpg"),
            AcoesProduto(),
            DescricaoProduto(descricao: "herd police aside wrote apart torn stuck no completely anywhere half lower loss later enough many selection rock remove shadow opposite promised cannot branch")
          ],
        ),
      ),
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          nome,
          style: TextStyle(fontWeight: FontWeight.bold),
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

class DescricaoProduto extends StatelessWidget {

  final String descricao;

  DescricaoProduto({super.key, required String this.descricao});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Text(
        descricao,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 18,
        ),
      )
    );  
  }
}

class AcoesProduto extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(onPressed: () { print("Favoritar"); }, icon: Icon(Icons.favorite)),
          IconButton(onPressed: () { print("Comentário"); }, icon: Icon(Icons.comment)),
          IconButton(onPressed: () { print("Compartilhar"); }, icon: Icon(Icons.send)),
        ],
      ),
    );
  }
}

class FotoProduto extends StatelessWidget {

  final String imagem;

  FotoProduto({super.key, required String this.imagem});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue.shade800,
          width: 3
        ),
      ),
      child: Image.asset(
        imagem,
        width: 270,
        height: 350,
        fit: BoxFit.fill
      ),
    );
  }
}