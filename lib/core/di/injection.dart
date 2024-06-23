import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

GetIt injector = GetIt.instance;

@InjectableInit(initializerName: 'inject')
FutureOr<void> inject({String? environment = Environment.dev}) => injector.inject(environment: environment);
