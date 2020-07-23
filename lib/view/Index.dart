import 'package:flutter/material.dart';
import 'package:projeto_crud_mobile/service/PessoaService.dart';
import 'package:projeto_crud_mobile/model/Pessoa.dart';
import 'package:projeto_crud_mobile/view/FormPessoa.dart';


class Index extends StatefulWidget {
    
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  
  PessoaService pessoaService = PessoaService();
  Future<List<Pessoa>> _pessoas;
    
  _adicionarPessoa() {    
    Navigator.push(
      context, MaterialPageRoute(
        builder: (context) => FormPessoa()
        )
      );    
  }

  _removerPessoa(int id){
      pessoaService.removerPessoa(id);
  }

  _atualizarPessoa(int id, Pessoa pessoa){
      pessoaService.atualizarPessoa(id, pessoa);
  }
  
  @override
  void initState() {        
    super.initState();
    _pessoas = pessoaService.listarPessoas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Projeto Crud de Pessoas"),
        ),
        body: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Lista de Pessoas",
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      )),
                  Container(
                    height: 425,
                    
                    child: FutureBuilder(
                        future: _pessoas,
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return Container();
                            case ConnectionState.active:
                              return Container();
                            case ConnectionState.waiting:
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                              break;
                            case ConnectionState.done:
                              return ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, indice) {
                                    
                                    List<Pessoa> lista = snapshot.data;
                                    Pessoa pessoa = lista[indice];   
                                    
                                    return new Row(                                                                                  
                                      children: <Widget>[   
                                        Container(
                                          width: 250,
                                          child: Text(pessoa.nome),
                                        ),
                                         Container(
                                          width: 35,
                                          child: IconButton(icon: Icon(Icons.edit), onPressed: _removerPessoa(pessoa.id), iconSize: 35, ),
                                        ),
                                        Container(
                                          width: 35,
                                          child: IconButton(icon: Icon(Icons.remove_circle), onPressed: _atualizarPessoa(pessoa.id, pessoa), iconSize: 35, ),
                                        ),
                                      ],  
                                    );
                                  }
                                );
                          }
                        }),
                  )
                ]
              )
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: _adicionarPessoa,
          tooltip: 'Adicionar Estação',
          child: Icon(Icons.add),
        )
      );
  }
}