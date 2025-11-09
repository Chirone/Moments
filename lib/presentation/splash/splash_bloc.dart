import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/authorization_usecase.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthorizationUseCase _authorizationUseCase;

  SplashBloc(this._authorizationUseCase) : super(SplashInitial()) {
    on<SplashStarted>(_onStarted);
  }

  Future<void> _onStarted(
      SplashStarted event,
      Emitter<SplashState> emit,
      ) async {
    emit(SplashLoading());
    try {
      final bool authorized = await _authorizationUseCase.execute();
      if (authorized) {
        emit(SplashAuthorized());
      } else {
        emit(SplashUnauthorized());
      }
    } catch (e) {
      emit(SplashError(e.toString()));
    }
  }
}
