import 'package:flutter_bloc/flutter_bloc.dart';

class SnackBarState {
  final bool isVisible;
  final String message;

  const SnackBarState({
    required this.isVisible,
    required this.message,
  });

  SnackBarState copyWith({
    bool? isVisible,
    String? message,
  }) {
    return SnackBarState(
      isVisible: isVisible ?? this.isVisible,
      message: message ?? this.message,
    );
  }
}

class SnackBarCubit extends Cubit<SnackBarState> {
  SnackBarCubit() : super(const SnackBarState(isVisible: false, message: ''));

  void showSnackBar(String message) {
    emit(state.copyWith(isVisible: true, message: message));
    
    Future.delayed(const Duration(seconds: 3), () {
      if (state.isVisible) {
        hideSnackBar();
      }
    });
  }

  void hideSnackBar() {
    emit(state.copyWith(isVisible: false));
  }
}