import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:lastfm/di/injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureDependencies() => $initGetIt(getIt);
