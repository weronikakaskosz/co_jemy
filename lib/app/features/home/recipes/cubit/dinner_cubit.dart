import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co_jemy/models/dinner_recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dinner_state.dart';

class DinnerCubit extends Cubit<DinnerState> {
  DinnerCubit()
      : super(
          const DinnerState(
            recipes: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const DinnerState(
        recipes: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('dinner_recipes')
        .snapshots()
        .listen((data) {
      final recipeModels = data.docs.map((doc) {
        return DinnerRecipeModel(
          id: doc.id,
          name: doc['name'],
          ingredients: doc['ingredients'],
          recipe: doc['recipe'],
        );
      }).toList();
      emit(
        DinnerState(
          recipes: recipeModels,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          DinnerState(
            recipes: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> removeDinner({required String documentID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('dinner_recipes')
          .doc(documentID)
          .delete();
    } catch (error) {
      emit(
        DinnerState(
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
