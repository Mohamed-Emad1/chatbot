
import 'package:chatbot/core/services/database_service.dart';
import 'package:chatbot/core/services/fire_store_service.dart';
import 'package:chatbot/core/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  // getIt.registerSingleton<AuthRepo>(AuthRepoImp(
  //   firebaseAuthService: getIt<FirebaseAuthService>(),
  //   databaseService: getIt<DatabaseService>(),
  // ));

}
