class UserValidator {
  String? validate({String? user}) {
    if (user == null || user == '') {
      return 'O Campo Usuário é obrigatório!';
    }

    if (user.length > 20) {
      return 'O Campo Usuário deve ser menor que 20 caracteres!';
    }

    if (user.endsWith(' ')) {
      return 'O Campo Usuário não deve conter espaço no final!';
    }

    return null;
  }
}
