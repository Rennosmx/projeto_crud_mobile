import 'package:flutter/material.dart';
import 'package:projeto_crud_mobile/model/Pessoa.dart';
import 'package:projeto_crud_mobile/service/PessoaService.dart';

class FormPessoa extends StatefulWidget {
  @override
  _FormPessoaState createState() => _FormPessoaState();
}

class _FormPessoaState extends State<FormPessoa> {
    
  PessoaService pessoaService = PessoaService();
  Pessoa _pessoa = new Pessoa.vazio();

  void _salvarPessoa(){            
      pessoaService.novaPessoa(_pessoa);      
      Navigator.pop(context);      
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Nova Pessoa"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite um nome"
              ),
              onChanged: (valor){
                _pessoa.nome = valor;
              },
            ),
            Center( 
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  child: Text(
                    "Salvar",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: (){
                      _salvarPessoa();
                  },
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}