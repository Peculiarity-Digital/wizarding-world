import 'package:bloc/bloc.dart';
import 'package:wizarding_world/app/houses/domain/cases/get_all_houses.dart';
import 'package:wizarding_world/lib.dart';

class ExternalHousesBloc
    extends Bloc<ExternalHouseBaseEvent, ExternalHouseState> {
  final GetAllHousesCase _housesCase;

  ExternalHousesBloc(this._housesCase)
      : super(const ExternalHouseLoadingState()) {
    on<GetHousesEvent>(onGetHouses);
  }

  Future<void> onGetHouses(
      GetHousesEvent event, Emitter<ExternalHouseState> emit) async {
    final outcome = await _housesCase();

    if (outcome is ResultSuccess && outcome.result!.isNotEmpty) {
      emit(
        ExternalHouseDoneState(outcome.result!),
      );
    }
  }
}
