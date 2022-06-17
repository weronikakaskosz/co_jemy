import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:co_jemy/models/cake_recipe_model.dart';
import 'package:co_jemy/repositories/cake_recipes_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cake_state.dart';

class CakeCubit extends Cubit<CakeState> {
  CakeCubit(this._cakeRecipesRepository)
      : super(
          const CakeState(
            recipes: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  final CakeRecipesRepository _cakeRecipesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const CakeState(
        recipes: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = _cakeRecipesRepository.getCakeRecipesStream().listen(
      (data) {
        emit(
          CakeState(
            recipes: data,
            isLoading: false,
            errorMessage: '',
          ),
        );
      },
    )..onError((error) {
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
      await _cakeRecipesRepository.delete(id: documentID);
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
