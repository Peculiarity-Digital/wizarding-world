import 'package:bloc/bloc.dart';
import 'package:wizarding_world/lib.dart';

class ExternalElixirBloc
    extends Bloc<ExternalElixirBaseEvent, ExternalElixirState> {
  final GetAllElixirsCase _elixirCase;

  ExternalElixirBloc(this._elixirCase)
      : super(const ExternalElixirLoadingState()) {
    on<GetElixirEvent>(onGetElixirs);
  }

  Future<void> onGetElixirs(
    GetElixirEvent event,
    Emitter<ExternalElixirState> emit,
  ) async {
    final outcome = await _elixirCase();

    if (outcome is ResultSuccess && outcome.result!.isNotEmpty) {
      emit(
        ExternalElixirDoneState(outcome.result!),
      );
    }
  }
}
