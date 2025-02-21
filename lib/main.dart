import 'package:app/core/services/injection_container.dart';
import 'package:app/core/theme/theme.dart';
import 'package:app/firebase_options.dart';
import 'package:app/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:app/presentation/bloc/event_bloc/event_bloc.dart';
import 'package:app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  runApp(
    const QuickEvent(),
  );
}

class QuickEvent extends StatelessWidget {
  const QuickEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>(),
        ),
        BlocProvider<EventBloc>(
          create: (context) => sl<EventBloc>(),
        ),
        BlocProvider<UserBloc>(
          create: (context) => sl<UserBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Quick Event',
        theme: appTheme,
        routerConfig: router,
      ),
    );
  }
}
