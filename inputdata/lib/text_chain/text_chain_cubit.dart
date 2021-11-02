import 'package:flutter_bloc/flutter_bloc.dart';

class TextChainCubit extends Cubit<String> {
  TextChainCubit() : super('');

  void setTextChain(String text) {
    emit(text);
  }

  void toUpperChase() {
    emit(state.toUpperCase());
  }
}