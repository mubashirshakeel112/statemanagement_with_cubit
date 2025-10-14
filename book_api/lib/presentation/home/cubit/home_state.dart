import 'package:book_api/domain/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final BookModel books;

  HomeSuccessState(this.books);

  @override
  List<Object?> get props => [books];
}

class HomeFailureState extends HomeState {
  final String errorMessage;

  HomeFailureState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
