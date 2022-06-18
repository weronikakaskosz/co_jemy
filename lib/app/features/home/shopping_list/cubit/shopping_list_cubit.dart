import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:co_jemy/models/shopping_list_model.dart';
import 'package:co_jemy/repositories/shopping_list_repository.dart';
import 'package:flutter/cupertino.dart';

part 'shopping_list_state.dart';

class ShoppingListCubit extends Cubit<ShoppingListState> {
  ShoppingListCubit(this._shoppingListRepository)
      : super(
          const ShoppingListState(
              documents: [],
              document: [],
              errorMessage: '',
              isLoading: false,
              added: true),
        );

  final ShoppingListRepository _shoppingListRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const ShoppingListState(
        documents: [],
        document: [],
        errorMessage: '',
        isLoading: true,
        added: true,
      ),
    );

    _streamSubscription =
        _shoppingListRepository.getShoppingListStream().listen(
      (data) {
        emit(
          ShoppingListState(
            documents: data,
            document: state.document,
            isLoading: false,
            errorMessage: '',
            added: true,
          ),
        );
      },
    )..onError(
            (error) {
              emit(
                ShoppingListState(
                  documents: const [],
                  document: const [],
                  isLoading: false,
                  errorMessage: error.toString(),
                  added: true,
                ),
              );
            },
          );
  }

  Future<void> addCategory({
    required String categoryName,
  }) async {
    try {
      await _shoppingListRepository.addCategory(
        categoryName: categoryName,
      );

      emit(
        ShoppingListState(
          documents: state.documents,
          document: state.document,
          isLoading: false,
          errorMessage: '',
          added: true,
        ),
      );
    } catch (error) {
      emit(ShoppingListState(
          documents: const [],
          document: const [],
          isLoading: false,
          errorMessage: error.toString(),
          added: true));
    }
  }

  Future<void> removeCategory({
    required String documentID,
  }) async {
    try {
      await _shoppingListRepository.delete(id: documentID);
    } catch (error) {
      emit(
        ShoppingListState(
          documents: state.documents,
          document: state.document,
          isLoading: false,
          errorMessage: '',
          added: true,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
