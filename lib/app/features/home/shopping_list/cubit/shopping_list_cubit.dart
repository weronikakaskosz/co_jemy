import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co_jemy/models/shopping_list_model.dart';
import 'package:flutter/cupertino.dart';

part 'shopping_list_state.dart';

class ShoppingListCubit extends Cubit<ShoppingListState> {
  ShoppingListCubit()
      : super(
          const ShoppingListState(
              documents: [],
              document: [],
              errorMessage: '',
              isLoading: false,
              added: true),
        );

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
        FirebaseFirestore.instance.collection('categories').snapshots().listen(
      (data) {
        final shoppingListModels = data.docs.map(
          (doc) {
            return ShoppingListModel(
              id: doc.id,
              title: doc['title'],
            );
          },
        ).toList();
        emit(
          ShoppingListState(
            documents: shoppingListModels,
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

  Future<void> addCategory({required String categoryName}) async {
    try {
      await FirebaseFirestore.instance.collection('categories').add(
        {'title': categoryName},
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

  Future<void> removeCategory({required String documentID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('categories')
          .doc(documentID)
          .delete();
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
