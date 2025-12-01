import 'package:bloc/bloc.dart';
import 'package:digio_train/features/ault/data/model/landpad.dart';
import 'package:digio_train/features/ault/data/model/launch.dart';
import 'package:digio_train/features/ault/data/model/launchpad.dart';
import 'package:digio_train/features/ault/data/model/rockets.dart';
import 'package:meta/meta.dart';

part 'space_x_event.dart';
part 'space_x_state.dart';

class SpaceXBloc extends Bloc<SpaceXEvent, SpaceXState> {
  SpaceXBloc() : super(SpaceXInitial()) {
    on<SpaceXEvent>((event, emit) {


    });
  }
}
