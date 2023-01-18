import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';



class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  SwipeBloc() : super(SwipeLoading());
  @override
  Stream<SwipeState> mapEventToState(
    SwipeEvent event,
  )async*{
    if( event is LoadUsers ){
      yield* _mapLoadUsersToState(event);
    }
    if( event is SwipeLeft){
      yield* _mapSwipeLeftToState(event, state);
    }
    if( event is SwipeRight){
      yield* _mapSwipeRightToState(event, state);
    }
  }
  
  Stream<SwipeState> _mapLoadUsersToState(LoadUsers event) async* {
    yield SwipeLoaded(users: event.users);
  }
  Stream<SwipeState> _mapSwipeLeftToState(
  SwipeLeft event, SwipeState state) async* {
    if (state is SwipeLoaded) {
      try{
        yield SwipeLoaded(users: List.from(state.users)..remove(event.user));
      }catch(_){

      }
      
    }
  }
  Stream<SwipeState> _mapSwipeRightToState(
  SwipeRight event, SwipeState state) async* {
    if (state is SwipeLoaded) {
      try{
        yield SwipeLoaded(users: List.from(state.users)..remove(event.user));
      }catch(_){
        
      }
      
    }
  }
}
