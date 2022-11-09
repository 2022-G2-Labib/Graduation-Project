import 'package:get_it/get_it.dart';
import 'section/letter_service.dart';
import 'section/number_service.dart';
import 'model_inference_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<Letter>(Letter());
  locator.registerSingleton<Number>(Number());
  locator.registerLazySingleton<ModelInferenceService>(
      () => ModelInferenceService());
}
