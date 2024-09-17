import '../../../domain/entities/actor.dart';
import '../../../domain/usecase/get_actors/get_actors.dart';
import '../../../domain/usecase/get_actors/get_actors_param.dart';
import '../usecases/get_actors_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/result.dart';

part 'actors_provider.g.dart';

@riverpod
Future<List<Actor>> actors(ActorsRef ref, {required int movieId}) async {
  GetActors getActors = ref.read(getActorsProvider);

  var actorResult = await getActors(GetActorsParam(movieId: movieId));

  return switch (actorResult) {
    Success(value: final actors) => actors,
    Failed(message: _) => [],
  };
}
