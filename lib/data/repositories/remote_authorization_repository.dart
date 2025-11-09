import '../../domain/repositories/authorization_repository.dart';
import '../network/network_manager.dart';

class RemoteAuthorizationRepository implements AuthorizationRepository {
  final NetworkManager _networkManager;

  RemoteAuthorizationRepository(this._networkManager);

  @override
  Future<bool> checkAuthorization() {
    return _networkManager.requestAuthorizationCheck();
  }
}
