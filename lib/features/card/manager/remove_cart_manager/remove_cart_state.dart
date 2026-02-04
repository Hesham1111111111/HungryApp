abstract class RemoveCartState {}

class RemoveCartInitial extends RemoveCartState {}

class RemoveCartLoading extends RemoveCartState {}

class RemoveCartSuccess extends RemoveCartState {}

class RemoveCartError extends RemoveCartState {
  final String error;

  RemoveCartError({required this.error});
}
