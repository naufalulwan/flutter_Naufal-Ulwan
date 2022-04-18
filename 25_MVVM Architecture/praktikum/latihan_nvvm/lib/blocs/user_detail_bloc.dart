import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_nvvm/blocs/user_detail_event.dart';
import 'package:latihan_nvvm/blocs/user_detail_state.dart';
import 'package:latihan_nvvm/models/user_detail_model.dart';
import 'package:latihan_nvvm/services/service.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  UserDetailBloc() : super(LoadingState()) {
    final ApiService service = ApiService();

    on<GetUserDetail>(
      (event, emit) async {
        try {
          emit(LoadingState());
          final UserDetailModel result =
              await service.fetchUserDetail(id: event.id);
          emit(SuccessState(
              result, 'id ${result.data!.id.toString()} Berhasil terpanggil'));
        } catch (e) {
          emit(ErrorState(e, e.toString()));
        }
      },
    );
  }
}
