part of 'more_bloc.dart';

class MoreState{}

class MoreInitial extends MoreState{}
class MoreLoaded extends MoreState{
  final List<Items> items;

  MoreLoaded({required this.items});
}