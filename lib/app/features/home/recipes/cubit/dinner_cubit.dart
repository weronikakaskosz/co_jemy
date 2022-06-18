import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:co_jemy/models/dinner_recipe_model.dart';
import 'package:co_jemy/repositories/dinner_recipes_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dinner_state.dart';

class DinnerCubit extends Cubit<DinnerState> {
  DinnerCubit(this._dinnerRecipesRepository)
      : super(
          const DinnerState(
            recipes: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  final DinnerRecipesRepository _dinnerRecipesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const DinnerState(
        recipes: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription =
        _dinnerRecipesRepository.getDinnerRecipesStream().listen((data) {
      emit(
        DinnerState(
          recipes: data,
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
      await _dinnerRecipesRepository.delete(id: documentID);
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
