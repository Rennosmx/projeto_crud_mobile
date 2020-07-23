import 'package:flutter/material.dart';
import 'package:projeto_crud_mobile/model/Pessoa.dart';
import 'package:projeto_crud_mobile/service/PessoaService.dart';
import 'package:projeto_crud_mobile/view/Index.dart';

class FormPessoa extends StatefulWidget {
  
  Pessoa pessoa;
  FormPessoa(this.pessoa);

  @override
  _FormPessoaState createState() => _FormPessoaState();
}

class _FormPessoaState extends State<FormPessoa> {
    
  PessoaService pessoaService = PessoaService();
  TextEditingController nomeController = new TextEditingController();

  void _salvarPessoa(){ 

      if( widget.pessoa.id == null  ){
        pessoaService.novaPessoa(widget.pessoa);      
      }
      else{
        pessoaService.atualizarPessoa(widget.pessoa.id, widget.pessoa);
      }

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Index() ) );  
  }
  
  @override
  Widget build(BuildContext context) {
    
    if ( widget.pessoa.nome != null ) {
      nomeController.text = widget.pessoa.nome;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Nova Pessoa"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.text,
                controller: nomeController,              
                decoration: InputDecoration(
                  labelText: "Digite um nome"                
                ),
                onChanged: (valor){
                  widget.pessoa.nome = valor;
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
        ),
      )  
    );
  }
}