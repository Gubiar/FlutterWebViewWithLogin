class UsuarioObj {

  var cpf;
  var senha;
  var nome;
  var token;

  UsuarioObj({Map<String, dynamic>? json}) {
    if (json != null) {
      fromJson(json);
    }
  }

  fromJson(Map<String, dynamic> json) {
    nome = json['usuarioNome'].toString() == 'null' ? '' : json['usuarioNome'].toString();
    token = json['token'].toString() == 'null' ? '' : json['token'].toString();
  }
}