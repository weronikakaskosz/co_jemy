import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dinner_state.dart';

class DinnerCubit extends Cubit<DinnerState> {
  DinnerCubit()
      : super(
          const DinnerState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const DinnerState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('dinner_recipes')
        .snapshots()
        .listen((data) {
      emit(
        DinnerState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          DinnerState(
            documents: const [],
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
          documents: state.documents,
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
