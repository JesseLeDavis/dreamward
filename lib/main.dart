import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/database/app_database.dart';
import 'core/di/injection.dart';
import 'core/notifications/notification_service.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/widgets/boot_sequence.dart';
import 'features/dream_journal/data/repositories/dream_entity_repository_impl.dart';
import 'features/dream_journal/data/repositories/dream_repository_impl.dart';
import 'features/dream_journal/presentation/bloc/dream_journal_bloc.dart';
import 'features/dream_journal/presentation/bloc/entity_cubit.dart';
import 'features/obe_log/data/repositories/obe_repository_impl.dart';
import 'features/obe_log/presentation/bloc/obe_log_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await NotificationService.instance.init();
  runApp(const DreamwardApp());
}

class DreamwardApp extends StatefulWidget {
  const DreamwardApp({super.key});

  @override
  State<DreamwardApp> createState() => _DreamwardAppState();
}

class _DreamwardAppState extends State<DreamwardApp> {
  /// One-shot guard so the boot sequence plays only on the first launch in
  /// this process — not on every hot reload or theme rebuild.
  static bool _bootCompleted = false;

  bool _ready = _bootCompleted;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DreamJournalBloc>(
          create: (_) => DreamJournalBloc(
            repository: DreamRepositoryImpl(GetIt.instance<AppDatabase>()),
          )..add(LoadDreams()),
        ),
        BlocProvider<ObeLogBloc>(
          create: (_) => ObeLogBloc(
            repository: ObeRepositoryImpl(GetIt.instance<AppDatabase>()),
          )..add(LoadObeLogs()),
        ),
        BlocProvider<EntityCubit>(
          create: (_) => EntityCubit(
            repository:
                DreamEntityRepositoryImpl(GetIt.instance<AppDatabase>()),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Dreamward',
        routerConfig: createAppRouter(),
        theme: AppTheme.dark,
        debugShowCheckedModeBanner: false,
        builder: (context, child) => _ready
            ? (child ?? const SizedBox.shrink())
            : BootSequence(
                onComplete: () {
                  _bootCompleted = true;
                  if (mounted) setState(() => _ready = true);
                },
              ),
      ),
    );
  }
}
