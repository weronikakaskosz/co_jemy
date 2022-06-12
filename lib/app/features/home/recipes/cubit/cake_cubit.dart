import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co_jemy/models/cake_recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cake_state.dart';

class CakeCubit extends Cubit<CakeState> {
  CakeCubit()
      : super(
          const CakeState(
            recipes: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const CakeState(
        recipes: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('cake_recipes')
        .snapshots()
        .listen((data) {
      final recipeModels = data.docs.map((doc) {
        return CakeRecipeModel(
          id: doc.id,
          name: doc['name'],
          ingredients: doc['ingredients'],
          recipe: doc['recipe'],
        );
      }).toList();
      emit(
        CakeState(
          recipes: recipeModels,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          CakeState(
            recipes: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> removeCake({required String documentID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('cake_recipes')
          .doc(documentID)
          .delete();
    } catch (error) {
      emit(
        CakeState(
          recipes: state.recipes,
          isLoading: false,
          errorMessage: '',
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
