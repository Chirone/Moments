import '../repositories/authorization_repository.dart';

class AuthorizationUseCase {
  final AuthorizationRepository _repository;
  AuthorizationUseCase(this._repository);

  Future<bool> execute() {
    return _repository.checkAuthorization();
  }
}
