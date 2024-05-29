import 'package:get_it/get_it.dart';
import 'package:istu_map/features/object_card/data/datasources/object_cards_api.dart';
import 'package:istu_map/features/object_card/data/repositories/object_card_repository_impl.dart';
import 'package:istu_map/features/object_card/domain/repositories/object_card_repository.dart';
import 'package:istu_map/features/object_card/domain/usecases/create_comment.dart';
import 'package:istu_map/features/object_card/domain/usecases/delete_comment.dart';
import 'package:istu_map/features/object_card/domain/usecases/load_card.dart';
import 'package:istu_map/features/object_card/presentation/bloc/object_card_bloc.dart';

final sl = GetIt.instance;

void initObjectCardDependencies() {
  sl.registerFactory(() => ObjectCardBloc(sl(), sl(), sl()));

  sl.registerLazySingleton(() => CreateComment(sl()));
  sl.registerLazySingleton(() => DeleteComment(sl()));
  sl.registerLazySingleton(() => LoadCard(sl(), sl()));

  sl.registerLazySingleton<ObjectCardRepository>(
      () => ObjectCardRepositoryImpl(sl(), sl()));

  sl.registerLazySingleton(() => ObjectCardsApi(sl()));
}
