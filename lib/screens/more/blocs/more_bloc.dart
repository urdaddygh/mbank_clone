import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbank_app/models/items.dart';
import 'package:mbank_app/provider/api/api.dart';
part 'more_event.dart';
part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  final MyApi api = MyApi();
  MoreBloc(offset) : super(MoreInitial()) {
    on<MoreEvent>((event, emit) async {
      final List<Items> items = await api.getItems(offset);
      emit(MoreLoaded(items: items));
    });
  }
}
