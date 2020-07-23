class Pessoa {
  int _id;
  String _nome;
  
  Pessoa.vazio();

  Pessoa(this._id, this._nome);

  Pessoa.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _nome = json['nome'];

  Map<String, dynamic> toJson() =>
  {
    'id': _id,
    'nome': _nome,
  };

  int get id => _id;

  set id(int value) => _id = value;

  String get nome => _nome;

  set nome(String value) => _nome = value;

}