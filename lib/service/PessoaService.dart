import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:projeto_crud_mobile/model/Pessoa.dart';

class PessoaService {
    
  Future<List<Pessoa>> listarPessoas() async {
    
    String url = "http://192.168.0.26:8080/pessoa/listarApi";      
    http.Response response;

    response = await http.get(
      url,      
    );
    
    List<Pessoa> pessoas = List();
    
    if (response.statusCode == 200) {      
      
      var dadosJson = json.decode(response.body);
      
      for (var item in dadosJson) {
        Pessoa pessoa = new Pessoa.vazio();
        pessoa.id = item["id"];   
        pessoa.nome = item["nome"];        
        pessoas.add(pessoa);
      }
      
    } else {
      print(response.statusCode.toString());
    }
    return pessoas;
  }

  Future<Pessoa> novaPessoa(Pessoa pessoa) async{
    
    Map map = pessoa.toJson();
    String url = "http://192.168.0.26:8080/pessoa/salvarApi";
    http.Response response;
    
    response = await http.post(
      url,
      body: json.encode(map),
      headers: {HttpHeaders.contentTypeHeader: "application/json",},
    );
    return pessoa;
  }

  void removerPessoa(int id) async{
    
    String url = "http://192.168.0.26:8080/pessoa/${id}";    
    http.Response response;
    
    response = await http.delete(
      url,            
    );
    listarPessoas();
  }

  Future<Pessoa> atualizarPessoa(int id, Pessoa pessoa) async{
   
    Map map = pessoa.toJson();
    String url = "http://192.168.0.26:8080/pessoa/${id}";

    http.Response response;
    
    response = await http.put(
      url,
      body: json.encode(map),
      headers: {HttpHeaders.contentTypeHeader: "application/json",},
    );
    return pessoa;
  }
}