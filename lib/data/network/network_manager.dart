class NetworkManager {
  /// Currently a stub: just delays for 1 second and returns false.
  Future<bool> requestAuthorizationCheck() async {
    await Future.delayed(const Duration(seconds: 1));
    return false;
  }
}
