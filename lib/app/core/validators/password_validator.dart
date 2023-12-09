class PasswordValidator {
  String? validate({String? password}) {
    if (password == null || password == '') {
      return 'O Campo Senha é obrigatório!';
    }

    if (password.length < 2) {
      return 'O Campo Senha deve ter pelo menos 2 caracteres!';
    }

    var passwordRegex = RegExp(r'^(?=.*[@!#$%^&*()/\\])');
    if (passwordRegex.hasMatch(password)) {
      return 'O Campo Senha contém caracteres especiais!';
    }

    if (password.length > 20) {
      return 'O Campo Senha deve ser menor que 20 caracteres!';
    }

    if (password.endsWith(' ')) {
      return 'O Campo Senha não deve conter espaço no final!';
    }

    return null;
  }
}
