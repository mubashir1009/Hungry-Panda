import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageIndicatorProvider = StateProvider<int>((ref){
  return 0; 
});

final buttonTappedNotifier = StateProvider<bool>((ref){
  return false;
});

final googleButtonTappedNotifier = StateProvider<bool>((ref){
  return false;
});