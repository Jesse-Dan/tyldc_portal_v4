import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_user_event.dart';
part 'register_user_state.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  RegisterUserBloc() : super(RegisterUserInitial()) {
    on<RegisterUserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
