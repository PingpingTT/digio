import 'package:bloc/bloc.dart';
import 'package:digio_train/core/no_params.dart';
import 'package:digio_train/features/ault/domain/entity/all_entity.dart';
import 'package:digio_train/features/ault/domain/entity/launch_entity.dart';
import 'package:digio_train/features/ault/domain/usecase/get_usecase.dart';
import 'package:meta/meta.dart';

part 'space_x_event.dart';
part 'space_x_state.dart';

class SpaceXBloc extends Bloc<SpaceXEvent, SpaceXState> {
  final GetAllData usecase;
  late AllEntity allData;

  SpaceXBloc(this.usecase) : super(SpaceXInitial()) {
    on<FilterLaunchEvent>(onfilterlaunches);
    on<FetchAllDataEvent>(onfetchalldata);
  }
  Future<void> onfetchalldata(
    FetchAllDataEvent event,
    Emitter<SpaceXState> emit,
  ) async {
    emit(SpaceXLoading());
    try {
      allData = await usecase(NoParams());
      emit(SpaceXLoaded(allEntity: allData));
    } catch (e) {
      emit(SpaceXError(e.toString()));
    }
  }

  void onfilterlaunches(
    FilterLaunchEvent event,
    Emitter<SpaceXState> emit,
  ) async {
    final query = event.query.toLowerCase();
    final filtered = allData.Launches.where(
      (l) => l.name.toLowerCase().contains(query),
    ).toList();
    emit(SpaceXFilteredLaunches(filtered, allData));
  }
}
