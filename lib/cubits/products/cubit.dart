import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:poolart/models/product.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  static ProductsCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<ProductsCubit>(context, listen: listen);

  ProductsCubit() : super(ProductsDefault());

  final repo = ProductsRepository();

  Future<void> fetch() async {
    emit(const ProductsFetchLoading());
    try {
      final data = await repo.fetch();

      emit(ProductsFetchSuccess(data: data));
    } catch (e) {
      emit(ProductsFetchFailed(message: e.toString()));
    }
  }
}
