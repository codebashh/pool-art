part of 'cubit.dart';

@immutable
class ProductsState extends Equatable {
  final List<Product>? data;
  final String? message;

  const ProductsState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
        data,
        message,
      ];
}

@immutable
class ProductsDefault extends ProductsState {}

@immutable
class ProductsFetchLoading extends ProductsState {
  const ProductsFetchLoading() : super();
}

@immutable
class ProductsFetchSuccess extends ProductsState {
  const ProductsFetchSuccess({List<Product>? data}) : super(data: data);
}

@immutable
class ProductsFetchFailed extends ProductsState {
  const ProductsFetchFailed({String? message}) : super(message: message);
}
