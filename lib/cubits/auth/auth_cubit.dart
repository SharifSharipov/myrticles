import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myrticles/data/models/universal_data/universal_data.dart';
import 'package:myrticles/data/reporsitories/auth_repostory.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.repository}) : super(AuthInitial());
  final AuthRepository repository;
  Future<void>checkLoggedState()async{
    await Future.delayed(const Duration(seconds: 3));
     if(repository.getToken().isEmpty){
       emit(AuthUnheticationState());
     }else {
       emit(AuthLoggedState());
     }
  }
  Future<void>confirmGmail({required String email,required String password})async{
     emit(AuthLoggedState());
     UniversalData universalData=await repository.sendCodeToGmail(gmail: email, password: password);
    if(universalData.error.isNotEmpty){
      emit(AuthUnheticationState());
    }else {
      emit(AuthErrorState(errorText: universalData.error));
    }

  }
}
