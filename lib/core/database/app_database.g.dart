// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DailyRundownsTable extends DailyRundowns
    with TableInfo<$DailyRundownsTable, DailyRundown> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyRundownsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 10, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _morningMoodMeta =
      const VerificationMeta('morningMood');
  @override
  late final GeneratedColumn<int> morningMood = GeneratedColumn<int>(
      'morning_mood', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _eveningMoodMeta =
      const VerificationMeta('eveningMood');
  @override
  late final GeneratedColumn<int> eveningMood = GeneratedColumn<int>(
      'evening_mood', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _morningEnergyMeta =
      const VerificationMeta('morningEnergy');
  @override
  late final GeneratedColumn<int> morningEnergy = GeneratedColumn<int>(
      'morning_energy', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _eveningEnergyMeta =
      const VerificationMeta('eveningEnergy');
  @override
  late final GeneratedColumn<int> eveningEnergy = GeneratedColumn<int>(
      'evening_energy', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _sleepQualityMeta =
      const VerificationMeta('sleepQuality');
  @override
  late final GeneratedColumn<int> sleepQuality = GeneratedColumn<int>(
      'sleep_quality', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _sleepDurationMinutesMeta =
      const VerificationMeta('sleepDurationMinutes');
  @override
  late final GeneratedColumn<int> sleepDurationMinutes = GeneratedColumn<int>(
      'sleep_duration_minutes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _highlightsMeta =
      const VerificationMeta('highlights');
  @override
  late final GeneratedColumn<String> highlights = GeneratedColumn<String>(
      'highlights', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _challengesMeta =
      const VerificationMeta('challenges');
  @override
  late final GeneratedColumn<String> challenges = GeneratedColumn<String>(
      'challenges', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _gratitudeMeta =
      const VerificationMeta('gratitude');
  @override
  late final GeneratedColumn<String> gratitude = GeneratedColumn<String>(
      'gratitude', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _intentionsMeta =
      const VerificationMeta('intentions');
  @override
  late final GeneratedColumn<String> intentions = GeneratedColumn<String>(
      'intentions', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _reflectionsMeta =
      const VerificationMeta('reflections');
  @override
  late final GeneratedColumn<String> reflections = GeneratedColumn<String>(
      'reflections', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _affirmationOfDayMeta =
      const VerificationMeta('affirmationOfDay');
  @override
  late final GeneratedColumn<String> affirmationOfDay = GeneratedColumn<String>(
      'affirmation_of_day', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bodyAwarenessMeta =
      const VerificationMeta('bodyAwareness');
  @override
  late final GeneratedColumn<String> bodyAwareness = GeneratedColumn<String>(
      'body_awareness', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _didMeditateMeta =
      const VerificationMeta('didMeditate');
  @override
  late final GeneratedColumn<bool> didMeditate = GeneratedColumn<bool>(
      'did_meditate', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("did_meditate" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _didVisualizeMeta =
      const VerificationMeta('didVisualize');
  @override
  late final GeneratedColumn<bool> didVisualize = GeneratedColumn<bool>(
      'did_visualize', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("did_visualize" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _didBodyScanMeta =
      const VerificationMeta('didBodyScan');
  @override
  late final GeneratedColumn<bool> didBodyScan = GeneratedColumn<bool>(
      'did_body_scan', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("did_body_scan" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _didAffirmationsMeta =
      const VerificationMeta('didAffirmations');
  @override
  late final GeneratedColumn<bool> didAffirmations = GeneratedColumn<bool>(
      'did_affirmations', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("did_affirmations" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _ritualClearMeta =
      const VerificationMeta('ritualClear');
  @override
  late final GeneratedColumn<bool> ritualClear = GeneratedColumn<bool>(
      'ritual_clear', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("ritual_clear" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _ritualToneMeta =
      const VerificationMeta('ritualTone');
  @override
  late final GeneratedColumn<bool> ritualTone = GeneratedColumn<bool>(
      'ritual_tone', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("ritual_tone" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _ritualFieldMeta =
      const VerificationMeta('ritualField');
  @override
  late final GeneratedColumn<bool> ritualField = GeneratedColumn<bool>(
      'ritual_field', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("ritual_field" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _ritualAffirmationMeta =
      const VerificationMeta('ritualAffirmation');
  @override
  late final GeneratedColumn<bool> ritualAffirmation = GeneratedColumn<bool>(
      'ritual_affirmation', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("ritual_affirmation" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _sleepIntentionMeta =
      const VerificationMeta('sleepIntention');
  @override
  late final GeneratedColumn<String> sleepIntention = GeneratedColumn<String>(
      'sleep_intention', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bedtimeHourMeta =
      const VerificationMeta('bedtimeHour');
  @override
  late final GeneratedColumn<int> bedtimeHour = GeneratedColumn<int>(
      'bedtime_hour', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _bedtimeMinuteMeta =
      const VerificationMeta('bedtimeMinute');
  @override
  late final GeneratedColumn<int> bedtimeMinute = GeneratedColumn<int>(
      'bedtime_minute', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        morningMood,
        eveningMood,
        morningEnergy,
        eveningEnergy,
        sleepQuality,
        sleepDurationMinutes,
        highlights,
        challenges,
        gratitude,
        intentions,
        reflections,
        affirmationOfDay,
        bodyAwareness,
        didMeditate,
        didVisualize,
        didBodyScan,
        didAffirmations,
        ritualClear,
        ritualTone,
        ritualField,
        ritualAffirmation,
        sleepIntention,
        bedtimeHour,
        bedtimeMinute,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_rundowns';
  @override
  VerificationContext validateIntegrity(Insertable<DailyRundown> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('morning_mood')) {
      context.handle(
          _morningMoodMeta,
          morningMood.isAcceptableOrUnknown(
              data['morning_mood']!, _morningMoodMeta));
    }
    if (data.containsKey('evening_mood')) {
      context.handle(
          _eveningMoodMeta,
          eveningMood.isAcceptableOrUnknown(
              data['evening_mood']!, _eveningMoodMeta));
    }
    if (data.containsKey('morning_energy')) {
      context.handle(
          _morningEnergyMeta,
          morningEnergy.isAcceptableOrUnknown(
              data['morning_energy']!, _morningEnergyMeta));
    }
    if (data.containsKey('evening_energy')) {
      context.handle(
          _eveningEnergyMeta,
          eveningEnergy.isAcceptableOrUnknown(
              data['evening_energy']!, _eveningEnergyMeta));
    }
    if (data.containsKey('sleep_quality')) {
      context.handle(
          _sleepQualityMeta,
          sleepQuality.isAcceptableOrUnknown(
              data['sleep_quality']!, _sleepQualityMeta));
    }
    if (data.containsKey('sleep_duration_minutes')) {
      context.handle(
          _sleepDurationMinutesMeta,
          sleepDurationMinutes.isAcceptableOrUnknown(
              data['sleep_duration_minutes']!, _sleepDurationMinutesMeta));
    }
    if (data.containsKey('highlights')) {
      context.handle(
          _highlightsMeta,
          highlights.isAcceptableOrUnknown(
              data['highlights']!, _highlightsMeta));
    }
    if (data.containsKey('challenges')) {
      context.handle(
          _challengesMeta,
          challenges.isAcceptableOrUnknown(
              data['challenges']!, _challengesMeta));
    }
    if (data.containsKey('gratitude')) {
      context.handle(_gratitudeMeta,
          gratitude.isAcceptableOrUnknown(data['gratitude']!, _gratitudeMeta));
    }
    if (data.containsKey('intentions')) {
      context.handle(
          _intentionsMeta,
          intentions.isAcceptableOrUnknown(
              data['intentions']!, _intentionsMeta));
    }
    if (data.containsKey('reflections')) {
      context.handle(
          _reflectionsMeta,
          reflections.isAcceptableOrUnknown(
              data['reflections']!, _reflectionsMeta));
    }
    if (data.containsKey('affirmation_of_day')) {
      context.handle(
          _affirmationOfDayMeta,
          affirmationOfDay.isAcceptableOrUnknown(
              data['affirmation_of_day']!, _affirmationOfDayMeta));
    }
    if (data.containsKey('body_awareness')) {
      context.handle(
          _bodyAwarenessMeta,
          bodyAwareness.isAcceptableOrUnknown(
              data['body_awareness']!, _bodyAwarenessMeta));
    }
    if (data.containsKey('did_meditate')) {
      context.handle(
          _didMeditateMeta,
          didMeditate.isAcceptableOrUnknown(
              data['did_meditate']!, _didMeditateMeta));
    }
    if (data.containsKey('did_visualize')) {
      context.handle(
          _didVisualizeMeta,
          didVisualize.isAcceptableOrUnknown(
              data['did_visualize']!, _didVisualizeMeta));
    }
    if (data.containsKey('did_body_scan')) {
      context.handle(
          _didBodyScanMeta,
          didBodyScan.isAcceptableOrUnknown(
              data['did_body_scan']!, _didBodyScanMeta));
    }
    if (data.containsKey('did_affirmations')) {
      context.handle(
          _didAffirmationsMeta,
          didAffirmations.isAcceptableOrUnknown(
              data['did_affirmations']!, _didAffirmationsMeta));
    }
    if (data.containsKey('ritual_clear')) {
      context.handle(
          _ritualClearMeta,
          ritualClear.isAcceptableOrUnknown(
              data['ritual_clear']!, _ritualClearMeta));
    }
    if (data.containsKey('ritual_tone')) {
      context.handle(
          _ritualToneMeta,
          ritualTone.isAcceptableOrUnknown(
              data['ritual_tone']!, _ritualToneMeta));
    }
    if (data.containsKey('ritual_field')) {
      context.handle(
          _ritualFieldMeta,
          ritualField.isAcceptableOrUnknown(
              data['ritual_field']!, _ritualFieldMeta));
    }
    if (data.containsKey('ritual_affirmation')) {
      context.handle(
          _ritualAffirmationMeta,
          ritualAffirmation.isAcceptableOrUnknown(
              data['ritual_affirmation']!, _ritualAffirmationMeta));
    }
    if (data.containsKey('sleep_intention')) {
      context.handle(
          _sleepIntentionMeta,
          sleepIntention.isAcceptableOrUnknown(
              data['sleep_intention']!, _sleepIntentionMeta));
    }
    if (data.containsKey('bedtime_hour')) {
      context.handle(
          _bedtimeHourMeta,
          bedtimeHour.isAcceptableOrUnknown(
              data['bedtime_hour']!, _bedtimeHourMeta));
    }
    if (data.containsKey('bedtime_minute')) {
      context.handle(
          _bedtimeMinuteMeta,
          bedtimeMinute.isAcceptableOrUnknown(
              data['bedtime_minute']!, _bedtimeMinuteMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyRundown map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyRundown(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      morningMood: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}morning_mood']),
      eveningMood: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}evening_mood']),
      morningEnergy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}morning_energy']),
      eveningEnergy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}evening_energy']),
      sleepQuality: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sleep_quality']),
      sleepDurationMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}sleep_duration_minutes']),
      highlights: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}highlights']),
      challenges: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}challenges']),
      gratitude: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gratitude']),
      intentions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}intentions']),
      reflections: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reflections']),
      affirmationOfDay: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}affirmation_of_day']),
      bodyAwareness: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body_awareness']),
      didMeditate: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}did_meditate'])!,
      didVisualize: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}did_visualize'])!,
      didBodyScan: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}did_body_scan'])!,
      didAffirmations: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}did_affirmations'])!,
      ritualClear: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}ritual_clear'])!,
      ritualTone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}ritual_tone'])!,
      ritualField: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}ritual_field'])!,
      ritualAffirmation: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}ritual_affirmation'])!,
      sleepIntention: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sleep_intention']),
      bedtimeHour: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bedtime_hour']),
      bedtimeMinute: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bedtime_minute']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $DailyRundownsTable createAlias(String alias) {
    return $DailyRundownsTable(attachedDatabase, alias);
  }
}

class DailyRundown extends DataClass implements Insertable<DailyRundown> {
  /// Date in ISO 8601 format: 'YYYY-MM-DD'. Acts as both PK and natural join key.
  final String id;
  final int? morningMood;
  final int? eveningMood;
  final int? morningEnergy;
  final int? eveningEnergy;
  final int? sleepQuality;

  /// Sleep duration in minutes for integer precision.
  final int? sleepDurationMinutes;
  final String? highlights;
  final String? challenges;
  final String? gratitude;
  final String? intentions;
  final String? reflections;
  final String? affirmationOfDay;
  final String? bodyAwareness;
  final bool didMeditate;
  final bool didVisualize;
  final bool didBodyScan;
  final bool didAffirmations;
  final bool ritualClear;
  final bool ritualTone;
  final bool ritualField;
  final bool ritualAffirmation;
  final String? sleepIntention;
  final int? bedtimeHour;
  final int? bedtimeMinute;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DailyRundown(
      {required this.id,
      this.morningMood,
      this.eveningMood,
      this.morningEnergy,
      this.eveningEnergy,
      this.sleepQuality,
      this.sleepDurationMinutes,
      this.highlights,
      this.challenges,
      this.gratitude,
      this.intentions,
      this.reflections,
      this.affirmationOfDay,
      this.bodyAwareness,
      required this.didMeditate,
      required this.didVisualize,
      required this.didBodyScan,
      required this.didAffirmations,
      required this.ritualClear,
      required this.ritualTone,
      required this.ritualField,
      required this.ritualAffirmation,
      this.sleepIntention,
      this.bedtimeHour,
      this.bedtimeMinute,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || morningMood != null) {
      map['morning_mood'] = Variable<int>(morningMood);
    }
    if (!nullToAbsent || eveningMood != null) {
      map['evening_mood'] = Variable<int>(eveningMood);
    }
    if (!nullToAbsent || morningEnergy != null) {
      map['morning_energy'] = Variable<int>(morningEnergy);
    }
    if (!nullToAbsent || eveningEnergy != null) {
      map['evening_energy'] = Variable<int>(eveningEnergy);
    }
    if (!nullToAbsent || sleepQuality != null) {
      map['sleep_quality'] = Variable<int>(sleepQuality);
    }
    if (!nullToAbsent || sleepDurationMinutes != null) {
      map['sleep_duration_minutes'] = Variable<int>(sleepDurationMinutes);
    }
    if (!nullToAbsent || highlights != null) {
      map['highlights'] = Variable<String>(highlights);
    }
    if (!nullToAbsent || challenges != null) {
      map['challenges'] = Variable<String>(challenges);
    }
    if (!nullToAbsent || gratitude != null) {
      map['gratitude'] = Variable<String>(gratitude);
    }
    if (!nullToAbsent || intentions != null) {
      map['intentions'] = Variable<String>(intentions);
    }
    if (!nullToAbsent || reflections != null) {
      map['reflections'] = Variable<String>(reflections);
    }
    if (!nullToAbsent || affirmationOfDay != null) {
      map['affirmation_of_day'] = Variable<String>(affirmationOfDay);
    }
    if (!nullToAbsent || bodyAwareness != null) {
      map['body_awareness'] = Variable<String>(bodyAwareness);
    }
    map['did_meditate'] = Variable<bool>(didMeditate);
    map['did_visualize'] = Variable<bool>(didVisualize);
    map['did_body_scan'] = Variable<bool>(didBodyScan);
    map['did_affirmations'] = Variable<bool>(didAffirmations);
    map['ritual_clear'] = Variable<bool>(ritualClear);
    map['ritual_tone'] = Variable<bool>(ritualTone);
    map['ritual_field'] = Variable<bool>(ritualField);
    map['ritual_affirmation'] = Variable<bool>(ritualAffirmation);
    if (!nullToAbsent || sleepIntention != null) {
      map['sleep_intention'] = Variable<String>(sleepIntention);
    }
    if (!nullToAbsent || bedtimeHour != null) {
      map['bedtime_hour'] = Variable<int>(bedtimeHour);
    }
    if (!nullToAbsent || bedtimeMinute != null) {
      map['bedtime_minute'] = Variable<int>(bedtimeMinute);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DailyRundownsCompanion toCompanion(bool nullToAbsent) {
    return DailyRundownsCompanion(
      id: Value(id),
      morningMood: morningMood == null && nullToAbsent
          ? const Value.absent()
          : Value(morningMood),
      eveningMood: eveningMood == null && nullToAbsent
          ? const Value.absent()
          : Value(eveningMood),
      morningEnergy: morningEnergy == null && nullToAbsent
          ? const Value.absent()
          : Value(morningEnergy),
      eveningEnergy: eveningEnergy == null && nullToAbsent
          ? const Value.absent()
          : Value(eveningEnergy),
      sleepQuality: sleepQuality == null && nullToAbsent
          ? const Value.absent()
          : Value(sleepQuality),
      sleepDurationMinutes: sleepDurationMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(sleepDurationMinutes),
      highlights: highlights == null && nullToAbsent
          ? const Value.absent()
          : Value(highlights),
      challenges: challenges == null && nullToAbsent
          ? const Value.absent()
          : Value(challenges),
      gratitude: gratitude == null && nullToAbsent
          ? const Value.absent()
          : Value(gratitude),
      intentions: intentions == null && nullToAbsent
          ? const Value.absent()
          : Value(intentions),
      reflections: reflections == null && nullToAbsent
          ? const Value.absent()
          : Value(reflections),
      affirmationOfDay: affirmationOfDay == null && nullToAbsent
          ? const Value.absent()
          : Value(affirmationOfDay),
      bodyAwareness: bodyAwareness == null && nullToAbsent
          ? const Value.absent()
          : Value(bodyAwareness),
      didMeditate: Value(didMeditate),
      didVisualize: Value(didVisualize),
      didBodyScan: Value(didBodyScan),
      didAffirmations: Value(didAffirmations),
      ritualClear: Value(ritualClear),
      ritualTone: Value(ritualTone),
      ritualField: Value(ritualField),
      ritualAffirmation: Value(ritualAffirmation),
      sleepIntention: sleepIntention == null && nullToAbsent
          ? const Value.absent()
          : Value(sleepIntention),
      bedtimeHour: bedtimeHour == null && nullToAbsent
          ? const Value.absent()
          : Value(bedtimeHour),
      bedtimeMinute: bedtimeMinute == null && nullToAbsent
          ? const Value.absent()
          : Value(bedtimeMinute),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DailyRundown.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyRundown(
      id: serializer.fromJson<String>(json['id']),
      morningMood: serializer.fromJson<int?>(json['morningMood']),
      eveningMood: serializer.fromJson<int?>(json['eveningMood']),
      morningEnergy: serializer.fromJson<int?>(json['morningEnergy']),
      eveningEnergy: serializer.fromJson<int?>(json['eveningEnergy']),
      sleepQuality: serializer.fromJson<int?>(json['sleepQuality']),
      sleepDurationMinutes:
          serializer.fromJson<int?>(json['sleepDurationMinutes']),
      highlights: serializer.fromJson<String?>(json['highlights']),
      challenges: serializer.fromJson<String?>(json['challenges']),
      gratitude: serializer.fromJson<String?>(json['gratitude']),
      intentions: serializer.fromJson<String?>(json['intentions']),
      reflections: serializer.fromJson<String?>(json['reflections']),
      affirmationOfDay: serializer.fromJson<String?>(json['affirmationOfDay']),
      bodyAwareness: serializer.fromJson<String?>(json['bodyAwareness']),
      didMeditate: serializer.fromJson<bool>(json['didMeditate']),
      didVisualize: serializer.fromJson<bool>(json['didVisualize']),
      didBodyScan: serializer.fromJson<bool>(json['didBodyScan']),
      didAffirmations: serializer.fromJson<bool>(json['didAffirmations']),
      ritualClear: serializer.fromJson<bool>(json['ritualClear']),
      ritualTone: serializer.fromJson<bool>(json['ritualTone']),
      ritualField: serializer.fromJson<bool>(json['ritualField']),
      ritualAffirmation: serializer.fromJson<bool>(json['ritualAffirmation']),
      sleepIntention: serializer.fromJson<String?>(json['sleepIntention']),
      bedtimeHour: serializer.fromJson<int?>(json['bedtimeHour']),
      bedtimeMinute: serializer.fromJson<int?>(json['bedtimeMinute']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'morningMood': serializer.toJson<int?>(morningMood),
      'eveningMood': serializer.toJson<int?>(eveningMood),
      'morningEnergy': serializer.toJson<int?>(morningEnergy),
      'eveningEnergy': serializer.toJson<int?>(eveningEnergy),
      'sleepQuality': serializer.toJson<int?>(sleepQuality),
      'sleepDurationMinutes': serializer.toJson<int?>(sleepDurationMinutes),
      'highlights': serializer.toJson<String?>(highlights),
      'challenges': serializer.toJson<String?>(challenges),
      'gratitude': serializer.toJson<String?>(gratitude),
      'intentions': serializer.toJson<String?>(intentions),
      'reflections': serializer.toJson<String?>(reflections),
      'affirmationOfDay': serializer.toJson<String?>(affirmationOfDay),
      'bodyAwareness': serializer.toJson<String?>(bodyAwareness),
      'didMeditate': serializer.toJson<bool>(didMeditate),
      'didVisualize': serializer.toJson<bool>(didVisualize),
      'didBodyScan': serializer.toJson<bool>(didBodyScan),
      'didAffirmations': serializer.toJson<bool>(didAffirmations),
      'ritualClear': serializer.toJson<bool>(ritualClear),
      'ritualTone': serializer.toJson<bool>(ritualTone),
      'ritualField': serializer.toJson<bool>(ritualField),
      'ritualAffirmation': serializer.toJson<bool>(ritualAffirmation),
      'sleepIntention': serializer.toJson<String?>(sleepIntention),
      'bedtimeHour': serializer.toJson<int?>(bedtimeHour),
      'bedtimeMinute': serializer.toJson<int?>(bedtimeMinute),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DailyRundown copyWith(
          {String? id,
          Value<int?> morningMood = const Value.absent(),
          Value<int?> eveningMood = const Value.absent(),
          Value<int?> morningEnergy = const Value.absent(),
          Value<int?> eveningEnergy = const Value.absent(),
          Value<int?> sleepQuality = const Value.absent(),
          Value<int?> sleepDurationMinutes = const Value.absent(),
          Value<String?> highlights = const Value.absent(),
          Value<String?> challenges = const Value.absent(),
          Value<String?> gratitude = const Value.absent(),
          Value<String?> intentions = const Value.absent(),
          Value<String?> reflections = const Value.absent(),
          Value<String?> affirmationOfDay = const Value.absent(),
          Value<String?> bodyAwareness = const Value.absent(),
          bool? didMeditate,
          bool? didVisualize,
          bool? didBodyScan,
          bool? didAffirmations,
          bool? ritualClear,
          bool? ritualTone,
          bool? ritualField,
          bool? ritualAffirmation,
          Value<String?> sleepIntention = const Value.absent(),
          Value<int?> bedtimeHour = const Value.absent(),
          Value<int?> bedtimeMinute = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      DailyRundown(
        id: id ?? this.id,
        morningMood: morningMood.present ? morningMood.value : this.morningMood,
        eveningMood: eveningMood.present ? eveningMood.value : this.eveningMood,
        morningEnergy:
            morningEnergy.present ? morningEnergy.value : this.morningEnergy,
        eveningEnergy:
            eveningEnergy.present ? eveningEnergy.value : this.eveningEnergy,
        sleepQuality:
            sleepQuality.present ? sleepQuality.value : this.sleepQuality,
        sleepDurationMinutes: sleepDurationMinutes.present
            ? sleepDurationMinutes.value
            : this.sleepDurationMinutes,
        highlights: highlights.present ? highlights.value : this.highlights,
        challenges: challenges.present ? challenges.value : this.challenges,
        gratitude: gratitude.present ? gratitude.value : this.gratitude,
        intentions: intentions.present ? intentions.value : this.intentions,
        reflections: reflections.present ? reflections.value : this.reflections,
        affirmationOfDay: affirmationOfDay.present
            ? affirmationOfDay.value
            : this.affirmationOfDay,
        bodyAwareness:
            bodyAwareness.present ? bodyAwareness.value : this.bodyAwareness,
        didMeditate: didMeditate ?? this.didMeditate,
        didVisualize: didVisualize ?? this.didVisualize,
        didBodyScan: didBodyScan ?? this.didBodyScan,
        didAffirmations: didAffirmations ?? this.didAffirmations,
        ritualClear: ritualClear ?? this.ritualClear,
        ritualTone: ritualTone ?? this.ritualTone,
        ritualField: ritualField ?? this.ritualField,
        ritualAffirmation: ritualAffirmation ?? this.ritualAffirmation,
        sleepIntention:
            sleepIntention.present ? sleepIntention.value : this.sleepIntention,
        bedtimeHour: bedtimeHour.present ? bedtimeHour.value : this.bedtimeHour,
        bedtimeMinute:
            bedtimeMinute.present ? bedtimeMinute.value : this.bedtimeMinute,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  DailyRundown copyWithCompanion(DailyRundownsCompanion data) {
    return DailyRundown(
      id: data.id.present ? data.id.value : this.id,
      morningMood:
          data.morningMood.present ? data.morningMood.value : this.morningMood,
      eveningMood:
          data.eveningMood.present ? data.eveningMood.value : this.eveningMood,
      morningEnergy: data.morningEnergy.present
          ? data.morningEnergy.value
          : this.morningEnergy,
      eveningEnergy: data.eveningEnergy.present
          ? data.eveningEnergy.value
          : this.eveningEnergy,
      sleepQuality: data.sleepQuality.present
          ? data.sleepQuality.value
          : this.sleepQuality,
      sleepDurationMinutes: data.sleepDurationMinutes.present
          ? data.sleepDurationMinutes.value
          : this.sleepDurationMinutes,
      highlights:
          data.highlights.present ? data.highlights.value : this.highlights,
      challenges:
          data.challenges.present ? data.challenges.value : this.challenges,
      gratitude: data.gratitude.present ? data.gratitude.value : this.gratitude,
      intentions:
          data.intentions.present ? data.intentions.value : this.intentions,
      reflections:
          data.reflections.present ? data.reflections.value : this.reflections,
      affirmationOfDay: data.affirmationOfDay.present
          ? data.affirmationOfDay.value
          : this.affirmationOfDay,
      bodyAwareness: data.bodyAwareness.present
          ? data.bodyAwareness.value
          : this.bodyAwareness,
      didMeditate:
          data.didMeditate.present ? data.didMeditate.value : this.didMeditate,
      didVisualize: data.didVisualize.present
          ? data.didVisualize.value
          : this.didVisualize,
      didBodyScan:
          data.didBodyScan.present ? data.didBodyScan.value : this.didBodyScan,
      didAffirmations: data.didAffirmations.present
          ? data.didAffirmations.value
          : this.didAffirmations,
      ritualClear:
          data.ritualClear.present ? data.ritualClear.value : this.ritualClear,
      ritualTone:
          data.ritualTone.present ? data.ritualTone.value : this.ritualTone,
      ritualField:
          data.ritualField.present ? data.ritualField.value : this.ritualField,
      ritualAffirmation: data.ritualAffirmation.present
          ? data.ritualAffirmation.value
          : this.ritualAffirmation,
      sleepIntention: data.sleepIntention.present
          ? data.sleepIntention.value
          : this.sleepIntention,
      bedtimeHour:
          data.bedtimeHour.present ? data.bedtimeHour.value : this.bedtimeHour,
      bedtimeMinute: data.bedtimeMinute.present
          ? data.bedtimeMinute.value
          : this.bedtimeMinute,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyRundown(')
          ..write('id: $id, ')
          ..write('morningMood: $morningMood, ')
          ..write('eveningMood: $eveningMood, ')
          ..write('morningEnergy: $morningEnergy, ')
          ..write('eveningEnergy: $eveningEnergy, ')
          ..write('sleepQuality: $sleepQuality, ')
          ..write('sleepDurationMinutes: $sleepDurationMinutes, ')
          ..write('highlights: $highlights, ')
          ..write('challenges: $challenges, ')
          ..write('gratitude: $gratitude, ')
          ..write('intentions: $intentions, ')
          ..write('reflections: $reflections, ')
          ..write('affirmationOfDay: $affirmationOfDay, ')
          ..write('bodyAwareness: $bodyAwareness, ')
          ..write('didMeditate: $didMeditate, ')
          ..write('didVisualize: $didVisualize, ')
          ..write('didBodyScan: $didBodyScan, ')
          ..write('didAffirmations: $didAffirmations, ')
          ..write('ritualClear: $ritualClear, ')
          ..write('ritualTone: $ritualTone, ')
          ..write('ritualField: $ritualField, ')
          ..write('ritualAffirmation: $ritualAffirmation, ')
          ..write('sleepIntention: $sleepIntention, ')
          ..write('bedtimeHour: $bedtimeHour, ')
          ..write('bedtimeMinute: $bedtimeMinute, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        morningMood,
        eveningMood,
        morningEnergy,
        eveningEnergy,
        sleepQuality,
        sleepDurationMinutes,
        highlights,
        challenges,
        gratitude,
        intentions,
        reflections,
        affirmationOfDay,
        bodyAwareness,
        didMeditate,
        didVisualize,
        didBodyScan,
        didAffirmations,
        ritualClear,
        ritualTone,
        ritualField,
        ritualAffirmation,
        sleepIntention,
        bedtimeHour,
        bedtimeMinute,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyRundown &&
          other.id == this.id &&
          other.morningMood == this.morningMood &&
          other.eveningMood == this.eveningMood &&
          other.morningEnergy == this.morningEnergy &&
          other.eveningEnergy == this.eveningEnergy &&
          other.sleepQuality == this.sleepQuality &&
          other.sleepDurationMinutes == this.sleepDurationMinutes &&
          other.highlights == this.highlights &&
          other.challenges == this.challenges &&
          other.gratitude == this.gratitude &&
          other.intentions == this.intentions &&
          other.reflections == this.reflections &&
          other.affirmationOfDay == this.affirmationOfDay &&
          other.bodyAwareness == this.bodyAwareness &&
          other.didMeditate == this.didMeditate &&
          other.didVisualize == this.didVisualize &&
          other.didBodyScan == this.didBodyScan &&
          other.didAffirmations == this.didAffirmations &&
          other.ritualClear == this.ritualClear &&
          other.ritualTone == this.ritualTone &&
          other.ritualField == this.ritualField &&
          other.ritualAffirmation == this.ritualAffirmation &&
          other.sleepIntention == this.sleepIntention &&
          other.bedtimeHour == this.bedtimeHour &&
          other.bedtimeMinute == this.bedtimeMinute &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DailyRundownsCompanion extends UpdateCompanion<DailyRundown> {
  final Value<String> id;
  final Value<int?> morningMood;
  final Value<int?> eveningMood;
  final Value<int?> morningEnergy;
  final Value<int?> eveningEnergy;
  final Value<int?> sleepQuality;
  final Value<int?> sleepDurationMinutes;
  final Value<String?> highlights;
  final Value<String?> challenges;
  final Value<String?> gratitude;
  final Value<String?> intentions;
  final Value<String?> reflections;
  final Value<String?> affirmationOfDay;
  final Value<String?> bodyAwareness;
  final Value<bool> didMeditate;
  final Value<bool> didVisualize;
  final Value<bool> didBodyScan;
  final Value<bool> didAffirmations;
  final Value<bool> ritualClear;
  final Value<bool> ritualTone;
  final Value<bool> ritualField;
  final Value<bool> ritualAffirmation;
  final Value<String?> sleepIntention;
  final Value<int?> bedtimeHour;
  final Value<int?> bedtimeMinute;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const DailyRundownsCompanion({
    this.id = const Value.absent(),
    this.morningMood = const Value.absent(),
    this.eveningMood = const Value.absent(),
    this.morningEnergy = const Value.absent(),
    this.eveningEnergy = const Value.absent(),
    this.sleepQuality = const Value.absent(),
    this.sleepDurationMinutes = const Value.absent(),
    this.highlights = const Value.absent(),
    this.challenges = const Value.absent(),
    this.gratitude = const Value.absent(),
    this.intentions = const Value.absent(),
    this.reflections = const Value.absent(),
    this.affirmationOfDay = const Value.absent(),
    this.bodyAwareness = const Value.absent(),
    this.didMeditate = const Value.absent(),
    this.didVisualize = const Value.absent(),
    this.didBodyScan = const Value.absent(),
    this.didAffirmations = const Value.absent(),
    this.ritualClear = const Value.absent(),
    this.ritualTone = const Value.absent(),
    this.ritualField = const Value.absent(),
    this.ritualAffirmation = const Value.absent(),
    this.sleepIntention = const Value.absent(),
    this.bedtimeHour = const Value.absent(),
    this.bedtimeMinute = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyRundownsCompanion.insert({
    required String id,
    this.morningMood = const Value.absent(),
    this.eveningMood = const Value.absent(),
    this.morningEnergy = const Value.absent(),
    this.eveningEnergy = const Value.absent(),
    this.sleepQuality = const Value.absent(),
    this.sleepDurationMinutes = const Value.absent(),
    this.highlights = const Value.absent(),
    this.challenges = const Value.absent(),
    this.gratitude = const Value.absent(),
    this.intentions = const Value.absent(),
    this.reflections = const Value.absent(),
    this.affirmationOfDay = const Value.absent(),
    this.bodyAwareness = const Value.absent(),
    this.didMeditate = const Value.absent(),
    this.didVisualize = const Value.absent(),
    this.didBodyScan = const Value.absent(),
    this.didAffirmations = const Value.absent(),
    this.ritualClear = const Value.absent(),
    this.ritualTone = const Value.absent(),
    this.ritualField = const Value.absent(),
    this.ritualAffirmation = const Value.absent(),
    this.sleepIntention = const Value.absent(),
    this.bedtimeHour = const Value.absent(),
    this.bedtimeMinute = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<DailyRundown> custom({
    Expression<String>? id,
    Expression<int>? morningMood,
    Expression<int>? eveningMood,
    Expression<int>? morningEnergy,
    Expression<int>? eveningEnergy,
    Expression<int>? sleepQuality,
    Expression<int>? sleepDurationMinutes,
    Expression<String>? highlights,
    Expression<String>? challenges,
    Expression<String>? gratitude,
    Expression<String>? intentions,
    Expression<String>? reflections,
    Expression<String>? affirmationOfDay,
    Expression<String>? bodyAwareness,
    Expression<bool>? didMeditate,
    Expression<bool>? didVisualize,
    Expression<bool>? didBodyScan,
    Expression<bool>? didAffirmations,
    Expression<bool>? ritualClear,
    Expression<bool>? ritualTone,
    Expression<bool>? ritualField,
    Expression<bool>? ritualAffirmation,
    Expression<String>? sleepIntention,
    Expression<int>? bedtimeHour,
    Expression<int>? bedtimeMinute,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (morningMood != null) 'morning_mood': morningMood,
      if (eveningMood != null) 'evening_mood': eveningMood,
      if (morningEnergy != null) 'morning_energy': morningEnergy,
      if (eveningEnergy != null) 'evening_energy': eveningEnergy,
      if (sleepQuality != null) 'sleep_quality': sleepQuality,
      if (sleepDurationMinutes != null)
        'sleep_duration_minutes': sleepDurationMinutes,
      if (highlights != null) 'highlights': highlights,
      if (challenges != null) 'challenges': challenges,
      if (gratitude != null) 'gratitude': gratitude,
      if (intentions != null) 'intentions': intentions,
      if (reflections != null) 'reflections': reflections,
      if (affirmationOfDay != null) 'affirmation_of_day': affirmationOfDay,
      if (bodyAwareness != null) 'body_awareness': bodyAwareness,
      if (didMeditate != null) 'did_meditate': didMeditate,
      if (didVisualize != null) 'did_visualize': didVisualize,
      if (didBodyScan != null) 'did_body_scan': didBodyScan,
      if (didAffirmations != null) 'did_affirmations': didAffirmations,
      if (ritualClear != null) 'ritual_clear': ritualClear,
      if (ritualTone != null) 'ritual_tone': ritualTone,
      if (ritualField != null) 'ritual_field': ritualField,
      if (ritualAffirmation != null) 'ritual_affirmation': ritualAffirmation,
      if (sleepIntention != null) 'sleep_intention': sleepIntention,
      if (bedtimeHour != null) 'bedtime_hour': bedtimeHour,
      if (bedtimeMinute != null) 'bedtime_minute': bedtimeMinute,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyRundownsCompanion copyWith(
      {Value<String>? id,
      Value<int?>? morningMood,
      Value<int?>? eveningMood,
      Value<int?>? morningEnergy,
      Value<int?>? eveningEnergy,
      Value<int?>? sleepQuality,
      Value<int?>? sleepDurationMinutes,
      Value<String?>? highlights,
      Value<String?>? challenges,
      Value<String?>? gratitude,
      Value<String?>? intentions,
      Value<String?>? reflections,
      Value<String?>? affirmationOfDay,
      Value<String?>? bodyAwareness,
      Value<bool>? didMeditate,
      Value<bool>? didVisualize,
      Value<bool>? didBodyScan,
      Value<bool>? didAffirmations,
      Value<bool>? ritualClear,
      Value<bool>? ritualTone,
      Value<bool>? ritualField,
      Value<bool>? ritualAffirmation,
      Value<String?>? sleepIntention,
      Value<int?>? bedtimeHour,
      Value<int?>? bedtimeMinute,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return DailyRundownsCompanion(
      id: id ?? this.id,
      morningMood: morningMood ?? this.morningMood,
      eveningMood: eveningMood ?? this.eveningMood,
      morningEnergy: morningEnergy ?? this.morningEnergy,
      eveningEnergy: eveningEnergy ?? this.eveningEnergy,
      sleepQuality: sleepQuality ?? this.sleepQuality,
      sleepDurationMinutes: sleepDurationMinutes ?? this.sleepDurationMinutes,
      highlights: highlights ?? this.highlights,
      challenges: challenges ?? this.challenges,
      gratitude: gratitude ?? this.gratitude,
      intentions: intentions ?? this.intentions,
      reflections: reflections ?? this.reflections,
      affirmationOfDay: affirmationOfDay ?? this.affirmationOfDay,
      bodyAwareness: bodyAwareness ?? this.bodyAwareness,
      didMeditate: didMeditate ?? this.didMeditate,
      didVisualize: didVisualize ?? this.didVisualize,
      didBodyScan: didBodyScan ?? this.didBodyScan,
      didAffirmations: didAffirmations ?? this.didAffirmations,
      ritualClear: ritualClear ?? this.ritualClear,
      ritualTone: ritualTone ?? this.ritualTone,
      ritualField: ritualField ?? this.ritualField,
      ritualAffirmation: ritualAffirmation ?? this.ritualAffirmation,
      sleepIntention: sleepIntention ?? this.sleepIntention,
      bedtimeHour: bedtimeHour ?? this.bedtimeHour,
      bedtimeMinute: bedtimeMinute ?? this.bedtimeMinute,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (morningMood.present) {
      map['morning_mood'] = Variable<int>(morningMood.value);
    }
    if (eveningMood.present) {
      map['evening_mood'] = Variable<int>(eveningMood.value);
    }
    if (morningEnergy.present) {
      map['morning_energy'] = Variable<int>(morningEnergy.value);
    }
    if (eveningEnergy.present) {
      map['evening_energy'] = Variable<int>(eveningEnergy.value);
    }
    if (sleepQuality.present) {
      map['sleep_quality'] = Variable<int>(sleepQuality.value);
    }
    if (sleepDurationMinutes.present) {
      map['sleep_duration_minutes'] = Variable<int>(sleepDurationMinutes.value);
    }
    if (highlights.present) {
      map['highlights'] = Variable<String>(highlights.value);
    }
    if (challenges.present) {
      map['challenges'] = Variable<String>(challenges.value);
    }
    if (gratitude.present) {
      map['gratitude'] = Variable<String>(gratitude.value);
    }
    if (intentions.present) {
      map['intentions'] = Variable<String>(intentions.value);
    }
    if (reflections.present) {
      map['reflections'] = Variable<String>(reflections.value);
    }
    if (affirmationOfDay.present) {
      map['affirmation_of_day'] = Variable<String>(affirmationOfDay.value);
    }
    if (bodyAwareness.present) {
      map['body_awareness'] = Variable<String>(bodyAwareness.value);
    }
    if (didMeditate.present) {
      map['did_meditate'] = Variable<bool>(didMeditate.value);
    }
    if (didVisualize.present) {
      map['did_visualize'] = Variable<bool>(didVisualize.value);
    }
    if (didBodyScan.present) {
      map['did_body_scan'] = Variable<bool>(didBodyScan.value);
    }
    if (didAffirmations.present) {
      map['did_affirmations'] = Variable<bool>(didAffirmations.value);
    }
    if (ritualClear.present) {
      map['ritual_clear'] = Variable<bool>(ritualClear.value);
    }
    if (ritualTone.present) {
      map['ritual_tone'] = Variable<bool>(ritualTone.value);
    }
    if (ritualField.present) {
      map['ritual_field'] = Variable<bool>(ritualField.value);
    }
    if (ritualAffirmation.present) {
      map['ritual_affirmation'] = Variable<bool>(ritualAffirmation.value);
    }
    if (sleepIntention.present) {
      map['sleep_intention'] = Variable<String>(sleepIntention.value);
    }
    if (bedtimeHour.present) {
      map['bedtime_hour'] = Variable<int>(bedtimeHour.value);
    }
    if (bedtimeMinute.present) {
      map['bedtime_minute'] = Variable<int>(bedtimeMinute.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyRundownsCompanion(')
          ..write('id: $id, ')
          ..write('morningMood: $morningMood, ')
          ..write('eveningMood: $eveningMood, ')
          ..write('morningEnergy: $morningEnergy, ')
          ..write('eveningEnergy: $eveningEnergy, ')
          ..write('sleepQuality: $sleepQuality, ')
          ..write('sleepDurationMinutes: $sleepDurationMinutes, ')
          ..write('highlights: $highlights, ')
          ..write('challenges: $challenges, ')
          ..write('gratitude: $gratitude, ')
          ..write('intentions: $intentions, ')
          ..write('reflections: $reflections, ')
          ..write('affirmationOfDay: $affirmationOfDay, ')
          ..write('bodyAwareness: $bodyAwareness, ')
          ..write('didMeditate: $didMeditate, ')
          ..write('didVisualize: $didVisualize, ')
          ..write('didBodyScan: $didBodyScan, ')
          ..write('didAffirmations: $didAffirmations, ')
          ..write('ritualClear: $ritualClear, ')
          ..write('ritualTone: $ritualTone, ')
          ..write('ritualField: $ritualField, ')
          ..write('ritualAffirmation: $ritualAffirmation, ')
          ..write('sleepIntention: $sleepIntention, ')
          ..write('bedtimeHour: $bedtimeHour, ')
          ..write('bedtimeMinute: $bedtimeMinute, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DreamsTable extends Dreams with TableInfo<$DreamsTable, Dream> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DreamsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _rundownDateMeta =
      const VerificationMeta('rundownDate');
  @override
  late final GeneratedColumn<String> rundownDate = GeneratedColumn<String>(
      'rundown_date', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES daily_rundowns (id)'));
  static const VerificationMeta _continuationOfIdMeta =
      const VerificationMeta('continuationOfId');
  @override
  late final GeneratedColumn<int> continuationOfId = GeneratedColumn<int>(
      'continuation_of_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES dreams (id)'));
  static const VerificationMeta _continuationChainIdMeta =
      const VerificationMeta('continuationChainId');
  @override
  late final GeneratedColumn<String> continuationChainId =
      GeneratedColumn<String>('continuation_chain_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _summaryMeta =
      const VerificationMeta('summary');
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
      'summary', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dreamTypeMeta =
      const VerificationMeta('dreamType');
  @override
  late final GeneratedColumn<int> dreamType = GeneratedColumn<int>(
      'dream_type', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _clarityMeta =
      const VerificationMeta('clarity');
  @override
  late final GeneratedColumn<int> clarity = GeneratedColumn<int>(
      'clarity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(2));
  static const VerificationMeta _emotionsJsonMeta =
      const VerificationMeta('emotionsJson');
  @override
  late final GeneratedColumn<String> emotionsJson = GeneratedColumn<String>(
      'emotions_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _achievedLucidityMeta =
      const VerificationMeta('achievedLucidity');
  @override
  late final GeneratedColumn<bool> achievedLucidity = GeneratedColumn<bool>(
      'achieved_lucidity', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("achieved_lucidity" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _lucidityTriggerMeta =
      const VerificationMeta('lucidityTrigger');
  @override
  late final GeneratedColumn<String> lucidityTrigger = GeneratedColumn<String>(
      'lucidity_trigger', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lucidDurationEstimateMinutesMeta =
      const VerificationMeta('lucidDurationEstimateMinutes');
  @override
  late final GeneratedColumn<int> lucidDurationEstimateMinutes =
      GeneratedColumn<int>('lucid_duration_estimate_minutes', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _estimatedTimeMinutesMeta =
      const VerificationMeta('estimatedTimeMinutes');
  @override
  late final GeneratedColumn<int> estimatedTimeMinutes = GeneratedColumn<int>(
      'estimated_time_minutes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _significanceRatingMeta =
      const VerificationMeta('significanceRating');
  @override
  late final GeneratedColumn<int> significanceRating = GeneratedColumn<int>(
      'significance_rating', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isPrivateMeta =
      const VerificationMeta('isPrivate');
  @override
  late final GeneratedColumn<bool> isPrivate = GeneratedColumn<bool>(
      'is_private', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_private" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isArchivedMeta =
      const VerificationMeta('isArchived');
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
      'is_archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        rundownDate,
        continuationOfId,
        continuationChainId,
        title,
        description,
        summary,
        dreamType,
        clarity,
        emotionsJson,
        achievedLucidity,
        lucidityTrigger,
        lucidDurationEstimateMinutes,
        estimatedTimeMinutes,
        significanceRating,
        isPrivate,
        isArchived,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dreams';
  @override
  VerificationContext validateIntegrity(Insertable<Dream> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('rundown_date')) {
      context.handle(
          _rundownDateMeta,
          rundownDate.isAcceptableOrUnknown(
              data['rundown_date']!, _rundownDateMeta));
    }
    if (data.containsKey('continuation_of_id')) {
      context.handle(
          _continuationOfIdMeta,
          continuationOfId.isAcceptableOrUnknown(
              data['continuation_of_id']!, _continuationOfIdMeta));
    }
    if (data.containsKey('continuation_chain_id')) {
      context.handle(
          _continuationChainIdMeta,
          continuationChainId.isAcceptableOrUnknown(
              data['continuation_chain_id']!, _continuationChainIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(_summaryMeta,
          summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta));
    }
    if (data.containsKey('dream_type')) {
      context.handle(_dreamTypeMeta,
          dreamType.isAcceptableOrUnknown(data['dream_type']!, _dreamTypeMeta));
    }
    if (data.containsKey('clarity')) {
      context.handle(_clarityMeta,
          clarity.isAcceptableOrUnknown(data['clarity']!, _clarityMeta));
    }
    if (data.containsKey('emotions_json')) {
      context.handle(
          _emotionsJsonMeta,
          emotionsJson.isAcceptableOrUnknown(
              data['emotions_json']!, _emotionsJsonMeta));
    }
    if (data.containsKey('achieved_lucidity')) {
      context.handle(
          _achievedLucidityMeta,
          achievedLucidity.isAcceptableOrUnknown(
              data['achieved_lucidity']!, _achievedLucidityMeta));
    }
    if (data.containsKey('lucidity_trigger')) {
      context.handle(
          _lucidityTriggerMeta,
          lucidityTrigger.isAcceptableOrUnknown(
              data['lucidity_trigger']!, _lucidityTriggerMeta));
    }
    if (data.containsKey('lucid_duration_estimate_minutes')) {
      context.handle(
          _lucidDurationEstimateMinutesMeta,
          lucidDurationEstimateMinutes.isAcceptableOrUnknown(
              data['lucid_duration_estimate_minutes']!,
              _lucidDurationEstimateMinutesMeta));
    }
    if (data.containsKey('estimated_time_minutes')) {
      context.handle(
          _estimatedTimeMinutesMeta,
          estimatedTimeMinutes.isAcceptableOrUnknown(
              data['estimated_time_minutes']!, _estimatedTimeMinutesMeta));
    }
    if (data.containsKey('significance_rating')) {
      context.handle(
          _significanceRatingMeta,
          significanceRating.isAcceptableOrUnknown(
              data['significance_rating']!, _significanceRatingMeta));
    }
    if (data.containsKey('is_private')) {
      context.handle(_isPrivateMeta,
          isPrivate.isAcceptableOrUnknown(data['is_private']!, _isPrivateMeta));
    }
    if (data.containsKey('is_archived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['is_archived']!, _isArchivedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Dream map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Dream(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      rundownDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rundown_date']),
      continuationOfId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}continuation_of_id']),
      continuationChainId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}continuation_chain_id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      summary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summary']),
      dreamType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dream_type'])!,
      clarity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}clarity'])!,
      emotionsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}emotions_json']),
      achievedLucidity: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}achieved_lucidity'])!,
      lucidityTrigger: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}lucidity_trigger']),
      lucidDurationEstimateMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}lucid_duration_estimate_minutes']),
      estimatedTimeMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}estimated_time_minutes']),
      significanceRating: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}significance_rating']),
      isPrivate: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_private'])!,
      isArchived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_archived'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $DreamsTable createAlias(String alias) {
    return $DreamsTable(attachedDatabase, alias);
  }
}

class Dream extends DataClass implements Insertable<Dream> {
  final int id;

  /// Date the dream was recorded (morning after the dream). FK to DailyRundowns.
  final String? rundownDate;

  /// Direct parent in a continuation chain. Self-referential FK.
  final int? continuationOfId;

  /// UUID shared by all dreams in the same continuation chain.
  /// Allows fetching the full chain with a simple WHERE clause — no recursion needed.
  final String? continuationChainId;
  final String title;
  final String description;
  final String? summary;

  /// DreamType enum index. 0=normal, 1=lucid, 2=recurring, 3=nightmare,
  /// 4=prophetic, 5=visitation, 6=hypnagogic
  final int dreamType;

  /// DreamClarity enum index. 0=fragmentary, 1=partial, 2=clear, 3=vivid, 4=crystalClear
  final int clarity;

  /// JSON array of DreamEmotion indexes: "[0,4,6]".
  /// Not indexed — display-only metadata, not a query predicate.
  final String? emotionsJson;
  final bool achievedLucidity;
  final String? lucidityTrigger;
  final int? lucidDurationEstimateMinutes;

  /// Approximate time of dream within the sleep period, as minutes since midnight.
  final int? estimatedTimeMinutes;

  /// User significance rating 1-5.
  final int? significanceRating;
  final bool isPrivate;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Dream(
      {required this.id,
      this.rundownDate,
      this.continuationOfId,
      this.continuationChainId,
      required this.title,
      required this.description,
      this.summary,
      required this.dreamType,
      required this.clarity,
      this.emotionsJson,
      required this.achievedLucidity,
      this.lucidityTrigger,
      this.lucidDurationEstimateMinutes,
      this.estimatedTimeMinutes,
      this.significanceRating,
      required this.isPrivate,
      required this.isArchived,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || rundownDate != null) {
      map['rundown_date'] = Variable<String>(rundownDate);
    }
    if (!nullToAbsent || continuationOfId != null) {
      map['continuation_of_id'] = Variable<int>(continuationOfId);
    }
    if (!nullToAbsent || continuationChainId != null) {
      map['continuation_chain_id'] = Variable<String>(continuationChainId);
    }
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || summary != null) {
      map['summary'] = Variable<String>(summary);
    }
    map['dream_type'] = Variable<int>(dreamType);
    map['clarity'] = Variable<int>(clarity);
    if (!nullToAbsent || emotionsJson != null) {
      map['emotions_json'] = Variable<String>(emotionsJson);
    }
    map['achieved_lucidity'] = Variable<bool>(achievedLucidity);
    if (!nullToAbsent || lucidityTrigger != null) {
      map['lucidity_trigger'] = Variable<String>(lucidityTrigger);
    }
    if (!nullToAbsent || lucidDurationEstimateMinutes != null) {
      map['lucid_duration_estimate_minutes'] =
          Variable<int>(lucidDurationEstimateMinutes);
    }
    if (!nullToAbsent || estimatedTimeMinutes != null) {
      map['estimated_time_minutes'] = Variable<int>(estimatedTimeMinutes);
    }
    if (!nullToAbsent || significanceRating != null) {
      map['significance_rating'] = Variable<int>(significanceRating);
    }
    map['is_private'] = Variable<bool>(isPrivate);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DreamsCompanion toCompanion(bool nullToAbsent) {
    return DreamsCompanion(
      id: Value(id),
      rundownDate: rundownDate == null && nullToAbsent
          ? const Value.absent()
          : Value(rundownDate),
      continuationOfId: continuationOfId == null && nullToAbsent
          ? const Value.absent()
          : Value(continuationOfId),
      continuationChainId: continuationChainId == null && nullToAbsent
          ? const Value.absent()
          : Value(continuationChainId),
      title: Value(title),
      description: Value(description),
      summary: summary == null && nullToAbsent
          ? const Value.absent()
          : Value(summary),
      dreamType: Value(dreamType),
      clarity: Value(clarity),
      emotionsJson: emotionsJson == null && nullToAbsent
          ? const Value.absent()
          : Value(emotionsJson),
      achievedLucidity: Value(achievedLucidity),
      lucidityTrigger: lucidityTrigger == null && nullToAbsent
          ? const Value.absent()
          : Value(lucidityTrigger),
      lucidDurationEstimateMinutes:
          lucidDurationEstimateMinutes == null && nullToAbsent
              ? const Value.absent()
              : Value(lucidDurationEstimateMinutes),
      estimatedTimeMinutes: estimatedTimeMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedTimeMinutes),
      significanceRating: significanceRating == null && nullToAbsent
          ? const Value.absent()
          : Value(significanceRating),
      isPrivate: Value(isPrivate),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Dream.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Dream(
      id: serializer.fromJson<int>(json['id']),
      rundownDate: serializer.fromJson<String?>(json['rundownDate']),
      continuationOfId: serializer.fromJson<int?>(json['continuationOfId']),
      continuationChainId:
          serializer.fromJson<String?>(json['continuationChainId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      summary: serializer.fromJson<String?>(json['summary']),
      dreamType: serializer.fromJson<int>(json['dreamType']),
      clarity: serializer.fromJson<int>(json['clarity']),
      emotionsJson: serializer.fromJson<String?>(json['emotionsJson']),
      achievedLucidity: serializer.fromJson<bool>(json['achievedLucidity']),
      lucidityTrigger: serializer.fromJson<String?>(json['lucidityTrigger']),
      lucidDurationEstimateMinutes:
          serializer.fromJson<int?>(json['lucidDurationEstimateMinutes']),
      estimatedTimeMinutes:
          serializer.fromJson<int?>(json['estimatedTimeMinutes']),
      significanceRating: serializer.fromJson<int?>(json['significanceRating']),
      isPrivate: serializer.fromJson<bool>(json['isPrivate']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'rundownDate': serializer.toJson<String?>(rundownDate),
      'continuationOfId': serializer.toJson<int?>(continuationOfId),
      'continuationChainId': serializer.toJson<String?>(continuationChainId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'summary': serializer.toJson<String?>(summary),
      'dreamType': serializer.toJson<int>(dreamType),
      'clarity': serializer.toJson<int>(clarity),
      'emotionsJson': serializer.toJson<String?>(emotionsJson),
      'achievedLucidity': serializer.toJson<bool>(achievedLucidity),
      'lucidityTrigger': serializer.toJson<String?>(lucidityTrigger),
      'lucidDurationEstimateMinutes':
          serializer.toJson<int?>(lucidDurationEstimateMinutes),
      'estimatedTimeMinutes': serializer.toJson<int?>(estimatedTimeMinutes),
      'significanceRating': serializer.toJson<int?>(significanceRating),
      'isPrivate': serializer.toJson<bool>(isPrivate),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Dream copyWith(
          {int? id,
          Value<String?> rundownDate = const Value.absent(),
          Value<int?> continuationOfId = const Value.absent(),
          Value<String?> continuationChainId = const Value.absent(),
          String? title,
          String? description,
          Value<String?> summary = const Value.absent(),
          int? dreamType,
          int? clarity,
          Value<String?> emotionsJson = const Value.absent(),
          bool? achievedLucidity,
          Value<String?> lucidityTrigger = const Value.absent(),
          Value<int?> lucidDurationEstimateMinutes = const Value.absent(),
          Value<int?> estimatedTimeMinutes = const Value.absent(),
          Value<int?> significanceRating = const Value.absent(),
          bool? isPrivate,
          bool? isArchived,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Dream(
        id: id ?? this.id,
        rundownDate: rundownDate.present ? rundownDate.value : this.rundownDate,
        continuationOfId: continuationOfId.present
            ? continuationOfId.value
            : this.continuationOfId,
        continuationChainId: continuationChainId.present
            ? continuationChainId.value
            : this.continuationChainId,
        title: title ?? this.title,
        description: description ?? this.description,
        summary: summary.present ? summary.value : this.summary,
        dreamType: dreamType ?? this.dreamType,
        clarity: clarity ?? this.clarity,
        emotionsJson:
            emotionsJson.present ? emotionsJson.value : this.emotionsJson,
        achievedLucidity: achievedLucidity ?? this.achievedLucidity,
        lucidityTrigger: lucidityTrigger.present
            ? lucidityTrigger.value
            : this.lucidityTrigger,
        lucidDurationEstimateMinutes: lucidDurationEstimateMinutes.present
            ? lucidDurationEstimateMinutes.value
            : this.lucidDurationEstimateMinutes,
        estimatedTimeMinutes: estimatedTimeMinutes.present
            ? estimatedTimeMinutes.value
            : this.estimatedTimeMinutes,
        significanceRating: significanceRating.present
            ? significanceRating.value
            : this.significanceRating,
        isPrivate: isPrivate ?? this.isPrivate,
        isArchived: isArchived ?? this.isArchived,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Dream copyWithCompanion(DreamsCompanion data) {
    return Dream(
      id: data.id.present ? data.id.value : this.id,
      rundownDate:
          data.rundownDate.present ? data.rundownDate.value : this.rundownDate,
      continuationOfId: data.continuationOfId.present
          ? data.continuationOfId.value
          : this.continuationOfId,
      continuationChainId: data.continuationChainId.present
          ? data.continuationChainId.value
          : this.continuationChainId,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      summary: data.summary.present ? data.summary.value : this.summary,
      dreamType: data.dreamType.present ? data.dreamType.value : this.dreamType,
      clarity: data.clarity.present ? data.clarity.value : this.clarity,
      emotionsJson: data.emotionsJson.present
          ? data.emotionsJson.value
          : this.emotionsJson,
      achievedLucidity: data.achievedLucidity.present
          ? data.achievedLucidity.value
          : this.achievedLucidity,
      lucidityTrigger: data.lucidityTrigger.present
          ? data.lucidityTrigger.value
          : this.lucidityTrigger,
      lucidDurationEstimateMinutes: data.lucidDurationEstimateMinutes.present
          ? data.lucidDurationEstimateMinutes.value
          : this.lucidDurationEstimateMinutes,
      estimatedTimeMinutes: data.estimatedTimeMinutes.present
          ? data.estimatedTimeMinutes.value
          : this.estimatedTimeMinutes,
      significanceRating: data.significanceRating.present
          ? data.significanceRating.value
          : this.significanceRating,
      isPrivate: data.isPrivate.present ? data.isPrivate.value : this.isPrivate,
      isArchived:
          data.isArchived.present ? data.isArchived.value : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Dream(')
          ..write('id: $id, ')
          ..write('rundownDate: $rundownDate, ')
          ..write('continuationOfId: $continuationOfId, ')
          ..write('continuationChainId: $continuationChainId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('summary: $summary, ')
          ..write('dreamType: $dreamType, ')
          ..write('clarity: $clarity, ')
          ..write('emotionsJson: $emotionsJson, ')
          ..write('achievedLucidity: $achievedLucidity, ')
          ..write('lucidityTrigger: $lucidityTrigger, ')
          ..write(
              'lucidDurationEstimateMinutes: $lucidDurationEstimateMinutes, ')
          ..write('estimatedTimeMinutes: $estimatedTimeMinutes, ')
          ..write('significanceRating: $significanceRating, ')
          ..write('isPrivate: $isPrivate, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      rundownDate,
      continuationOfId,
      continuationChainId,
      title,
      description,
      summary,
      dreamType,
      clarity,
      emotionsJson,
      achievedLucidity,
      lucidityTrigger,
      lucidDurationEstimateMinutes,
      estimatedTimeMinutes,
      significanceRating,
      isPrivate,
      isArchived,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Dream &&
          other.id == this.id &&
          other.rundownDate == this.rundownDate &&
          other.continuationOfId == this.continuationOfId &&
          other.continuationChainId == this.continuationChainId &&
          other.title == this.title &&
          other.description == this.description &&
          other.summary == this.summary &&
          other.dreamType == this.dreamType &&
          other.clarity == this.clarity &&
          other.emotionsJson == this.emotionsJson &&
          other.achievedLucidity == this.achievedLucidity &&
          other.lucidityTrigger == this.lucidityTrigger &&
          other.lucidDurationEstimateMinutes ==
              this.lucidDurationEstimateMinutes &&
          other.estimatedTimeMinutes == this.estimatedTimeMinutes &&
          other.significanceRating == this.significanceRating &&
          other.isPrivate == this.isPrivate &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DreamsCompanion extends UpdateCompanion<Dream> {
  final Value<int> id;
  final Value<String?> rundownDate;
  final Value<int?> continuationOfId;
  final Value<String?> continuationChainId;
  final Value<String> title;
  final Value<String> description;
  final Value<String?> summary;
  final Value<int> dreamType;
  final Value<int> clarity;
  final Value<String?> emotionsJson;
  final Value<bool> achievedLucidity;
  final Value<String?> lucidityTrigger;
  final Value<int?> lucidDurationEstimateMinutes;
  final Value<int?> estimatedTimeMinutes;
  final Value<int?> significanceRating;
  final Value<bool> isPrivate;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DreamsCompanion({
    this.id = const Value.absent(),
    this.rundownDate = const Value.absent(),
    this.continuationOfId = const Value.absent(),
    this.continuationChainId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.summary = const Value.absent(),
    this.dreamType = const Value.absent(),
    this.clarity = const Value.absent(),
    this.emotionsJson = const Value.absent(),
    this.achievedLucidity = const Value.absent(),
    this.lucidityTrigger = const Value.absent(),
    this.lucidDurationEstimateMinutes = const Value.absent(),
    this.estimatedTimeMinutes = const Value.absent(),
    this.significanceRating = const Value.absent(),
    this.isPrivate = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DreamsCompanion.insert({
    this.id = const Value.absent(),
    this.rundownDate = const Value.absent(),
    this.continuationOfId = const Value.absent(),
    this.continuationChainId = const Value.absent(),
    required String title,
    required String description,
    this.summary = const Value.absent(),
    this.dreamType = const Value.absent(),
    this.clarity = const Value.absent(),
    this.emotionsJson = const Value.absent(),
    this.achievedLucidity = const Value.absent(),
    this.lucidityTrigger = const Value.absent(),
    this.lucidDurationEstimateMinutes = const Value.absent(),
    this.estimatedTimeMinutes = const Value.absent(),
    this.significanceRating = const Value.absent(),
    this.isPrivate = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : title = Value(title),
        description = Value(description);
  static Insertable<Dream> custom({
    Expression<int>? id,
    Expression<String>? rundownDate,
    Expression<int>? continuationOfId,
    Expression<String>? continuationChainId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? summary,
    Expression<int>? dreamType,
    Expression<int>? clarity,
    Expression<String>? emotionsJson,
    Expression<bool>? achievedLucidity,
    Expression<String>? lucidityTrigger,
    Expression<int>? lucidDurationEstimateMinutes,
    Expression<int>? estimatedTimeMinutes,
    Expression<int>? significanceRating,
    Expression<bool>? isPrivate,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rundownDate != null) 'rundown_date': rundownDate,
      if (continuationOfId != null) 'continuation_of_id': continuationOfId,
      if (continuationChainId != null)
        'continuation_chain_id': continuationChainId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (summary != null) 'summary': summary,
      if (dreamType != null) 'dream_type': dreamType,
      if (clarity != null) 'clarity': clarity,
      if (emotionsJson != null) 'emotions_json': emotionsJson,
      if (achievedLucidity != null) 'achieved_lucidity': achievedLucidity,
      if (lucidityTrigger != null) 'lucidity_trigger': lucidityTrigger,
      if (lucidDurationEstimateMinutes != null)
        'lucid_duration_estimate_minutes': lucidDurationEstimateMinutes,
      if (estimatedTimeMinutes != null)
        'estimated_time_minutes': estimatedTimeMinutes,
      if (significanceRating != null) 'significance_rating': significanceRating,
      if (isPrivate != null) 'is_private': isPrivate,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DreamsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? rundownDate,
      Value<int?>? continuationOfId,
      Value<String?>? continuationChainId,
      Value<String>? title,
      Value<String>? description,
      Value<String?>? summary,
      Value<int>? dreamType,
      Value<int>? clarity,
      Value<String?>? emotionsJson,
      Value<bool>? achievedLucidity,
      Value<String?>? lucidityTrigger,
      Value<int?>? lucidDurationEstimateMinutes,
      Value<int?>? estimatedTimeMinutes,
      Value<int?>? significanceRating,
      Value<bool>? isPrivate,
      Value<bool>? isArchived,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return DreamsCompanion(
      id: id ?? this.id,
      rundownDate: rundownDate ?? this.rundownDate,
      continuationOfId: continuationOfId ?? this.continuationOfId,
      continuationChainId: continuationChainId ?? this.continuationChainId,
      title: title ?? this.title,
      description: description ?? this.description,
      summary: summary ?? this.summary,
      dreamType: dreamType ?? this.dreamType,
      clarity: clarity ?? this.clarity,
      emotionsJson: emotionsJson ?? this.emotionsJson,
      achievedLucidity: achievedLucidity ?? this.achievedLucidity,
      lucidityTrigger: lucidityTrigger ?? this.lucidityTrigger,
      lucidDurationEstimateMinutes:
          lucidDurationEstimateMinutes ?? this.lucidDurationEstimateMinutes,
      estimatedTimeMinutes: estimatedTimeMinutes ?? this.estimatedTimeMinutes,
      significanceRating: significanceRating ?? this.significanceRating,
      isPrivate: isPrivate ?? this.isPrivate,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rundownDate.present) {
      map['rundown_date'] = Variable<String>(rundownDate.value);
    }
    if (continuationOfId.present) {
      map['continuation_of_id'] = Variable<int>(continuationOfId.value);
    }
    if (continuationChainId.present) {
      map['continuation_chain_id'] =
          Variable<String>(continuationChainId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (dreamType.present) {
      map['dream_type'] = Variable<int>(dreamType.value);
    }
    if (clarity.present) {
      map['clarity'] = Variable<int>(clarity.value);
    }
    if (emotionsJson.present) {
      map['emotions_json'] = Variable<String>(emotionsJson.value);
    }
    if (achievedLucidity.present) {
      map['achieved_lucidity'] = Variable<bool>(achievedLucidity.value);
    }
    if (lucidityTrigger.present) {
      map['lucidity_trigger'] = Variable<String>(lucidityTrigger.value);
    }
    if (lucidDurationEstimateMinutes.present) {
      map['lucid_duration_estimate_minutes'] =
          Variable<int>(lucidDurationEstimateMinutes.value);
    }
    if (estimatedTimeMinutes.present) {
      map['estimated_time_minutes'] = Variable<int>(estimatedTimeMinutes.value);
    }
    if (significanceRating.present) {
      map['significance_rating'] = Variable<int>(significanceRating.value);
    }
    if (isPrivate.present) {
      map['is_private'] = Variable<bool>(isPrivate.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DreamsCompanion(')
          ..write('id: $id, ')
          ..write('rundownDate: $rundownDate, ')
          ..write('continuationOfId: $continuationOfId, ')
          ..write('continuationChainId: $continuationChainId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('summary: $summary, ')
          ..write('dreamType: $dreamType, ')
          ..write('clarity: $clarity, ')
          ..write('emotionsJson: $emotionsJson, ')
          ..write('achievedLucidity: $achievedLucidity, ')
          ..write('lucidityTrigger: $lucidityTrigger, ')
          ..write(
              'lucidDurationEstimateMinutes: $lucidDurationEstimateMinutes, ')
          ..write('estimatedTimeMinutes: $estimatedTimeMinutes, ')
          ..write('significanceRating: $significanceRating, ')
          ..write('isPrivate: $isPrivate, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DreamCharactersTable extends DreamCharacters
    with TableInfo<$DreamCharactersTable, DreamCharacter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DreamCharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isRealPersonMeta =
      const VerificationMeta('isRealPerson');
  @override
  late final GeneratedColumn<bool> isRealPerson = GeneratedColumn<bool>(
      'is_real_person', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_real_person" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _archetypeTagMeta =
      const VerificationMeta('archetypeTag');
  @override
  late final GeneratedColumn<String> archetypeTag = GeneratedColumn<String>(
      'archetype_tag', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _avatarPathMeta =
      const VerificationMeta('avatarPath');
  @override
  late final GeneratedColumn<String> avatarPath = GeneratedColumn<String>(
      'avatar_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isArchivedMeta =
      const VerificationMeta('isArchived');
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
      'is_archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        isRealPerson,
        archetypeTag,
        avatarPath,
        isArchived,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dream_characters';
  @override
  VerificationContext validateIntegrity(Insertable<DreamCharacter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('is_real_person')) {
      context.handle(
          _isRealPersonMeta,
          isRealPerson.isAcceptableOrUnknown(
              data['is_real_person']!, _isRealPersonMeta));
    }
    if (data.containsKey('archetype_tag')) {
      context.handle(
          _archetypeTagMeta,
          archetypeTag.isAcceptableOrUnknown(
              data['archetype_tag']!, _archetypeTagMeta));
    }
    if (data.containsKey('avatar_path')) {
      context.handle(
          _avatarPathMeta,
          avatarPath.isAcceptableOrUnknown(
              data['avatar_path']!, _avatarPathMeta));
    }
    if (data.containsKey('is_archived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['is_archived']!, _isArchivedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DreamCharacter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DreamCharacter(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      isRealPerson: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_real_person'])!,
      archetypeTag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}archetype_tag']),
      avatarPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}avatar_path']),
      isArchived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_archived'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $DreamCharactersTable createAlias(String alias) {
    return $DreamCharactersTable(attachedDatabase, alias);
  }
}

class DreamCharacter extends DataClass implements Insertable<DreamCharacter> {
  final int id;
  final String name;
  final String? description;
  final bool isRealPerson;

  /// Jungian or other archetypal role tag (e.g. "Mentor", "Shadow", "Trickster").
  final String? archetypeTag;

  /// Local file path to an avatar/photo.
  final String? avatarPath;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DreamCharacter(
      {required this.id,
      required this.name,
      this.description,
      required this.isRealPerson,
      this.archetypeTag,
      this.avatarPath,
      required this.isArchived,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_real_person'] = Variable<bool>(isRealPerson);
    if (!nullToAbsent || archetypeTag != null) {
      map['archetype_tag'] = Variable<String>(archetypeTag);
    }
    if (!nullToAbsent || avatarPath != null) {
      map['avatar_path'] = Variable<String>(avatarPath);
    }
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DreamCharactersCompanion toCompanion(bool nullToAbsent) {
    return DreamCharactersCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isRealPerson: Value(isRealPerson),
      archetypeTag: archetypeTag == null && nullToAbsent
          ? const Value.absent()
          : Value(archetypeTag),
      avatarPath: avatarPath == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarPath),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DreamCharacter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DreamCharacter(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      isRealPerson: serializer.fromJson<bool>(json['isRealPerson']),
      archetypeTag: serializer.fromJson<String?>(json['archetypeTag']),
      avatarPath: serializer.fromJson<String?>(json['avatarPath']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'isRealPerson': serializer.toJson<bool>(isRealPerson),
      'archetypeTag': serializer.toJson<String?>(archetypeTag),
      'avatarPath': serializer.toJson<String?>(avatarPath),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DreamCharacter copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          bool? isRealPerson,
          Value<String?> archetypeTag = const Value.absent(),
          Value<String?> avatarPath = const Value.absent(),
          bool? isArchived,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      DreamCharacter(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        isRealPerson: isRealPerson ?? this.isRealPerson,
        archetypeTag:
            archetypeTag.present ? archetypeTag.value : this.archetypeTag,
        avatarPath: avatarPath.present ? avatarPath.value : this.avatarPath,
        isArchived: isArchived ?? this.isArchived,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  DreamCharacter copyWithCompanion(DreamCharactersCompanion data) {
    return DreamCharacter(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      isRealPerson: data.isRealPerson.present
          ? data.isRealPerson.value
          : this.isRealPerson,
      archetypeTag: data.archetypeTag.present
          ? data.archetypeTag.value
          : this.archetypeTag,
      avatarPath:
          data.avatarPath.present ? data.avatarPath.value : this.avatarPath,
      isArchived:
          data.isArchived.present ? data.isArchived.value : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DreamCharacter(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isRealPerson: $isRealPerson, ')
          ..write('archetypeTag: $archetypeTag, ')
          ..write('avatarPath: $avatarPath, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, isRealPerson,
      archetypeTag, avatarPath, isArchived, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DreamCharacter &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.isRealPerson == this.isRealPerson &&
          other.archetypeTag == this.archetypeTag &&
          other.avatarPath == this.avatarPath &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DreamCharactersCompanion extends UpdateCompanion<DreamCharacter> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<bool> isRealPerson;
  final Value<String?> archetypeTag;
  final Value<String?> avatarPath;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DreamCharactersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isRealPerson = const Value.absent(),
    this.archetypeTag = const Value.absent(),
    this.avatarPath = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DreamCharactersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.isRealPerson = const Value.absent(),
    this.archetypeTag = const Value.absent(),
    this.avatarPath = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<DreamCharacter> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isRealPerson,
    Expression<String>? archetypeTag,
    Expression<String>? avatarPath,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isRealPerson != null) 'is_real_person': isRealPerson,
      if (archetypeTag != null) 'archetype_tag': archetypeTag,
      if (avatarPath != null) 'avatar_path': avatarPath,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DreamCharactersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<bool>? isRealPerson,
      Value<String?>? archetypeTag,
      Value<String?>? avatarPath,
      Value<bool>? isArchived,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return DreamCharactersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isRealPerson: isRealPerson ?? this.isRealPerson,
      archetypeTag: archetypeTag ?? this.archetypeTag,
      avatarPath: avatarPath ?? this.avatarPath,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isRealPerson.present) {
      map['is_real_person'] = Variable<bool>(isRealPerson.value);
    }
    if (archetypeTag.present) {
      map['archetype_tag'] = Variable<String>(archetypeTag.value);
    }
    if (avatarPath.present) {
      map['avatar_path'] = Variable<String>(avatarPath.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DreamCharactersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isRealPerson: $isRealPerson, ')
          ..write('archetypeTag: $archetypeTag, ')
          ..write('avatarPath: $avatarPath, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DreamPlacesTable extends DreamPlaces
    with TableInfo<$DreamPlacesTable, DreamPlace> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DreamPlacesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isRealWorldMeta =
      const VerificationMeta('isRealWorld');
  @override
  late final GeneratedColumn<bool> isRealWorld = GeneratedColumn<bool>(
      'is_real_world', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_real_world" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _atmosphereMeta =
      const VerificationMeta('atmosphere');
  @override
  late final GeneratedColumn<String> atmosphere = GeneratedColumn<String>(
      'atmosphere', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isArchivedMeta =
      const VerificationMeta('isArchived');
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
      'is_archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        category,
        isRealWorld,
        atmosphere,
        isArchived,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dream_places';
  @override
  VerificationContext validateIntegrity(Insertable<DreamPlace> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('is_real_world')) {
      context.handle(
          _isRealWorldMeta,
          isRealWorld.isAcceptableOrUnknown(
              data['is_real_world']!, _isRealWorldMeta));
    }
    if (data.containsKey('atmosphere')) {
      context.handle(
          _atmosphereMeta,
          atmosphere.isAcceptableOrUnknown(
              data['atmosphere']!, _atmosphereMeta));
    }
    if (data.containsKey('is_archived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['is_archived']!, _isArchivedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DreamPlace map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DreamPlace(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      isRealWorld: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_real_world'])!,
      atmosphere: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}atmosphere']),
      isArchived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_archived'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $DreamPlacesTable createAlias(String alias) {
    return $DreamPlacesTable(attachedDatabase, alias);
  }
}

class DreamPlace extends DataClass implements Insertable<DreamPlace> {
  final int id;
  final String name;
  final String? description;

  /// Broad category: "Home", "School", "Outdoor", "Unknown", "Fantastical".
  final String? category;
  final bool isRealWorld;

  /// Feeling/atmosphere associated with this place.
  final String? atmosphere;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DreamPlace(
      {required this.id,
      required this.name,
      this.description,
      this.category,
      required this.isRealWorld,
      this.atmosphere,
      required this.isArchived,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    map['is_real_world'] = Variable<bool>(isRealWorld);
    if (!nullToAbsent || atmosphere != null) {
      map['atmosphere'] = Variable<String>(atmosphere);
    }
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DreamPlacesCompanion toCompanion(bool nullToAbsent) {
    return DreamPlacesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      isRealWorld: Value(isRealWorld),
      atmosphere: atmosphere == null && nullToAbsent
          ? const Value.absent()
          : Value(atmosphere),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DreamPlace.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DreamPlace(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      category: serializer.fromJson<String?>(json['category']),
      isRealWorld: serializer.fromJson<bool>(json['isRealWorld']),
      atmosphere: serializer.fromJson<String?>(json['atmosphere']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'category': serializer.toJson<String?>(category),
      'isRealWorld': serializer.toJson<bool>(isRealWorld),
      'atmosphere': serializer.toJson<String?>(atmosphere),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DreamPlace copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> category = const Value.absent(),
          bool? isRealWorld,
          Value<String?> atmosphere = const Value.absent(),
          bool? isArchived,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      DreamPlace(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        category: category.present ? category.value : this.category,
        isRealWorld: isRealWorld ?? this.isRealWorld,
        atmosphere: atmosphere.present ? atmosphere.value : this.atmosphere,
        isArchived: isArchived ?? this.isArchived,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  DreamPlace copyWithCompanion(DreamPlacesCompanion data) {
    return DreamPlace(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      category: data.category.present ? data.category.value : this.category,
      isRealWorld:
          data.isRealWorld.present ? data.isRealWorld.value : this.isRealWorld,
      atmosphere:
          data.atmosphere.present ? data.atmosphere.value : this.atmosphere,
      isArchived:
          data.isArchived.present ? data.isArchived.value : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DreamPlace(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('isRealWorld: $isRealWorld, ')
          ..write('atmosphere: $atmosphere, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, category, isRealWorld,
      atmosphere, isArchived, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DreamPlace &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.category == this.category &&
          other.isRealWorld == this.isRealWorld &&
          other.atmosphere == this.atmosphere &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DreamPlacesCompanion extends UpdateCompanion<DreamPlace> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> category;
  final Value<bool> isRealWorld;
  final Value<String?> atmosphere;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DreamPlacesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.isRealWorld = const Value.absent(),
    this.atmosphere = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DreamPlacesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.isRealWorld = const Value.absent(),
    this.atmosphere = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<DreamPlace> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? category,
    Expression<bool>? isRealWorld,
    Expression<String>? atmosphere,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (isRealWorld != null) 'is_real_world': isRealWorld,
      if (atmosphere != null) 'atmosphere': atmosphere,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DreamPlacesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? category,
      Value<bool>? isRealWorld,
      Value<String?>? atmosphere,
      Value<bool>? isArchived,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return DreamPlacesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      isRealWorld: isRealWorld ?? this.isRealWorld,
      atmosphere: atmosphere ?? this.atmosphere,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (isRealWorld.present) {
      map['is_real_world'] = Variable<bool>(isRealWorld.value);
    }
    if (atmosphere.present) {
      map['atmosphere'] = Variable<String>(atmosphere.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DreamPlacesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('isRealWorld: $isRealWorld, ')
          ..write('atmosphere: $atmosphere, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DreamTagsTable extends DreamTags
    with TableInfo<$DreamTagsTable, DreamTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DreamTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 7, maxTextLength: 7),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, color, category, notes, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dream_tags';
  @override
  VerificationContext validateIntegrity(Insertable<DreamTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DreamTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DreamTag(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $DreamTagsTable createAlias(String alias) {
    return $DreamTagsTable(attachedDatabase, alias);
  }
}

class DreamTag extends DataClass implements Insertable<DreamTag> {
  final int id;
  final String name;

  /// Hex color code '#RRGGBB' for visual display.
  final String color;

  /// Broad grouping: "symbol", "theme", "emotion", "archetype", "element".
  final String? category;

  /// User's personal interpretation or meaning notes.
  final String? notes;
  final DateTime createdAt;
  const DreamTag(
      {required this.id,
      required this.name,
      required this.color,
      this.category,
      this.notes,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<String>(color);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DreamTagsCompanion toCompanion(bool nullToAbsent) {
    return DreamTagsCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory DreamTag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DreamTag(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String>(json['color']),
      category: serializer.fromJson<String?>(json['category']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String>(color),
      'category': serializer.toJson<String?>(category),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DreamTag copyWith(
          {int? id,
          String? name,
          String? color,
          Value<String?> category = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt}) =>
      DreamTag(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        category: category.present ? category.value : this.category,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
      );
  DreamTag copyWithCompanion(DreamTagsCompanion data) {
    return DreamTag(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      category: data.category.present ? data.category.value : this.category,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DreamTag(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('category: $category, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color, category, notes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DreamTag &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.category == this.category &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class DreamTagsCompanion extends UpdateCompanion<DreamTag> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> color;
  final Value<String?> category;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  const DreamTagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.category = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DreamTagsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String color,
    this.category = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : name = Value(name),
        color = Value(color);
  static Insertable<DreamTag> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<String>? category,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (category != null) 'category': category,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DreamTagsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? color,
      Value<String?>? category,
      Value<String?>? notes,
      Value<DateTime>? createdAt}) {
    return DreamTagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      category: category ?? this.category,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DreamTagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('category: $category, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DreamCharacterLinksTable extends DreamCharacterLinks
    with TableInfo<$DreamCharacterLinksTable, DreamCharacterLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DreamCharacterLinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dreamIdMeta =
      const VerificationMeta('dreamId');
  @override
  late final GeneratedColumn<int> dreamId = GeneratedColumn<int>(
      'dream_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES dreams (id)'));
  static const VerificationMeta _characterIdMeta =
      const VerificationMeta('characterId');
  @override
  late final GeneratedColumn<int> characterId = GeneratedColumn<int>(
      'character_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES dream_characters (id)'));
  static const VerificationMeta _roleInDreamMeta =
      const VerificationMeta('roleInDream');
  @override
  late final GeneratedColumn<String> roleInDream = GeneratedColumn<String>(
      'role_in_dream', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _appearanceNotesMeta =
      const VerificationMeta('appearanceNotes');
  @override
  late final GeneratedColumn<String> appearanceNotes = GeneratedColumn<String>(
      'appearance_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [dreamId, characterId, roleInDream, appearanceNotes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dream_character_links';
  @override
  VerificationContext validateIntegrity(Insertable<DreamCharacterLink> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('dream_id')) {
      context.handle(_dreamIdMeta,
          dreamId.isAcceptableOrUnknown(data['dream_id']!, _dreamIdMeta));
    } else if (isInserting) {
      context.missing(_dreamIdMeta);
    }
    if (data.containsKey('character_id')) {
      context.handle(
          _characterIdMeta,
          characterId.isAcceptableOrUnknown(
              data['character_id']!, _characterIdMeta));
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('role_in_dream')) {
      context.handle(
          _roleInDreamMeta,
          roleInDream.isAcceptableOrUnknown(
              data['role_in_dream']!, _roleInDreamMeta));
    }
    if (data.containsKey('appearance_notes')) {
      context.handle(
          _appearanceNotesMeta,
          appearanceNotes.isAcceptableOrUnknown(
              data['appearance_notes']!, _appearanceNotesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {dreamId, characterId};
  @override
  DreamCharacterLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DreamCharacterLink(
      dreamId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dream_id'])!,
      characterId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}character_id'])!,
      roleInDream: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role_in_dream']),
      appearanceNotes: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}appearance_notes']),
    );
  }

  @override
  $DreamCharacterLinksTable createAlias(String alias) {
    return $DreamCharacterLinksTable(attachedDatabase, alias);
  }
}

class DreamCharacterLink extends DataClass
    implements Insertable<DreamCharacterLink> {
  final int dreamId;
  final int characterId;

  /// Role this character plays in this specific dream instance.
  final String? roleInDream;
  final String? appearanceNotes;
  const DreamCharacterLink(
      {required this.dreamId,
      required this.characterId,
      this.roleInDream,
      this.appearanceNotes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['dream_id'] = Variable<int>(dreamId);
    map['character_id'] = Variable<int>(characterId);
    if (!nullToAbsent || roleInDream != null) {
      map['role_in_dream'] = Variable<String>(roleInDream);
    }
    if (!nullToAbsent || appearanceNotes != null) {
      map['appearance_notes'] = Variable<String>(appearanceNotes);
    }
    return map;
  }

  DreamCharacterLinksCompanion toCompanion(bool nullToAbsent) {
    return DreamCharacterLinksCompanion(
      dreamId: Value(dreamId),
      characterId: Value(characterId),
      roleInDream: roleInDream == null && nullToAbsent
          ? const Value.absent()
          : Value(roleInDream),
      appearanceNotes: appearanceNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(appearanceNotes),
    );
  }

  factory DreamCharacterLink.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DreamCharacterLink(
      dreamId: serializer.fromJson<int>(json['dreamId']),
      characterId: serializer.fromJson<int>(json['characterId']),
      roleInDream: serializer.fromJson<String?>(json['roleInDream']),
      appearanceNotes: serializer.fromJson<String?>(json['appearanceNotes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dreamId': serializer.toJson<int>(dreamId),
      'characterId': serializer.toJson<int>(characterId),
      'roleInDream': serializer.toJson<String?>(roleInDream),
      'appearanceNotes': serializer.toJson<String?>(appearanceNotes),
    };
  }

  DreamCharacterLink copyWith(
          {int? dreamId,
          int? characterId,
          Value<String?> roleInDream = const Value.absent(),
          Value<String?> appearanceNotes = const Value.absent()}) =>
      DreamCharacterLink(
        dreamId: dreamId ?? this.dreamId,
        characterId: characterId ?? this.characterId,
        roleInDream: roleInDream.present ? roleInDream.value : this.roleInDream,
        appearanceNotes: appearanceNotes.present
            ? appearanceNotes.value
            : this.appearanceNotes,
      );
  DreamCharacterLink copyWithCompanion(DreamCharacterLinksCompanion data) {
    return DreamCharacterLink(
      dreamId: data.dreamId.present ? data.dreamId.value : this.dreamId,
      characterId:
          data.characterId.present ? data.characterId.value : this.characterId,
      roleInDream:
          data.roleInDream.present ? data.roleInDream.value : this.roleInDream,
      appearanceNotes: data.appearanceNotes.present
          ? data.appearanceNotes.value
          : this.appearanceNotes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DreamCharacterLink(')
          ..write('dreamId: $dreamId, ')
          ..write('characterId: $characterId, ')
          ..write('roleInDream: $roleInDream, ')
          ..write('appearanceNotes: $appearanceNotes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(dreamId, characterId, roleInDream, appearanceNotes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DreamCharacterLink &&
          other.dreamId == this.dreamId &&
          other.characterId == this.characterId &&
          other.roleInDream == this.roleInDream &&
          other.appearanceNotes == this.appearanceNotes);
}

class DreamCharacterLinksCompanion extends UpdateCompanion<DreamCharacterLink> {
  final Value<int> dreamId;
  final Value<int> characterId;
  final Value<String?> roleInDream;
  final Value<String?> appearanceNotes;
  final Value<int> rowid;
  const DreamCharacterLinksCompanion({
    this.dreamId = const Value.absent(),
    this.characterId = const Value.absent(),
    this.roleInDream = const Value.absent(),
    this.appearanceNotes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DreamCharacterLinksCompanion.insert({
    required int dreamId,
    required int characterId,
    this.roleInDream = const Value.absent(),
    this.appearanceNotes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : dreamId = Value(dreamId),
        characterId = Value(characterId);
  static Insertable<DreamCharacterLink> custom({
    Expression<int>? dreamId,
    Expression<int>? characterId,
    Expression<String>? roleInDream,
    Expression<String>? appearanceNotes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dreamId != null) 'dream_id': dreamId,
      if (characterId != null) 'character_id': characterId,
      if (roleInDream != null) 'role_in_dream': roleInDream,
      if (appearanceNotes != null) 'appearance_notes': appearanceNotes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DreamCharacterLinksCompanion copyWith(
      {Value<int>? dreamId,
      Value<int>? characterId,
      Value<String?>? roleInDream,
      Value<String?>? appearanceNotes,
      Value<int>? rowid}) {
    return DreamCharacterLinksCompanion(
      dreamId: dreamId ?? this.dreamId,
      characterId: characterId ?? this.characterId,
      roleInDream: roleInDream ?? this.roleInDream,
      appearanceNotes: appearanceNotes ?? this.appearanceNotes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dreamId.present) {
      map['dream_id'] = Variable<int>(dreamId.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<int>(characterId.value);
    }
    if (roleInDream.present) {
      map['role_in_dream'] = Variable<String>(roleInDream.value);
    }
    if (appearanceNotes.present) {
      map['appearance_notes'] = Variable<String>(appearanceNotes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DreamCharacterLinksCompanion(')
          ..write('dreamId: $dreamId, ')
          ..write('characterId: $characterId, ')
          ..write('roleInDream: $roleInDream, ')
          ..write('appearanceNotes: $appearanceNotes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DreamPlaceLinksTable extends DreamPlaceLinks
    with TableInfo<$DreamPlaceLinksTable, DreamPlaceLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DreamPlaceLinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dreamIdMeta =
      const VerificationMeta('dreamId');
  @override
  late final GeneratedColumn<int> dreamId = GeneratedColumn<int>(
      'dream_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES dreams (id)'));
  static const VerificationMeta _placeIdMeta =
      const VerificationMeta('placeId');
  @override
  late final GeneratedColumn<int> placeId = GeneratedColumn<int>(
      'place_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES dream_places (id)'));
  static const VerificationMeta _isPrimaryMeta =
      const VerificationMeta('isPrimary');
  @override
  late final GeneratedColumn<bool> isPrimary = GeneratedColumn<bool>(
      'is_primary', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_primary" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _appearanceNotesMeta =
      const VerificationMeta('appearanceNotes');
  @override
  late final GeneratedColumn<String> appearanceNotes = GeneratedColumn<String>(
      'appearance_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [dreamId, placeId, isPrimary, appearanceNotes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dream_place_links';
  @override
  VerificationContext validateIntegrity(Insertable<DreamPlaceLink> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('dream_id')) {
      context.handle(_dreamIdMeta,
          dreamId.isAcceptableOrUnknown(data['dream_id']!, _dreamIdMeta));
    } else if (isInserting) {
      context.missing(_dreamIdMeta);
    }
    if (data.containsKey('place_id')) {
      context.handle(_placeIdMeta,
          placeId.isAcceptableOrUnknown(data['place_id']!, _placeIdMeta));
    } else if (isInserting) {
      context.missing(_placeIdMeta);
    }
    if (data.containsKey('is_primary')) {
      context.handle(_isPrimaryMeta,
          isPrimary.isAcceptableOrUnknown(data['is_primary']!, _isPrimaryMeta));
    }
    if (data.containsKey('appearance_notes')) {
      context.handle(
          _appearanceNotesMeta,
          appearanceNotes.isAcceptableOrUnknown(
              data['appearance_notes']!, _appearanceNotesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {dreamId, placeId};
  @override
  DreamPlaceLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DreamPlaceLink(
      dreamId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dream_id'])!,
      placeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}place_id'])!,
      isPrimary: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_primary'])!,
      appearanceNotes: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}appearance_notes']),
    );
  }

  @override
  $DreamPlaceLinksTable createAlias(String alias) {
    return $DreamPlaceLinksTable(attachedDatabase, alias);
  }
}

class DreamPlaceLink extends DataClass implements Insertable<DreamPlaceLink> {
  final int dreamId;
  final int placeId;

  /// Whether this was the primary setting of the dream.
  final bool isPrimary;
  final String? appearanceNotes;
  const DreamPlaceLink(
      {required this.dreamId,
      required this.placeId,
      required this.isPrimary,
      this.appearanceNotes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['dream_id'] = Variable<int>(dreamId);
    map['place_id'] = Variable<int>(placeId);
    map['is_primary'] = Variable<bool>(isPrimary);
    if (!nullToAbsent || appearanceNotes != null) {
      map['appearance_notes'] = Variable<String>(appearanceNotes);
    }
    return map;
  }

  DreamPlaceLinksCompanion toCompanion(bool nullToAbsent) {
    return DreamPlaceLinksCompanion(
      dreamId: Value(dreamId),
      placeId: Value(placeId),
      isPrimary: Value(isPrimary),
      appearanceNotes: appearanceNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(appearanceNotes),
    );
  }

  factory DreamPlaceLink.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DreamPlaceLink(
      dreamId: serializer.fromJson<int>(json['dreamId']),
      placeId: serializer.fromJson<int>(json['placeId']),
      isPrimary: serializer.fromJson<bool>(json['isPrimary']),
      appearanceNotes: serializer.fromJson<String?>(json['appearanceNotes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dreamId': serializer.toJson<int>(dreamId),
      'placeId': serializer.toJson<int>(placeId),
      'isPrimary': serializer.toJson<bool>(isPrimary),
      'appearanceNotes': serializer.toJson<String?>(appearanceNotes),
    };
  }

  DreamPlaceLink copyWith(
          {int? dreamId,
          int? placeId,
          bool? isPrimary,
          Value<String?> appearanceNotes = const Value.absent()}) =>
      DreamPlaceLink(
        dreamId: dreamId ?? this.dreamId,
        placeId: placeId ?? this.placeId,
        isPrimary: isPrimary ?? this.isPrimary,
        appearanceNotes: appearanceNotes.present
            ? appearanceNotes.value
            : this.appearanceNotes,
      );
  DreamPlaceLink copyWithCompanion(DreamPlaceLinksCompanion data) {
    return DreamPlaceLink(
      dreamId: data.dreamId.present ? data.dreamId.value : this.dreamId,
      placeId: data.placeId.present ? data.placeId.value : this.placeId,
      isPrimary: data.isPrimary.present ? data.isPrimary.value : this.isPrimary,
      appearanceNotes: data.appearanceNotes.present
          ? data.appearanceNotes.value
          : this.appearanceNotes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DreamPlaceLink(')
          ..write('dreamId: $dreamId, ')
          ..write('placeId: $placeId, ')
          ..write('isPrimary: $isPrimary, ')
          ..write('appearanceNotes: $appearanceNotes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(dreamId, placeId, isPrimary, appearanceNotes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DreamPlaceLink &&
          other.dreamId == this.dreamId &&
          other.placeId == this.placeId &&
          other.isPrimary == this.isPrimary &&
          other.appearanceNotes == this.appearanceNotes);
}

class DreamPlaceLinksCompanion extends UpdateCompanion<DreamPlaceLink> {
  final Value<int> dreamId;
  final Value<int> placeId;
  final Value<bool> isPrimary;
  final Value<String?> appearanceNotes;
  final Value<int> rowid;
  const DreamPlaceLinksCompanion({
    this.dreamId = const Value.absent(),
    this.placeId = const Value.absent(),
    this.isPrimary = const Value.absent(),
    this.appearanceNotes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DreamPlaceLinksCompanion.insert({
    required int dreamId,
    required int placeId,
    this.isPrimary = const Value.absent(),
    this.appearanceNotes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : dreamId = Value(dreamId),
        placeId = Value(placeId);
  static Insertable<DreamPlaceLink> custom({
    Expression<int>? dreamId,
    Expression<int>? placeId,
    Expression<bool>? isPrimary,
    Expression<String>? appearanceNotes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dreamId != null) 'dream_id': dreamId,
      if (placeId != null) 'place_id': placeId,
      if (isPrimary != null) 'is_primary': isPrimary,
      if (appearanceNotes != null) 'appearance_notes': appearanceNotes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DreamPlaceLinksCompanion copyWith(
      {Value<int>? dreamId,
      Value<int>? placeId,
      Value<bool>? isPrimary,
      Value<String?>? appearanceNotes,
      Value<int>? rowid}) {
    return DreamPlaceLinksCompanion(
      dreamId: dreamId ?? this.dreamId,
      placeId: placeId ?? this.placeId,
      isPrimary: isPrimary ?? this.isPrimary,
      appearanceNotes: appearanceNotes ?? this.appearanceNotes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dreamId.present) {
      map['dream_id'] = Variable<int>(dreamId.value);
    }
    if (placeId.present) {
      map['place_id'] = Variable<int>(placeId.value);
    }
    if (isPrimary.present) {
      map['is_primary'] = Variable<bool>(isPrimary.value);
    }
    if (appearanceNotes.present) {
      map['appearance_notes'] = Variable<String>(appearanceNotes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DreamPlaceLinksCompanion(')
          ..write('dreamId: $dreamId, ')
          ..write('placeId: $placeId, ')
          ..write('isPrimary: $isPrimary, ')
          ..write('appearanceNotes: $appearanceNotes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DreamTagLinksTable extends DreamTagLinks
    with TableInfo<$DreamTagLinksTable, DreamTagLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DreamTagLinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dreamIdMeta =
      const VerificationMeta('dreamId');
  @override
  late final GeneratedColumn<int> dreamId = GeneratedColumn<int>(
      'dream_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES dreams (id)'));
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
      'tag_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES dream_tags (id)'));
  @override
  List<GeneratedColumn> get $columns => [dreamId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dream_tag_links';
  @override
  VerificationContext validateIntegrity(Insertable<DreamTagLink> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('dream_id')) {
      context.handle(_dreamIdMeta,
          dreamId.isAcceptableOrUnknown(data['dream_id']!, _dreamIdMeta));
    } else if (isInserting) {
      context.missing(_dreamIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {dreamId, tagId};
  @override
  DreamTagLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DreamTagLink(
      dreamId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dream_id'])!,
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag_id'])!,
    );
  }

  @override
  $DreamTagLinksTable createAlias(String alias) {
    return $DreamTagLinksTable(attachedDatabase, alias);
  }
}

class DreamTagLink extends DataClass implements Insertable<DreamTagLink> {
  final int dreamId;
  final int tagId;
  const DreamTagLink({required this.dreamId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['dream_id'] = Variable<int>(dreamId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  DreamTagLinksCompanion toCompanion(bool nullToAbsent) {
    return DreamTagLinksCompanion(
      dreamId: Value(dreamId),
      tagId: Value(tagId),
    );
  }

  factory DreamTagLink.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DreamTagLink(
      dreamId: serializer.fromJson<int>(json['dreamId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dreamId': serializer.toJson<int>(dreamId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  DreamTagLink copyWith({int? dreamId, int? tagId}) => DreamTagLink(
        dreamId: dreamId ?? this.dreamId,
        tagId: tagId ?? this.tagId,
      );
  DreamTagLink copyWithCompanion(DreamTagLinksCompanion data) {
    return DreamTagLink(
      dreamId: data.dreamId.present ? data.dreamId.value : this.dreamId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DreamTagLink(')
          ..write('dreamId: $dreamId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(dreamId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DreamTagLink &&
          other.dreamId == this.dreamId &&
          other.tagId == this.tagId);
}

class DreamTagLinksCompanion extends UpdateCompanion<DreamTagLink> {
  final Value<int> dreamId;
  final Value<int> tagId;
  final Value<int> rowid;
  const DreamTagLinksCompanion({
    this.dreamId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DreamTagLinksCompanion.insert({
    required int dreamId,
    required int tagId,
    this.rowid = const Value.absent(),
  })  : dreamId = Value(dreamId),
        tagId = Value(tagId);
  static Insertable<DreamTagLink> custom({
    Expression<int>? dreamId,
    Expression<int>? tagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dreamId != null) 'dream_id': dreamId,
      if (tagId != null) 'tag_id': tagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DreamTagLinksCompanion copyWith(
      {Value<int>? dreamId, Value<int>? tagId, Value<int>? rowid}) {
    return DreamTagLinksCompanion(
      dreamId: dreamId ?? this.dreamId,
      tagId: tagId ?? this.tagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dreamId.present) {
      map['dream_id'] = Variable<int>(dreamId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DreamTagLinksCompanion(')
          ..write('dreamId: $dreamId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ContentItemsTable extends ContentItems
    with TableInfo<$ContentItemsTable, ContentItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContentItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _contentTypeMeta =
      const VerificationMeta('contentType');
  @override
  late final GeneratedColumn<int> contentType = GeneratedColumn<int>(
      'content_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _excerptMeta =
      const VerificationMeta('excerpt');
  @override
  late final GeneratedColumn<String> excerpt = GeneratedColumn<String>(
      'excerpt', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _difficultyMeta =
      const VerificationMeta('difficulty');
  @override
  late final GeneratedColumn<int> difficulty = GeneratedColumn<int>(
      'difficulty', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _estimatedDurationMinutesMeta =
      const VerificationMeta('estimatedDurationMinutes');
  @override
  late final GeneratedColumn<int> estimatedDurationMinutes =
      GeneratedColumn<int>('estimated_duration_minutes', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isBuiltInMeta =
      const VerificationMeta('isBuiltIn');
  @override
  late final GeneratedColumn<bool> isBuiltIn = GeneratedColumn<bool>(
      'is_built_in', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_built_in" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isFavoritedMeta =
      const VerificationMeta('isFavorited');
  @override
  late final GeneratedColumn<bool> isFavorited = GeneratedColumn<bool>(
      'is_favorited', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_favorited" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _bestPracticeContextMeta =
      const VerificationMeta('bestPracticeContext');
  @override
  late final GeneratedColumn<String> bestPracticeContext =
      GeneratedColumn<String>('best_practice_context', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tagsRawMeta =
      const VerificationMeta('tagsRaw');
  @override
  late final GeneratedColumn<String> tagsRaw = GeneratedColumn<String>(
      'tags_raw', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceAttributionMeta =
      const VerificationMeta('sourceAttribution');
  @override
  late final GeneratedColumn<String> sourceAttribution =
      GeneratedColumn<String>('source_attribution', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isArchivedMeta =
      const VerificationMeta('isArchived');
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
      'is_archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        contentType,
        title,
        body,
        excerpt,
        difficulty,
        estimatedDurationMinutes,
        isBuiltIn,
        isFavorited,
        bestPracticeContext,
        tagsRaw,
        sourceAttribution,
        sortOrder,
        isArchived,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'content_items';
  @override
  VerificationContext validateIntegrity(Insertable<ContentItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content_type')) {
      context.handle(
          _contentTypeMeta,
          contentType.isAcceptableOrUnknown(
              data['content_type']!, _contentTypeMeta));
    } else if (isInserting) {
      context.missing(_contentTypeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('excerpt')) {
      context.handle(_excerptMeta,
          excerpt.isAcceptableOrUnknown(data['excerpt']!, _excerptMeta));
    }
    if (data.containsKey('difficulty')) {
      context.handle(
          _difficultyMeta,
          difficulty.isAcceptableOrUnknown(
              data['difficulty']!, _difficultyMeta));
    }
    if (data.containsKey('estimated_duration_minutes')) {
      context.handle(
          _estimatedDurationMinutesMeta,
          estimatedDurationMinutes.isAcceptableOrUnknown(
              data['estimated_duration_minutes']!,
              _estimatedDurationMinutesMeta));
    }
    if (data.containsKey('is_built_in')) {
      context.handle(
          _isBuiltInMeta,
          isBuiltIn.isAcceptableOrUnknown(
              data['is_built_in']!, _isBuiltInMeta));
    }
    if (data.containsKey('is_favorited')) {
      context.handle(
          _isFavoritedMeta,
          isFavorited.isAcceptableOrUnknown(
              data['is_favorited']!, _isFavoritedMeta));
    }
    if (data.containsKey('best_practice_context')) {
      context.handle(
          _bestPracticeContextMeta,
          bestPracticeContext.isAcceptableOrUnknown(
              data['best_practice_context']!, _bestPracticeContextMeta));
    }
    if (data.containsKey('tags_raw')) {
      context.handle(_tagsRawMeta,
          tagsRaw.isAcceptableOrUnknown(data['tags_raw']!, _tagsRawMeta));
    }
    if (data.containsKey('source_attribution')) {
      context.handle(
          _sourceAttributionMeta,
          sourceAttribution.isAcceptableOrUnknown(
              data['source_attribution']!, _sourceAttributionMeta));
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    }
    if (data.containsKey('is_archived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['is_archived']!, _isArchivedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContentItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContentItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      contentType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}content_type'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      excerpt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}excerpt']),
      difficulty: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}difficulty']),
      estimatedDurationMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}estimated_duration_minutes']),
      isBuiltIn: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_built_in'])!,
      isFavorited: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favorited'])!,
      bestPracticeContext: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}best_practice_context']),
      tagsRaw: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags_raw']),
      sourceAttribution: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}source_attribution']),
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
      isArchived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_archived'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ContentItemsTable createAlias(String alias) {
    return $ContentItemsTable(attachedDatabase, alias);
  }
}

class ContentItem extends DataClass implements Insertable<ContentItem> {
  final int id;

  /// ContentType enum index:
  /// 0=obeTechnique, 1=affirmation, 2=meditation, 3=visualization, 4=breathwork
  final int contentType;
  final String title;
  final String body;
  final String? excerpt;

  /// ContentDifficulty enum index: 0=beginner, 1=intermediate, 2=advanced
  final int? difficulty;
  final int? estimatedDurationMinutes;

  /// True for content shipped with the app. False for user-created content.
  final bool isBuiltIn;
  final bool isFavorited;

  /// Context hint for techniques (e.g. "WBTB", "hypnagogic", "any").
  final String? bestPracticeContext;

  /// Internal comma-separated tags for filtering (e.g. "WILD,body-scan,beginner").
  /// Distinct from user-created DreamTags.
  final String? tagsRaw;
  final String? sourceAttribution;
  final int sortOrder;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ContentItem(
      {required this.id,
      required this.contentType,
      required this.title,
      required this.body,
      this.excerpt,
      this.difficulty,
      this.estimatedDurationMinutes,
      required this.isBuiltIn,
      required this.isFavorited,
      this.bestPracticeContext,
      this.tagsRaw,
      this.sourceAttribution,
      required this.sortOrder,
      required this.isArchived,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content_type'] = Variable<int>(contentType);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    if (!nullToAbsent || excerpt != null) {
      map['excerpt'] = Variable<String>(excerpt);
    }
    if (!nullToAbsent || difficulty != null) {
      map['difficulty'] = Variable<int>(difficulty);
    }
    if (!nullToAbsent || estimatedDurationMinutes != null) {
      map['estimated_duration_minutes'] =
          Variable<int>(estimatedDurationMinutes);
    }
    map['is_built_in'] = Variable<bool>(isBuiltIn);
    map['is_favorited'] = Variable<bool>(isFavorited);
    if (!nullToAbsent || bestPracticeContext != null) {
      map['best_practice_context'] = Variable<String>(bestPracticeContext);
    }
    if (!nullToAbsent || tagsRaw != null) {
      map['tags_raw'] = Variable<String>(tagsRaw);
    }
    if (!nullToAbsent || sourceAttribution != null) {
      map['source_attribution'] = Variable<String>(sourceAttribution);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ContentItemsCompanion toCompanion(bool nullToAbsent) {
    return ContentItemsCompanion(
      id: Value(id),
      contentType: Value(contentType),
      title: Value(title),
      body: Value(body),
      excerpt: excerpt == null && nullToAbsent
          ? const Value.absent()
          : Value(excerpt),
      difficulty: difficulty == null && nullToAbsent
          ? const Value.absent()
          : Value(difficulty),
      estimatedDurationMinutes: estimatedDurationMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedDurationMinutes),
      isBuiltIn: Value(isBuiltIn),
      isFavorited: Value(isFavorited),
      bestPracticeContext: bestPracticeContext == null && nullToAbsent
          ? const Value.absent()
          : Value(bestPracticeContext),
      tagsRaw: tagsRaw == null && nullToAbsent
          ? const Value.absent()
          : Value(tagsRaw),
      sourceAttribution: sourceAttribution == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceAttribution),
      sortOrder: Value(sortOrder),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ContentItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContentItem(
      id: serializer.fromJson<int>(json['id']),
      contentType: serializer.fromJson<int>(json['contentType']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      excerpt: serializer.fromJson<String?>(json['excerpt']),
      difficulty: serializer.fromJson<int?>(json['difficulty']),
      estimatedDurationMinutes:
          serializer.fromJson<int?>(json['estimatedDurationMinutes']),
      isBuiltIn: serializer.fromJson<bool>(json['isBuiltIn']),
      isFavorited: serializer.fromJson<bool>(json['isFavorited']),
      bestPracticeContext:
          serializer.fromJson<String?>(json['bestPracticeContext']),
      tagsRaw: serializer.fromJson<String?>(json['tagsRaw']),
      sourceAttribution:
          serializer.fromJson<String?>(json['sourceAttribution']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'contentType': serializer.toJson<int>(contentType),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'excerpt': serializer.toJson<String?>(excerpt),
      'difficulty': serializer.toJson<int?>(difficulty),
      'estimatedDurationMinutes':
          serializer.toJson<int?>(estimatedDurationMinutes),
      'isBuiltIn': serializer.toJson<bool>(isBuiltIn),
      'isFavorited': serializer.toJson<bool>(isFavorited),
      'bestPracticeContext': serializer.toJson<String?>(bestPracticeContext),
      'tagsRaw': serializer.toJson<String?>(tagsRaw),
      'sourceAttribution': serializer.toJson<String?>(sourceAttribution),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ContentItem copyWith(
          {int? id,
          int? contentType,
          String? title,
          String? body,
          Value<String?> excerpt = const Value.absent(),
          Value<int?> difficulty = const Value.absent(),
          Value<int?> estimatedDurationMinutes = const Value.absent(),
          bool? isBuiltIn,
          bool? isFavorited,
          Value<String?> bestPracticeContext = const Value.absent(),
          Value<String?> tagsRaw = const Value.absent(),
          Value<String?> sourceAttribution = const Value.absent(),
          int? sortOrder,
          bool? isArchived,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      ContentItem(
        id: id ?? this.id,
        contentType: contentType ?? this.contentType,
        title: title ?? this.title,
        body: body ?? this.body,
        excerpt: excerpt.present ? excerpt.value : this.excerpt,
        difficulty: difficulty.present ? difficulty.value : this.difficulty,
        estimatedDurationMinutes: estimatedDurationMinutes.present
            ? estimatedDurationMinutes.value
            : this.estimatedDurationMinutes,
        isBuiltIn: isBuiltIn ?? this.isBuiltIn,
        isFavorited: isFavorited ?? this.isFavorited,
        bestPracticeContext: bestPracticeContext.present
            ? bestPracticeContext.value
            : this.bestPracticeContext,
        tagsRaw: tagsRaw.present ? tagsRaw.value : this.tagsRaw,
        sourceAttribution: sourceAttribution.present
            ? sourceAttribution.value
            : this.sourceAttribution,
        sortOrder: sortOrder ?? this.sortOrder,
        isArchived: isArchived ?? this.isArchived,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  ContentItem copyWithCompanion(ContentItemsCompanion data) {
    return ContentItem(
      id: data.id.present ? data.id.value : this.id,
      contentType:
          data.contentType.present ? data.contentType.value : this.contentType,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      excerpt: data.excerpt.present ? data.excerpt.value : this.excerpt,
      difficulty:
          data.difficulty.present ? data.difficulty.value : this.difficulty,
      estimatedDurationMinutes: data.estimatedDurationMinutes.present
          ? data.estimatedDurationMinutes.value
          : this.estimatedDurationMinutes,
      isBuiltIn: data.isBuiltIn.present ? data.isBuiltIn.value : this.isBuiltIn,
      isFavorited:
          data.isFavorited.present ? data.isFavorited.value : this.isFavorited,
      bestPracticeContext: data.bestPracticeContext.present
          ? data.bestPracticeContext.value
          : this.bestPracticeContext,
      tagsRaw: data.tagsRaw.present ? data.tagsRaw.value : this.tagsRaw,
      sourceAttribution: data.sourceAttribution.present
          ? data.sourceAttribution.value
          : this.sourceAttribution,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      isArchived:
          data.isArchived.present ? data.isArchived.value : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContentItem(')
          ..write('id: $id, ')
          ..write('contentType: $contentType, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('excerpt: $excerpt, ')
          ..write('difficulty: $difficulty, ')
          ..write('estimatedDurationMinutes: $estimatedDurationMinutes, ')
          ..write('isBuiltIn: $isBuiltIn, ')
          ..write('isFavorited: $isFavorited, ')
          ..write('bestPracticeContext: $bestPracticeContext, ')
          ..write('tagsRaw: $tagsRaw, ')
          ..write('sourceAttribution: $sourceAttribution, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      contentType,
      title,
      body,
      excerpt,
      difficulty,
      estimatedDurationMinutes,
      isBuiltIn,
      isFavorited,
      bestPracticeContext,
      tagsRaw,
      sourceAttribution,
      sortOrder,
      isArchived,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContentItem &&
          other.id == this.id &&
          other.contentType == this.contentType &&
          other.title == this.title &&
          other.body == this.body &&
          other.excerpt == this.excerpt &&
          other.difficulty == this.difficulty &&
          other.estimatedDurationMinutes == this.estimatedDurationMinutes &&
          other.isBuiltIn == this.isBuiltIn &&
          other.isFavorited == this.isFavorited &&
          other.bestPracticeContext == this.bestPracticeContext &&
          other.tagsRaw == this.tagsRaw &&
          other.sourceAttribution == this.sourceAttribution &&
          other.sortOrder == this.sortOrder &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ContentItemsCompanion extends UpdateCompanion<ContentItem> {
  final Value<int> id;
  final Value<int> contentType;
  final Value<String> title;
  final Value<String> body;
  final Value<String?> excerpt;
  final Value<int?> difficulty;
  final Value<int?> estimatedDurationMinutes;
  final Value<bool> isBuiltIn;
  final Value<bool> isFavorited;
  final Value<String?> bestPracticeContext;
  final Value<String?> tagsRaw;
  final Value<String?> sourceAttribution;
  final Value<int> sortOrder;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ContentItemsCompanion({
    this.id = const Value.absent(),
    this.contentType = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.excerpt = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.estimatedDurationMinutes = const Value.absent(),
    this.isBuiltIn = const Value.absent(),
    this.isFavorited = const Value.absent(),
    this.bestPracticeContext = const Value.absent(),
    this.tagsRaw = const Value.absent(),
    this.sourceAttribution = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ContentItemsCompanion.insert({
    this.id = const Value.absent(),
    required int contentType,
    required String title,
    required String body,
    this.excerpt = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.estimatedDurationMinutes = const Value.absent(),
    this.isBuiltIn = const Value.absent(),
    this.isFavorited = const Value.absent(),
    this.bestPracticeContext = const Value.absent(),
    this.tagsRaw = const Value.absent(),
    this.sourceAttribution = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : contentType = Value(contentType),
        title = Value(title),
        body = Value(body);
  static Insertable<ContentItem> custom({
    Expression<int>? id,
    Expression<int>? contentType,
    Expression<String>? title,
    Expression<String>? body,
    Expression<String>? excerpt,
    Expression<int>? difficulty,
    Expression<int>? estimatedDurationMinutes,
    Expression<bool>? isBuiltIn,
    Expression<bool>? isFavorited,
    Expression<String>? bestPracticeContext,
    Expression<String>? tagsRaw,
    Expression<String>? sourceAttribution,
    Expression<int>? sortOrder,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (contentType != null) 'content_type': contentType,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (excerpt != null) 'excerpt': excerpt,
      if (difficulty != null) 'difficulty': difficulty,
      if (estimatedDurationMinutes != null)
        'estimated_duration_minutes': estimatedDurationMinutes,
      if (isBuiltIn != null) 'is_built_in': isBuiltIn,
      if (isFavorited != null) 'is_favorited': isFavorited,
      if (bestPracticeContext != null)
        'best_practice_context': bestPracticeContext,
      if (tagsRaw != null) 'tags_raw': tagsRaw,
      if (sourceAttribution != null) 'source_attribution': sourceAttribution,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ContentItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? contentType,
      Value<String>? title,
      Value<String>? body,
      Value<String?>? excerpt,
      Value<int?>? difficulty,
      Value<int?>? estimatedDurationMinutes,
      Value<bool>? isBuiltIn,
      Value<bool>? isFavorited,
      Value<String?>? bestPracticeContext,
      Value<String?>? tagsRaw,
      Value<String?>? sourceAttribution,
      Value<int>? sortOrder,
      Value<bool>? isArchived,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return ContentItemsCompanion(
      id: id ?? this.id,
      contentType: contentType ?? this.contentType,
      title: title ?? this.title,
      body: body ?? this.body,
      excerpt: excerpt ?? this.excerpt,
      difficulty: difficulty ?? this.difficulty,
      estimatedDurationMinutes:
          estimatedDurationMinutes ?? this.estimatedDurationMinutes,
      isBuiltIn: isBuiltIn ?? this.isBuiltIn,
      isFavorited: isFavorited ?? this.isFavorited,
      bestPracticeContext: bestPracticeContext ?? this.bestPracticeContext,
      tagsRaw: tagsRaw ?? this.tagsRaw,
      sourceAttribution: sourceAttribution ?? this.sourceAttribution,
      sortOrder: sortOrder ?? this.sortOrder,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (contentType.present) {
      map['content_type'] = Variable<int>(contentType.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (excerpt.present) {
      map['excerpt'] = Variable<String>(excerpt.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<int>(difficulty.value);
    }
    if (estimatedDurationMinutes.present) {
      map['estimated_duration_minutes'] =
          Variable<int>(estimatedDurationMinutes.value);
    }
    if (isBuiltIn.present) {
      map['is_built_in'] = Variable<bool>(isBuiltIn.value);
    }
    if (isFavorited.present) {
      map['is_favorited'] = Variable<bool>(isFavorited.value);
    }
    if (bestPracticeContext.present) {
      map['best_practice_context'] =
          Variable<String>(bestPracticeContext.value);
    }
    if (tagsRaw.present) {
      map['tags_raw'] = Variable<String>(tagsRaw.value);
    }
    if (sourceAttribution.present) {
      map['source_attribution'] = Variable<String>(sourceAttribution.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContentItemsCompanion(')
          ..write('id: $id, ')
          ..write('contentType: $contentType, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('excerpt: $excerpt, ')
          ..write('difficulty: $difficulty, ')
          ..write('estimatedDurationMinutes: $estimatedDurationMinutes, ')
          ..write('isBuiltIn: $isBuiltIn, ')
          ..write('isFavorited: $isFavorited, ')
          ..write('bestPracticeContext: $bestPracticeContext, ')
          ..write('tagsRaw: $tagsRaw, ')
          ..write('sourceAttribution: $sourceAttribution, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ObeLogsTable extends ObeLogs with TableInfo<$ObeLogsTable, ObeLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ObeLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _rundownDateMeta =
      const VerificationMeta('rundownDate');
  @override
  late final GeneratedColumn<String> rundownDate = GeneratedColumn<String>(
      'rundown_date', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES daily_rundowns (id)'));
  static const VerificationMeta _techniqueContentIdMeta =
      const VerificationMeta('techniqueContentId');
  @override
  late final GeneratedColumn<int> techniqueContentId = GeneratedColumn<int>(
      'technique_content_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES content_items (id)'));
  static const VerificationMeta _techniqueNameOverrideMeta =
      const VerificationMeta('techniqueNameOverride');
  @override
  late final GeneratedColumn<String> techniqueNameOverride =
      GeneratedColumn<String>('technique_name_override', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _entryStateMeta =
      const VerificationMeta('entryState');
  @override
  late final GeneratedColumn<int> entryState = GeneratedColumn<int>(
      'entry_state', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _sessionDateMeta =
      const VerificationMeta('sessionDate');
  @override
  late final GeneratedColumn<DateTime> sessionDate = GeneratedColumn<DateTime>(
      'session_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _durationMinutesMeta =
      const VerificationMeta('durationMinutes');
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
      'duration_minutes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _preMoodLevelMeta =
      const VerificationMeta('preMoodLevel');
  @override
  late final GeneratedColumn<int> preMoodLevel = GeneratedColumn<int>(
      'pre_mood_level', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _preEnergyLevelMeta =
      const VerificationMeta('preEnergyLevel');
  @override
  late final GeneratedColumn<int> preEnergyLevel = GeneratedColumn<int>(
      'pre_energy_level', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _intentionMeta =
      const VerificationMeta('intention');
  @override
  late final GeneratedColumn<String> intention = GeneratedColumn<String>(
      'intention', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sessionTypeMeta =
      const VerificationMeta('sessionType');
  @override
  late final GeneratedColumn<int> sessionType = GeneratedColumn<int>(
      'session_type', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sensationsJsonMeta =
      const VerificationMeta('sensationsJson');
  @override
  late final GeneratedColumn<String> sensationsJson = GeneratedColumn<String>(
      'sensations_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _hadVisualsMeta =
      const VerificationMeta('hadVisuals');
  @override
  late final GeneratedColumn<bool> hadVisuals = GeneratedColumn<bool>(
      'had_visuals', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("had_visuals" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _hadAudioMeta =
      const VerificationMeta('hadAudio');
  @override
  late final GeneratedColumn<bool> hadAudio = GeneratedColumn<bool>(
      'had_audio', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("had_audio" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _hadTactileMeta =
      const VerificationMeta('hadTactile');
  @override
  late final GeneratedColumn<bool> hadTactile = GeneratedColumn<bool>(
      'had_tactile', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("had_tactile" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _experienceNarrativeMeta =
      const VerificationMeta('experienceNarrative');
  @override
  late final GeneratedColumn<String> experienceNarrative =
      GeneratedColumn<String>('experience_narrative', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _primaryLocationDescriptionMeta =
      const VerificationMeta('primaryLocationDescription');
  @override
  late final GeneratedColumn<String> primaryLocationDescription =
      GeneratedColumn<String>('primary_location_description', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _challengesMeta =
      const VerificationMeta('challenges');
  @override
  late final GeneratedColumn<String> challenges = GeneratedColumn<String>(
      'challenges', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _returnMethodMeta =
      const VerificationMeta('returnMethod');
  @override
  late final GeneratedColumn<String> returnMethod = GeneratedColumn<String>(
      'return_method', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _focusLevelMeta =
      const VerificationMeta('focusLevel');
  @override
  late final GeneratedColumn<int> focusLevel = GeneratedColumn<int>(
      'focus_level', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _onsetReachedMeta =
      const VerificationMeta('onsetReached');
  @override
  late final GeneratedColumn<bool> onsetReached = GeneratedColumn<bool>(
      'onset_reached', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("onset_reached" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _onsetIntensityMeta =
      const VerificationMeta('onsetIntensity');
  @override
  late final GeneratedColumn<int> onsetIntensity = GeneratedColumn<int>(
      'onset_intensity', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _fieldTypeMeta =
      const VerificationMeta('fieldType');
  @override
  late final GeneratedColumn<int> fieldType = GeneratedColumn<int>(
      'field_type', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _postMoodLevelMeta =
      const VerificationMeta('postMoodLevel');
  @override
  late final GeneratedColumn<int> postMoodLevel = GeneratedColumn<int>(
      'post_mood_level', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _postReflectionMeta =
      const VerificationMeta('postReflection');
  @override
  late final GeneratedColumn<String> postReflection = GeneratedColumn<String>(
      'post_reflection', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _significanceRatingMeta =
      const VerificationMeta('significanceRating');
  @override
  late final GeneratedColumn<int> significanceRating = GeneratedColumn<int>(
      'significance_rating', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isPrivateMeta =
      const VerificationMeta('isPrivate');
  @override
  late final GeneratedColumn<bool> isPrivate = GeneratedColumn<bool>(
      'is_private', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_private" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isArchivedMeta =
      const VerificationMeta('isArchived');
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
      'is_archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        rundownDate,
        techniqueContentId,
        techniqueNameOverride,
        entryState,
        sessionDate,
        durationMinutes,
        preMoodLevel,
        preEnergyLevel,
        intention,
        sessionType,
        description,
        sensationsJson,
        hadVisuals,
        hadAudio,
        hadTactile,
        experienceNarrative,
        primaryLocationDescription,
        challenges,
        returnMethod,
        focusLevel,
        onsetReached,
        onsetIntensity,
        fieldType,
        postMoodLevel,
        postReflection,
        significanceRating,
        isPrivate,
        isArchived,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'obe_logs';
  @override
  VerificationContext validateIntegrity(Insertable<ObeLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('rundown_date')) {
      context.handle(
          _rundownDateMeta,
          rundownDate.isAcceptableOrUnknown(
              data['rundown_date']!, _rundownDateMeta));
    }
    if (data.containsKey('technique_content_id')) {
      context.handle(
          _techniqueContentIdMeta,
          techniqueContentId.isAcceptableOrUnknown(
              data['technique_content_id']!, _techniqueContentIdMeta));
    }
    if (data.containsKey('technique_name_override')) {
      context.handle(
          _techniqueNameOverrideMeta,
          techniqueNameOverride.isAcceptableOrUnknown(
              data['technique_name_override']!, _techniqueNameOverrideMeta));
    }
    if (data.containsKey('entry_state')) {
      context.handle(
          _entryStateMeta,
          entryState.isAcceptableOrUnknown(
              data['entry_state']!, _entryStateMeta));
    }
    if (data.containsKey('session_date')) {
      context.handle(
          _sessionDateMeta,
          sessionDate.isAcceptableOrUnknown(
              data['session_date']!, _sessionDateMeta));
    } else if (isInserting) {
      context.missing(_sessionDateMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
          _durationMinutesMeta,
          durationMinutes.isAcceptableOrUnknown(
              data['duration_minutes']!, _durationMinutesMeta));
    }
    if (data.containsKey('pre_mood_level')) {
      context.handle(
          _preMoodLevelMeta,
          preMoodLevel.isAcceptableOrUnknown(
              data['pre_mood_level']!, _preMoodLevelMeta));
    }
    if (data.containsKey('pre_energy_level')) {
      context.handle(
          _preEnergyLevelMeta,
          preEnergyLevel.isAcceptableOrUnknown(
              data['pre_energy_level']!, _preEnergyLevelMeta));
    }
    if (data.containsKey('intention')) {
      context.handle(_intentionMeta,
          intention.isAcceptableOrUnknown(data['intention']!, _intentionMeta));
    }
    if (data.containsKey('session_type')) {
      context.handle(
          _sessionTypeMeta,
          sessionType.isAcceptableOrUnknown(
              data['session_type']!, _sessionTypeMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('sensations_json')) {
      context.handle(
          _sensationsJsonMeta,
          sensationsJson.isAcceptableOrUnknown(
              data['sensations_json']!, _sensationsJsonMeta));
    }
    if (data.containsKey('had_visuals')) {
      context.handle(
          _hadVisualsMeta,
          hadVisuals.isAcceptableOrUnknown(
              data['had_visuals']!, _hadVisualsMeta));
    }
    if (data.containsKey('had_audio')) {
      context.handle(_hadAudioMeta,
          hadAudio.isAcceptableOrUnknown(data['had_audio']!, _hadAudioMeta));
    }
    if (data.containsKey('had_tactile')) {
      context.handle(
          _hadTactileMeta,
          hadTactile.isAcceptableOrUnknown(
              data['had_tactile']!, _hadTactileMeta));
    }
    if (data.containsKey('experience_narrative')) {
      context.handle(
          _experienceNarrativeMeta,
          experienceNarrative.isAcceptableOrUnknown(
              data['experience_narrative']!, _experienceNarrativeMeta));
    }
    if (data.containsKey('primary_location_description')) {
      context.handle(
          _primaryLocationDescriptionMeta,
          primaryLocationDescription.isAcceptableOrUnknown(
              data['primary_location_description']!,
              _primaryLocationDescriptionMeta));
    }
    if (data.containsKey('challenges')) {
      context.handle(
          _challengesMeta,
          challenges.isAcceptableOrUnknown(
              data['challenges']!, _challengesMeta));
    }
    if (data.containsKey('return_method')) {
      context.handle(
          _returnMethodMeta,
          returnMethod.isAcceptableOrUnknown(
              data['return_method']!, _returnMethodMeta));
    }
    if (data.containsKey('focus_level')) {
      context.handle(
          _focusLevelMeta,
          focusLevel.isAcceptableOrUnknown(
              data['focus_level']!, _focusLevelMeta));
    }
    if (data.containsKey('onset_reached')) {
      context.handle(
          _onsetReachedMeta,
          onsetReached.isAcceptableOrUnknown(
              data['onset_reached']!, _onsetReachedMeta));
    }
    if (data.containsKey('onset_intensity')) {
      context.handle(
          _onsetIntensityMeta,
          onsetIntensity.isAcceptableOrUnknown(
              data['onset_intensity']!, _onsetIntensityMeta));
    }
    if (data.containsKey('field_type')) {
      context.handle(_fieldTypeMeta,
          fieldType.isAcceptableOrUnknown(data['field_type']!, _fieldTypeMeta));
    }
    if (data.containsKey('post_mood_level')) {
      context.handle(
          _postMoodLevelMeta,
          postMoodLevel.isAcceptableOrUnknown(
              data['post_mood_level']!, _postMoodLevelMeta));
    }
    if (data.containsKey('post_reflection')) {
      context.handle(
          _postReflectionMeta,
          postReflection.isAcceptableOrUnknown(
              data['post_reflection']!, _postReflectionMeta));
    }
    if (data.containsKey('significance_rating')) {
      context.handle(
          _significanceRatingMeta,
          significanceRating.isAcceptableOrUnknown(
              data['significance_rating']!, _significanceRatingMeta));
    }
    if (data.containsKey('is_private')) {
      context.handle(_isPrivateMeta,
          isPrivate.isAcceptableOrUnknown(data['is_private']!, _isPrivateMeta));
    }
    if (data.containsKey('is_archived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['is_archived']!, _isArchivedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ObeLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ObeLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      rundownDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rundown_date']),
      techniqueContentId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}technique_content_id']),
      techniqueNameOverride: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}technique_name_override']),
      entryState: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}entry_state'])!,
      sessionDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}session_date'])!,
      durationMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_minutes']),
      preMoodLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pre_mood_level']),
      preEnergyLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pre_energy_level']),
      intention: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}intention']),
      sessionType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_type'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      sensationsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sensations_json']),
      hadVisuals: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}had_visuals'])!,
      hadAudio: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}had_audio'])!,
      hadTactile: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}had_tactile'])!,
      experienceNarrative: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}experience_narrative']),
      primaryLocationDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}primary_location_description']),
      challenges: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}challenges']),
      returnMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}return_method']),
      focusLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}focus_level']),
      onsetReached: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}onset_reached'])!,
      onsetIntensity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}onset_intensity']),
      fieldType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}field_type']),
      postMoodLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}post_mood_level']),
      postReflection: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}post_reflection']),
      significanceRating: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}significance_rating']),
      isPrivate: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_private'])!,
      isArchived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_archived'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ObeLogsTable createAlias(String alias) {
    return $ObeLogsTable(attachedDatabase, alias);
  }
}

class ObeLog extends DataClass implements Insertable<ObeLog> {
  final int id;
  final String? rundownDate;

  /// FK to the library technique used (nullable — user may not reference the library).
  final int? techniqueContentId;

  /// Free-text technique name when not using a library item.
  final String? techniqueNameOverride;

  /// ObeEntryState enum index: 0=attempted, 1=partial, 2=full separation.
  final int entryState;
  final DateTime sessionDate;
  final int? durationMinutes;
  final int? preMoodLevel;
  final int? preEnergyLevel;
  final String? intention;

  /// Session type: 0=DELIBERATE, 1=AMBIENT, 2=BRIDGE. Defaults to DELIBERATE.
  final int sessionType;
  final String description;

  /// JSON array of sensation strings: ["vibrations","paralysis","floating"]
  final String? sensationsJson;
  final bool hadVisuals;
  final bool hadAudio;
  final bool hadTactile;
  final String? experienceNarrative;
  final String? primaryLocationDescription;
  final String? challenges;
  final String? returnMethod;

  /// Focus level (Phase depth): 0=PHASE I, 1=PHASE II, 2=PHASE III, 3=PHASE IV (nullable = not recorded)
  final int? focusLevel;

  /// Whether vibrational onset was reached.
  final bool onsetReached;

  /// Onset intensity when reached: 1=TRACE, 2=STRONG, 3=SURGE (nullable = not recorded)
  final int? onsetIntensity;

  /// Field type: 0=LOCAL, 1=EXPANDED, 2=PARALLEL (nullable = not recorded)
  final int? fieldType;
  final int? postMoodLevel;
  final String? postReflection;
  final int? significanceRating;
  final bool isPrivate;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ObeLog(
      {required this.id,
      this.rundownDate,
      this.techniqueContentId,
      this.techniqueNameOverride,
      required this.entryState,
      required this.sessionDate,
      this.durationMinutes,
      this.preMoodLevel,
      this.preEnergyLevel,
      this.intention,
      required this.sessionType,
      required this.description,
      this.sensationsJson,
      required this.hadVisuals,
      required this.hadAudio,
      required this.hadTactile,
      this.experienceNarrative,
      this.primaryLocationDescription,
      this.challenges,
      this.returnMethod,
      this.focusLevel,
      required this.onsetReached,
      this.onsetIntensity,
      this.fieldType,
      this.postMoodLevel,
      this.postReflection,
      this.significanceRating,
      required this.isPrivate,
      required this.isArchived,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || rundownDate != null) {
      map['rundown_date'] = Variable<String>(rundownDate);
    }
    if (!nullToAbsent || techniqueContentId != null) {
      map['technique_content_id'] = Variable<int>(techniqueContentId);
    }
    if (!nullToAbsent || techniqueNameOverride != null) {
      map['technique_name_override'] = Variable<String>(techniqueNameOverride);
    }
    map['entry_state'] = Variable<int>(entryState);
    map['session_date'] = Variable<DateTime>(sessionDate);
    if (!nullToAbsent || durationMinutes != null) {
      map['duration_minutes'] = Variable<int>(durationMinutes);
    }
    if (!nullToAbsent || preMoodLevel != null) {
      map['pre_mood_level'] = Variable<int>(preMoodLevel);
    }
    if (!nullToAbsent || preEnergyLevel != null) {
      map['pre_energy_level'] = Variable<int>(preEnergyLevel);
    }
    if (!nullToAbsent || intention != null) {
      map['intention'] = Variable<String>(intention);
    }
    map['session_type'] = Variable<int>(sessionType);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || sensationsJson != null) {
      map['sensations_json'] = Variable<String>(sensationsJson);
    }
    map['had_visuals'] = Variable<bool>(hadVisuals);
    map['had_audio'] = Variable<bool>(hadAudio);
    map['had_tactile'] = Variable<bool>(hadTactile);
    if (!nullToAbsent || experienceNarrative != null) {
      map['experience_narrative'] = Variable<String>(experienceNarrative);
    }
    if (!nullToAbsent || primaryLocationDescription != null) {
      map['primary_location_description'] =
          Variable<String>(primaryLocationDescription);
    }
    if (!nullToAbsent || challenges != null) {
      map['challenges'] = Variable<String>(challenges);
    }
    if (!nullToAbsent || returnMethod != null) {
      map['return_method'] = Variable<String>(returnMethod);
    }
    if (!nullToAbsent || focusLevel != null) {
      map['focus_level'] = Variable<int>(focusLevel);
    }
    map['onset_reached'] = Variable<bool>(onsetReached);
    if (!nullToAbsent || onsetIntensity != null) {
      map['onset_intensity'] = Variable<int>(onsetIntensity);
    }
    if (!nullToAbsent || fieldType != null) {
      map['field_type'] = Variable<int>(fieldType);
    }
    if (!nullToAbsent || postMoodLevel != null) {
      map['post_mood_level'] = Variable<int>(postMoodLevel);
    }
    if (!nullToAbsent || postReflection != null) {
      map['post_reflection'] = Variable<String>(postReflection);
    }
    if (!nullToAbsent || significanceRating != null) {
      map['significance_rating'] = Variable<int>(significanceRating);
    }
    map['is_private'] = Variable<bool>(isPrivate);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ObeLogsCompanion toCompanion(bool nullToAbsent) {
    return ObeLogsCompanion(
      id: Value(id),
      rundownDate: rundownDate == null && nullToAbsent
          ? const Value.absent()
          : Value(rundownDate),
      techniqueContentId: techniqueContentId == null && nullToAbsent
          ? const Value.absent()
          : Value(techniqueContentId),
      techniqueNameOverride: techniqueNameOverride == null && nullToAbsent
          ? const Value.absent()
          : Value(techniqueNameOverride),
      entryState: Value(entryState),
      sessionDate: Value(sessionDate),
      durationMinutes: durationMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(durationMinutes),
      preMoodLevel: preMoodLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(preMoodLevel),
      preEnergyLevel: preEnergyLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(preEnergyLevel),
      intention: intention == null && nullToAbsent
          ? const Value.absent()
          : Value(intention),
      sessionType: Value(sessionType),
      description: Value(description),
      sensationsJson: sensationsJson == null && nullToAbsent
          ? const Value.absent()
          : Value(sensationsJson),
      hadVisuals: Value(hadVisuals),
      hadAudio: Value(hadAudio),
      hadTactile: Value(hadTactile),
      experienceNarrative: experienceNarrative == null && nullToAbsent
          ? const Value.absent()
          : Value(experienceNarrative),
      primaryLocationDescription:
          primaryLocationDescription == null && nullToAbsent
              ? const Value.absent()
              : Value(primaryLocationDescription),
      challenges: challenges == null && nullToAbsent
          ? const Value.absent()
          : Value(challenges),
      returnMethod: returnMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(returnMethod),
      focusLevel: focusLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(focusLevel),
      onsetReached: Value(onsetReached),
      onsetIntensity: onsetIntensity == null && nullToAbsent
          ? const Value.absent()
          : Value(onsetIntensity),
      fieldType: fieldType == null && nullToAbsent
          ? const Value.absent()
          : Value(fieldType),
      postMoodLevel: postMoodLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(postMoodLevel),
      postReflection: postReflection == null && nullToAbsent
          ? const Value.absent()
          : Value(postReflection),
      significanceRating: significanceRating == null && nullToAbsent
          ? const Value.absent()
          : Value(significanceRating),
      isPrivate: Value(isPrivate),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ObeLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ObeLog(
      id: serializer.fromJson<int>(json['id']),
      rundownDate: serializer.fromJson<String?>(json['rundownDate']),
      techniqueContentId: serializer.fromJson<int?>(json['techniqueContentId']),
      techniqueNameOverride:
          serializer.fromJson<String?>(json['techniqueNameOverride']),
      entryState: serializer.fromJson<int>(json['entryState']),
      sessionDate: serializer.fromJson<DateTime>(json['sessionDate']),
      durationMinutes: serializer.fromJson<int?>(json['durationMinutes']),
      preMoodLevel: serializer.fromJson<int?>(json['preMoodLevel']),
      preEnergyLevel: serializer.fromJson<int?>(json['preEnergyLevel']),
      intention: serializer.fromJson<String?>(json['intention']),
      sessionType: serializer.fromJson<int>(json['sessionType']),
      description: serializer.fromJson<String>(json['description']),
      sensationsJson: serializer.fromJson<String?>(json['sensationsJson']),
      hadVisuals: serializer.fromJson<bool>(json['hadVisuals']),
      hadAudio: serializer.fromJson<bool>(json['hadAudio']),
      hadTactile: serializer.fromJson<bool>(json['hadTactile']),
      experienceNarrative:
          serializer.fromJson<String?>(json['experienceNarrative']),
      primaryLocationDescription:
          serializer.fromJson<String?>(json['primaryLocationDescription']),
      challenges: serializer.fromJson<String?>(json['challenges']),
      returnMethod: serializer.fromJson<String?>(json['returnMethod']),
      focusLevel: serializer.fromJson<int?>(json['focusLevel']),
      onsetReached: serializer.fromJson<bool>(json['onsetReached']),
      onsetIntensity: serializer.fromJson<int?>(json['onsetIntensity']),
      fieldType: serializer.fromJson<int?>(json['fieldType']),
      postMoodLevel: serializer.fromJson<int?>(json['postMoodLevel']),
      postReflection: serializer.fromJson<String?>(json['postReflection']),
      significanceRating: serializer.fromJson<int?>(json['significanceRating']),
      isPrivate: serializer.fromJson<bool>(json['isPrivate']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'rundownDate': serializer.toJson<String?>(rundownDate),
      'techniqueContentId': serializer.toJson<int?>(techniqueContentId),
      'techniqueNameOverride':
          serializer.toJson<String?>(techniqueNameOverride),
      'entryState': serializer.toJson<int>(entryState),
      'sessionDate': serializer.toJson<DateTime>(sessionDate),
      'durationMinutes': serializer.toJson<int?>(durationMinutes),
      'preMoodLevel': serializer.toJson<int?>(preMoodLevel),
      'preEnergyLevel': serializer.toJson<int?>(preEnergyLevel),
      'intention': serializer.toJson<String?>(intention),
      'sessionType': serializer.toJson<int>(sessionType),
      'description': serializer.toJson<String>(description),
      'sensationsJson': serializer.toJson<String?>(sensationsJson),
      'hadVisuals': serializer.toJson<bool>(hadVisuals),
      'hadAudio': serializer.toJson<bool>(hadAudio),
      'hadTactile': serializer.toJson<bool>(hadTactile),
      'experienceNarrative': serializer.toJson<String?>(experienceNarrative),
      'primaryLocationDescription':
          serializer.toJson<String?>(primaryLocationDescription),
      'challenges': serializer.toJson<String?>(challenges),
      'returnMethod': serializer.toJson<String?>(returnMethod),
      'focusLevel': serializer.toJson<int?>(focusLevel),
      'onsetReached': serializer.toJson<bool>(onsetReached),
      'onsetIntensity': serializer.toJson<int?>(onsetIntensity),
      'fieldType': serializer.toJson<int?>(fieldType),
      'postMoodLevel': serializer.toJson<int?>(postMoodLevel),
      'postReflection': serializer.toJson<String?>(postReflection),
      'significanceRating': serializer.toJson<int?>(significanceRating),
      'isPrivate': serializer.toJson<bool>(isPrivate),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ObeLog copyWith(
          {int? id,
          Value<String?> rundownDate = const Value.absent(),
          Value<int?> techniqueContentId = const Value.absent(),
          Value<String?> techniqueNameOverride = const Value.absent(),
          int? entryState,
          DateTime? sessionDate,
          Value<int?> durationMinutes = const Value.absent(),
          Value<int?> preMoodLevel = const Value.absent(),
          Value<int?> preEnergyLevel = const Value.absent(),
          Value<String?> intention = const Value.absent(),
          int? sessionType,
          String? description,
          Value<String?> sensationsJson = const Value.absent(),
          bool? hadVisuals,
          bool? hadAudio,
          bool? hadTactile,
          Value<String?> experienceNarrative = const Value.absent(),
          Value<String?> primaryLocationDescription = const Value.absent(),
          Value<String?> challenges = const Value.absent(),
          Value<String?> returnMethod = const Value.absent(),
          Value<int?> focusLevel = const Value.absent(),
          bool? onsetReached,
          Value<int?> onsetIntensity = const Value.absent(),
          Value<int?> fieldType = const Value.absent(),
          Value<int?> postMoodLevel = const Value.absent(),
          Value<String?> postReflection = const Value.absent(),
          Value<int?> significanceRating = const Value.absent(),
          bool? isPrivate,
          bool? isArchived,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      ObeLog(
        id: id ?? this.id,
        rundownDate: rundownDate.present ? rundownDate.value : this.rundownDate,
        techniqueContentId: techniqueContentId.present
            ? techniqueContentId.value
            : this.techniqueContentId,
        techniqueNameOverride: techniqueNameOverride.present
            ? techniqueNameOverride.value
            : this.techniqueNameOverride,
        entryState: entryState ?? this.entryState,
        sessionDate: sessionDate ?? this.sessionDate,
        durationMinutes: durationMinutes.present
            ? durationMinutes.value
            : this.durationMinutes,
        preMoodLevel:
            preMoodLevel.present ? preMoodLevel.value : this.preMoodLevel,
        preEnergyLevel:
            preEnergyLevel.present ? preEnergyLevel.value : this.preEnergyLevel,
        intention: intention.present ? intention.value : this.intention,
        sessionType: sessionType ?? this.sessionType,
        description: description ?? this.description,
        sensationsJson:
            sensationsJson.present ? sensationsJson.value : this.sensationsJson,
        hadVisuals: hadVisuals ?? this.hadVisuals,
        hadAudio: hadAudio ?? this.hadAudio,
        hadTactile: hadTactile ?? this.hadTactile,
        experienceNarrative: experienceNarrative.present
            ? experienceNarrative.value
            : this.experienceNarrative,
        primaryLocationDescription: primaryLocationDescription.present
            ? primaryLocationDescription.value
            : this.primaryLocationDescription,
        challenges: challenges.present ? challenges.value : this.challenges,
        returnMethod:
            returnMethod.present ? returnMethod.value : this.returnMethod,
        focusLevel: focusLevel.present ? focusLevel.value : this.focusLevel,
        onsetReached: onsetReached ?? this.onsetReached,
        onsetIntensity:
            onsetIntensity.present ? onsetIntensity.value : this.onsetIntensity,
        fieldType: fieldType.present ? fieldType.value : this.fieldType,
        postMoodLevel:
            postMoodLevel.present ? postMoodLevel.value : this.postMoodLevel,
        postReflection:
            postReflection.present ? postReflection.value : this.postReflection,
        significanceRating: significanceRating.present
            ? significanceRating.value
            : this.significanceRating,
        isPrivate: isPrivate ?? this.isPrivate,
        isArchived: isArchived ?? this.isArchived,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  ObeLog copyWithCompanion(ObeLogsCompanion data) {
    return ObeLog(
      id: data.id.present ? data.id.value : this.id,
      rundownDate:
          data.rundownDate.present ? data.rundownDate.value : this.rundownDate,
      techniqueContentId: data.techniqueContentId.present
          ? data.techniqueContentId.value
          : this.techniqueContentId,
      techniqueNameOverride: data.techniqueNameOverride.present
          ? data.techniqueNameOverride.value
          : this.techniqueNameOverride,
      entryState:
          data.entryState.present ? data.entryState.value : this.entryState,
      sessionDate:
          data.sessionDate.present ? data.sessionDate.value : this.sessionDate,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      preMoodLevel: data.preMoodLevel.present
          ? data.preMoodLevel.value
          : this.preMoodLevel,
      preEnergyLevel: data.preEnergyLevel.present
          ? data.preEnergyLevel.value
          : this.preEnergyLevel,
      intention: data.intention.present ? data.intention.value : this.intention,
      sessionType:
          data.sessionType.present ? data.sessionType.value : this.sessionType,
      description:
          data.description.present ? data.description.value : this.description,
      sensationsJson: data.sensationsJson.present
          ? data.sensationsJson.value
          : this.sensationsJson,
      hadVisuals:
          data.hadVisuals.present ? data.hadVisuals.value : this.hadVisuals,
      hadAudio: data.hadAudio.present ? data.hadAudio.value : this.hadAudio,
      hadTactile:
          data.hadTactile.present ? data.hadTactile.value : this.hadTactile,
      experienceNarrative: data.experienceNarrative.present
          ? data.experienceNarrative.value
          : this.experienceNarrative,
      primaryLocationDescription: data.primaryLocationDescription.present
          ? data.primaryLocationDescription.value
          : this.primaryLocationDescription,
      challenges:
          data.challenges.present ? data.challenges.value : this.challenges,
      returnMethod: data.returnMethod.present
          ? data.returnMethod.value
          : this.returnMethod,
      focusLevel:
          data.focusLevel.present ? data.focusLevel.value : this.focusLevel,
      onsetReached: data.onsetReached.present
          ? data.onsetReached.value
          : this.onsetReached,
      onsetIntensity: data.onsetIntensity.present
          ? data.onsetIntensity.value
          : this.onsetIntensity,
      fieldType: data.fieldType.present ? data.fieldType.value : this.fieldType,
      postMoodLevel: data.postMoodLevel.present
          ? data.postMoodLevel.value
          : this.postMoodLevel,
      postReflection: data.postReflection.present
          ? data.postReflection.value
          : this.postReflection,
      significanceRating: data.significanceRating.present
          ? data.significanceRating.value
          : this.significanceRating,
      isPrivate: data.isPrivate.present ? data.isPrivate.value : this.isPrivate,
      isArchived:
          data.isArchived.present ? data.isArchived.value : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ObeLog(')
          ..write('id: $id, ')
          ..write('rundownDate: $rundownDate, ')
          ..write('techniqueContentId: $techniqueContentId, ')
          ..write('techniqueNameOverride: $techniqueNameOverride, ')
          ..write('entryState: $entryState, ')
          ..write('sessionDate: $sessionDate, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('preMoodLevel: $preMoodLevel, ')
          ..write('preEnergyLevel: $preEnergyLevel, ')
          ..write('intention: $intention, ')
          ..write('sessionType: $sessionType, ')
          ..write('description: $description, ')
          ..write('sensationsJson: $sensationsJson, ')
          ..write('hadVisuals: $hadVisuals, ')
          ..write('hadAudio: $hadAudio, ')
          ..write('hadTactile: $hadTactile, ')
          ..write('experienceNarrative: $experienceNarrative, ')
          ..write('primaryLocationDescription: $primaryLocationDescription, ')
          ..write('challenges: $challenges, ')
          ..write('returnMethod: $returnMethod, ')
          ..write('focusLevel: $focusLevel, ')
          ..write('onsetReached: $onsetReached, ')
          ..write('onsetIntensity: $onsetIntensity, ')
          ..write('fieldType: $fieldType, ')
          ..write('postMoodLevel: $postMoodLevel, ')
          ..write('postReflection: $postReflection, ')
          ..write('significanceRating: $significanceRating, ')
          ..write('isPrivate: $isPrivate, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        rundownDate,
        techniqueContentId,
        techniqueNameOverride,
        entryState,
        sessionDate,
        durationMinutes,
        preMoodLevel,
        preEnergyLevel,
        intention,
        sessionType,
        description,
        sensationsJson,
        hadVisuals,
        hadAudio,
        hadTactile,
        experienceNarrative,
        primaryLocationDescription,
        challenges,
        returnMethod,
        focusLevel,
        onsetReached,
        onsetIntensity,
        fieldType,
        postMoodLevel,
        postReflection,
        significanceRating,
        isPrivate,
        isArchived,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ObeLog &&
          other.id == this.id &&
          other.rundownDate == this.rundownDate &&
          other.techniqueContentId == this.techniqueContentId &&
          other.techniqueNameOverride == this.techniqueNameOverride &&
          other.entryState == this.entryState &&
          other.sessionDate == this.sessionDate &&
          other.durationMinutes == this.durationMinutes &&
          other.preMoodLevel == this.preMoodLevel &&
          other.preEnergyLevel == this.preEnergyLevel &&
          other.intention == this.intention &&
          other.sessionType == this.sessionType &&
          other.description == this.description &&
          other.sensationsJson == this.sensationsJson &&
          other.hadVisuals == this.hadVisuals &&
          other.hadAudio == this.hadAudio &&
          other.hadTactile == this.hadTactile &&
          other.experienceNarrative == this.experienceNarrative &&
          other.primaryLocationDescription == this.primaryLocationDescription &&
          other.challenges == this.challenges &&
          other.returnMethod == this.returnMethod &&
          other.focusLevel == this.focusLevel &&
          other.onsetReached == this.onsetReached &&
          other.onsetIntensity == this.onsetIntensity &&
          other.fieldType == this.fieldType &&
          other.postMoodLevel == this.postMoodLevel &&
          other.postReflection == this.postReflection &&
          other.significanceRating == this.significanceRating &&
          other.isPrivate == this.isPrivate &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ObeLogsCompanion extends UpdateCompanion<ObeLog> {
  final Value<int> id;
  final Value<String?> rundownDate;
  final Value<int?> techniqueContentId;
  final Value<String?> techniqueNameOverride;
  final Value<int> entryState;
  final Value<DateTime> sessionDate;
  final Value<int?> durationMinutes;
  final Value<int?> preMoodLevel;
  final Value<int?> preEnergyLevel;
  final Value<String?> intention;
  final Value<int> sessionType;
  final Value<String> description;
  final Value<String?> sensationsJson;
  final Value<bool> hadVisuals;
  final Value<bool> hadAudio;
  final Value<bool> hadTactile;
  final Value<String?> experienceNarrative;
  final Value<String?> primaryLocationDescription;
  final Value<String?> challenges;
  final Value<String?> returnMethod;
  final Value<int?> focusLevel;
  final Value<bool> onsetReached;
  final Value<int?> onsetIntensity;
  final Value<int?> fieldType;
  final Value<int?> postMoodLevel;
  final Value<String?> postReflection;
  final Value<int?> significanceRating;
  final Value<bool> isPrivate;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ObeLogsCompanion({
    this.id = const Value.absent(),
    this.rundownDate = const Value.absent(),
    this.techniqueContentId = const Value.absent(),
    this.techniqueNameOverride = const Value.absent(),
    this.entryState = const Value.absent(),
    this.sessionDate = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.preMoodLevel = const Value.absent(),
    this.preEnergyLevel = const Value.absent(),
    this.intention = const Value.absent(),
    this.sessionType = const Value.absent(),
    this.description = const Value.absent(),
    this.sensationsJson = const Value.absent(),
    this.hadVisuals = const Value.absent(),
    this.hadAudio = const Value.absent(),
    this.hadTactile = const Value.absent(),
    this.experienceNarrative = const Value.absent(),
    this.primaryLocationDescription = const Value.absent(),
    this.challenges = const Value.absent(),
    this.returnMethod = const Value.absent(),
    this.focusLevel = const Value.absent(),
    this.onsetReached = const Value.absent(),
    this.onsetIntensity = const Value.absent(),
    this.fieldType = const Value.absent(),
    this.postMoodLevel = const Value.absent(),
    this.postReflection = const Value.absent(),
    this.significanceRating = const Value.absent(),
    this.isPrivate = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ObeLogsCompanion.insert({
    this.id = const Value.absent(),
    this.rundownDate = const Value.absent(),
    this.techniqueContentId = const Value.absent(),
    this.techniqueNameOverride = const Value.absent(),
    this.entryState = const Value.absent(),
    required DateTime sessionDate,
    this.durationMinutes = const Value.absent(),
    this.preMoodLevel = const Value.absent(),
    this.preEnergyLevel = const Value.absent(),
    this.intention = const Value.absent(),
    this.sessionType = const Value.absent(),
    required String description,
    this.sensationsJson = const Value.absent(),
    this.hadVisuals = const Value.absent(),
    this.hadAudio = const Value.absent(),
    this.hadTactile = const Value.absent(),
    this.experienceNarrative = const Value.absent(),
    this.primaryLocationDescription = const Value.absent(),
    this.challenges = const Value.absent(),
    this.returnMethod = const Value.absent(),
    this.focusLevel = const Value.absent(),
    this.onsetReached = const Value.absent(),
    this.onsetIntensity = const Value.absent(),
    this.fieldType = const Value.absent(),
    this.postMoodLevel = const Value.absent(),
    this.postReflection = const Value.absent(),
    this.significanceRating = const Value.absent(),
    this.isPrivate = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : sessionDate = Value(sessionDate),
        description = Value(description);
  static Insertable<ObeLog> custom({
    Expression<int>? id,
    Expression<String>? rundownDate,
    Expression<int>? techniqueContentId,
    Expression<String>? techniqueNameOverride,
    Expression<int>? entryState,
    Expression<DateTime>? sessionDate,
    Expression<int>? durationMinutes,
    Expression<int>? preMoodLevel,
    Expression<int>? preEnergyLevel,
    Expression<String>? intention,
    Expression<int>? sessionType,
    Expression<String>? description,
    Expression<String>? sensationsJson,
    Expression<bool>? hadVisuals,
    Expression<bool>? hadAudio,
    Expression<bool>? hadTactile,
    Expression<String>? experienceNarrative,
    Expression<String>? primaryLocationDescription,
    Expression<String>? challenges,
    Expression<String>? returnMethod,
    Expression<int>? focusLevel,
    Expression<bool>? onsetReached,
    Expression<int>? onsetIntensity,
    Expression<int>? fieldType,
    Expression<int>? postMoodLevel,
    Expression<String>? postReflection,
    Expression<int>? significanceRating,
    Expression<bool>? isPrivate,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rundownDate != null) 'rundown_date': rundownDate,
      if (techniqueContentId != null)
        'technique_content_id': techniqueContentId,
      if (techniqueNameOverride != null)
        'technique_name_override': techniqueNameOverride,
      if (entryState != null) 'entry_state': entryState,
      if (sessionDate != null) 'session_date': sessionDate,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (preMoodLevel != null) 'pre_mood_level': preMoodLevel,
      if (preEnergyLevel != null) 'pre_energy_level': preEnergyLevel,
      if (intention != null) 'intention': intention,
      if (sessionType != null) 'session_type': sessionType,
      if (description != null) 'description': description,
      if (sensationsJson != null) 'sensations_json': sensationsJson,
      if (hadVisuals != null) 'had_visuals': hadVisuals,
      if (hadAudio != null) 'had_audio': hadAudio,
      if (hadTactile != null) 'had_tactile': hadTactile,
      if (experienceNarrative != null)
        'experience_narrative': experienceNarrative,
      if (primaryLocationDescription != null)
        'primary_location_description': primaryLocationDescription,
      if (challenges != null) 'challenges': challenges,
      if (returnMethod != null) 'return_method': returnMethod,
      if (focusLevel != null) 'focus_level': focusLevel,
      if (onsetReached != null) 'onset_reached': onsetReached,
      if (onsetIntensity != null) 'onset_intensity': onsetIntensity,
      if (fieldType != null) 'field_type': fieldType,
      if (postMoodLevel != null) 'post_mood_level': postMoodLevel,
      if (postReflection != null) 'post_reflection': postReflection,
      if (significanceRating != null) 'significance_rating': significanceRating,
      if (isPrivate != null) 'is_private': isPrivate,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ObeLogsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? rundownDate,
      Value<int?>? techniqueContentId,
      Value<String?>? techniqueNameOverride,
      Value<int>? entryState,
      Value<DateTime>? sessionDate,
      Value<int?>? durationMinutes,
      Value<int?>? preMoodLevel,
      Value<int?>? preEnergyLevel,
      Value<String?>? intention,
      Value<int>? sessionType,
      Value<String>? description,
      Value<String?>? sensationsJson,
      Value<bool>? hadVisuals,
      Value<bool>? hadAudio,
      Value<bool>? hadTactile,
      Value<String?>? experienceNarrative,
      Value<String?>? primaryLocationDescription,
      Value<String?>? challenges,
      Value<String?>? returnMethod,
      Value<int?>? focusLevel,
      Value<bool>? onsetReached,
      Value<int?>? onsetIntensity,
      Value<int?>? fieldType,
      Value<int?>? postMoodLevel,
      Value<String?>? postReflection,
      Value<int?>? significanceRating,
      Value<bool>? isPrivate,
      Value<bool>? isArchived,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return ObeLogsCompanion(
      id: id ?? this.id,
      rundownDate: rundownDate ?? this.rundownDate,
      techniqueContentId: techniqueContentId ?? this.techniqueContentId,
      techniqueNameOverride:
          techniqueNameOverride ?? this.techniqueNameOverride,
      entryState: entryState ?? this.entryState,
      sessionDate: sessionDate ?? this.sessionDate,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      preMoodLevel: preMoodLevel ?? this.preMoodLevel,
      preEnergyLevel: preEnergyLevel ?? this.preEnergyLevel,
      intention: intention ?? this.intention,
      sessionType: sessionType ?? this.sessionType,
      description: description ?? this.description,
      sensationsJson: sensationsJson ?? this.sensationsJson,
      hadVisuals: hadVisuals ?? this.hadVisuals,
      hadAudio: hadAudio ?? this.hadAudio,
      hadTactile: hadTactile ?? this.hadTactile,
      experienceNarrative: experienceNarrative ?? this.experienceNarrative,
      primaryLocationDescription:
          primaryLocationDescription ?? this.primaryLocationDescription,
      challenges: challenges ?? this.challenges,
      returnMethod: returnMethod ?? this.returnMethod,
      focusLevel: focusLevel ?? this.focusLevel,
      onsetReached: onsetReached ?? this.onsetReached,
      onsetIntensity: onsetIntensity ?? this.onsetIntensity,
      fieldType: fieldType ?? this.fieldType,
      postMoodLevel: postMoodLevel ?? this.postMoodLevel,
      postReflection: postReflection ?? this.postReflection,
      significanceRating: significanceRating ?? this.significanceRating,
      isPrivate: isPrivate ?? this.isPrivate,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rundownDate.present) {
      map['rundown_date'] = Variable<String>(rundownDate.value);
    }
    if (techniqueContentId.present) {
      map['technique_content_id'] = Variable<int>(techniqueContentId.value);
    }
    if (techniqueNameOverride.present) {
      map['technique_name_override'] =
          Variable<String>(techniqueNameOverride.value);
    }
    if (entryState.present) {
      map['entry_state'] = Variable<int>(entryState.value);
    }
    if (sessionDate.present) {
      map['session_date'] = Variable<DateTime>(sessionDate.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (preMoodLevel.present) {
      map['pre_mood_level'] = Variable<int>(preMoodLevel.value);
    }
    if (preEnergyLevel.present) {
      map['pre_energy_level'] = Variable<int>(preEnergyLevel.value);
    }
    if (intention.present) {
      map['intention'] = Variable<String>(intention.value);
    }
    if (sessionType.present) {
      map['session_type'] = Variable<int>(sessionType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (sensationsJson.present) {
      map['sensations_json'] = Variable<String>(sensationsJson.value);
    }
    if (hadVisuals.present) {
      map['had_visuals'] = Variable<bool>(hadVisuals.value);
    }
    if (hadAudio.present) {
      map['had_audio'] = Variable<bool>(hadAudio.value);
    }
    if (hadTactile.present) {
      map['had_tactile'] = Variable<bool>(hadTactile.value);
    }
    if (experienceNarrative.present) {
      map['experience_narrative'] = Variable<String>(experienceNarrative.value);
    }
    if (primaryLocationDescription.present) {
      map['primary_location_description'] =
          Variable<String>(primaryLocationDescription.value);
    }
    if (challenges.present) {
      map['challenges'] = Variable<String>(challenges.value);
    }
    if (returnMethod.present) {
      map['return_method'] = Variable<String>(returnMethod.value);
    }
    if (focusLevel.present) {
      map['focus_level'] = Variable<int>(focusLevel.value);
    }
    if (onsetReached.present) {
      map['onset_reached'] = Variable<bool>(onsetReached.value);
    }
    if (onsetIntensity.present) {
      map['onset_intensity'] = Variable<int>(onsetIntensity.value);
    }
    if (fieldType.present) {
      map['field_type'] = Variable<int>(fieldType.value);
    }
    if (postMoodLevel.present) {
      map['post_mood_level'] = Variable<int>(postMoodLevel.value);
    }
    if (postReflection.present) {
      map['post_reflection'] = Variable<String>(postReflection.value);
    }
    if (significanceRating.present) {
      map['significance_rating'] = Variable<int>(significanceRating.value);
    }
    if (isPrivate.present) {
      map['is_private'] = Variable<bool>(isPrivate.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ObeLogsCompanion(')
          ..write('id: $id, ')
          ..write('rundownDate: $rundownDate, ')
          ..write('techniqueContentId: $techniqueContentId, ')
          ..write('techniqueNameOverride: $techniqueNameOverride, ')
          ..write('entryState: $entryState, ')
          ..write('sessionDate: $sessionDate, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('preMoodLevel: $preMoodLevel, ')
          ..write('preEnergyLevel: $preEnergyLevel, ')
          ..write('intention: $intention, ')
          ..write('sessionType: $sessionType, ')
          ..write('description: $description, ')
          ..write('sensationsJson: $sensationsJson, ')
          ..write('hadVisuals: $hadVisuals, ')
          ..write('hadAudio: $hadAudio, ')
          ..write('hadTactile: $hadTactile, ')
          ..write('experienceNarrative: $experienceNarrative, ')
          ..write('primaryLocationDescription: $primaryLocationDescription, ')
          ..write('challenges: $challenges, ')
          ..write('returnMethod: $returnMethod, ')
          ..write('focusLevel: $focusLevel, ')
          ..write('onsetReached: $onsetReached, ')
          ..write('onsetIntensity: $onsetIntensity, ')
          ..write('fieldType: $fieldType, ')
          ..write('postMoodLevel: $postMoodLevel, ')
          ..write('postReflection: $postReflection, ')
          ..write('significanceRating: $significanceRating, ')
          ..write('isPrivate: $isPrivate, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ObeLocationVisitsTable extends ObeLocationVisits
    with TableInfo<$ObeLocationVisitsTable, ObeLocationVisit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ObeLocationVisitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _obeLogIdMeta =
      const VerificationMeta('obeLogId');
  @override
  late final GeneratedColumn<int> obeLogId = GeneratedColumn<int>(
      'obe_log_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES obe_logs (id)'));
  static const VerificationMeta _sequenceMeta =
      const VerificationMeta('sequence');
  @override
  late final GeneratedColumn<int> sequence = GeneratedColumn<int>(
      'sequence', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _locationNameMeta =
      const VerificationMeta('locationName');
  @override
  late final GeneratedColumn<String> locationName = GeneratedColumn<String>(
      'location_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isRealWorldLocationMeta =
      const VerificationMeta('isRealWorldLocation');
  @override
  late final GeneratedColumn<bool> isRealWorldLocation = GeneratedColumn<bool>(
      'is_real_world_location', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_real_world_location" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _realWorldRefMeta =
      const VerificationMeta('realWorldRef');
  @override
  late final GeneratedColumn<String> realWorldRef = GeneratedColumn<String>(
      'real_world_ref', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _durationMinutesMeta =
      const VerificationMeta('durationMinutes');
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
      'duration_minutes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        obeLogId,
        sequence,
        locationName,
        description,
        isRealWorldLocation,
        realWorldRef,
        durationMinutes,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'obe_location_visits';
  @override
  VerificationContext validateIntegrity(Insertable<ObeLocationVisit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('obe_log_id')) {
      context.handle(_obeLogIdMeta,
          obeLogId.isAcceptableOrUnknown(data['obe_log_id']!, _obeLogIdMeta));
    } else if (isInserting) {
      context.missing(_obeLogIdMeta);
    }
    if (data.containsKey('sequence')) {
      context.handle(_sequenceMeta,
          sequence.isAcceptableOrUnknown(data['sequence']!, _sequenceMeta));
    }
    if (data.containsKey('location_name')) {
      context.handle(
          _locationNameMeta,
          locationName.isAcceptableOrUnknown(
              data['location_name']!, _locationNameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('is_real_world_location')) {
      context.handle(
          _isRealWorldLocationMeta,
          isRealWorldLocation.isAcceptableOrUnknown(
              data['is_real_world_location']!, _isRealWorldLocationMeta));
    }
    if (data.containsKey('real_world_ref')) {
      context.handle(
          _realWorldRefMeta,
          realWorldRef.isAcceptableOrUnknown(
              data['real_world_ref']!, _realWorldRefMeta));
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
          _durationMinutesMeta,
          durationMinutes.isAcceptableOrUnknown(
              data['duration_minutes']!, _durationMinutesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ObeLocationVisit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ObeLocationVisit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      obeLogId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}obe_log_id'])!,
      sequence: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sequence'])!,
      locationName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_name']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      isRealWorldLocation: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_real_world_location'])!,
      realWorldRef: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}real_world_ref']),
      durationMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_minutes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ObeLocationVisitsTable createAlias(String alias) {
    return $ObeLocationVisitsTable(attachedDatabase, alias);
  }
}

class ObeLocationVisit extends DataClass
    implements Insertable<ObeLocationVisit> {
  final int id;
  final int obeLogId;

  /// Order of visit within the session (1-indexed).
  final int sequence;
  final String? locationName;
  final String description;
  final bool isRealWorldLocation;

  /// Real-world reference (e.g. "my childhood home", "a street in Paris").
  final String? realWorldRef;
  final int? durationMinutes;
  final DateTime createdAt;
  const ObeLocationVisit(
      {required this.id,
      required this.obeLogId,
      required this.sequence,
      this.locationName,
      required this.description,
      required this.isRealWorldLocation,
      this.realWorldRef,
      this.durationMinutes,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['obe_log_id'] = Variable<int>(obeLogId);
    map['sequence'] = Variable<int>(sequence);
    if (!nullToAbsent || locationName != null) {
      map['location_name'] = Variable<String>(locationName);
    }
    map['description'] = Variable<String>(description);
    map['is_real_world_location'] = Variable<bool>(isRealWorldLocation);
    if (!nullToAbsent || realWorldRef != null) {
      map['real_world_ref'] = Variable<String>(realWorldRef);
    }
    if (!nullToAbsent || durationMinutes != null) {
      map['duration_minutes'] = Variable<int>(durationMinutes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ObeLocationVisitsCompanion toCompanion(bool nullToAbsent) {
    return ObeLocationVisitsCompanion(
      id: Value(id),
      obeLogId: Value(obeLogId),
      sequence: Value(sequence),
      locationName: locationName == null && nullToAbsent
          ? const Value.absent()
          : Value(locationName),
      description: Value(description),
      isRealWorldLocation: Value(isRealWorldLocation),
      realWorldRef: realWorldRef == null && nullToAbsent
          ? const Value.absent()
          : Value(realWorldRef),
      durationMinutes: durationMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(durationMinutes),
      createdAt: Value(createdAt),
    );
  }

  factory ObeLocationVisit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ObeLocationVisit(
      id: serializer.fromJson<int>(json['id']),
      obeLogId: serializer.fromJson<int>(json['obeLogId']),
      sequence: serializer.fromJson<int>(json['sequence']),
      locationName: serializer.fromJson<String?>(json['locationName']),
      description: serializer.fromJson<String>(json['description']),
      isRealWorldLocation:
          serializer.fromJson<bool>(json['isRealWorldLocation']),
      realWorldRef: serializer.fromJson<String?>(json['realWorldRef']),
      durationMinutes: serializer.fromJson<int?>(json['durationMinutes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'obeLogId': serializer.toJson<int>(obeLogId),
      'sequence': serializer.toJson<int>(sequence),
      'locationName': serializer.toJson<String?>(locationName),
      'description': serializer.toJson<String>(description),
      'isRealWorldLocation': serializer.toJson<bool>(isRealWorldLocation),
      'realWorldRef': serializer.toJson<String?>(realWorldRef),
      'durationMinutes': serializer.toJson<int?>(durationMinutes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ObeLocationVisit copyWith(
          {int? id,
          int? obeLogId,
          int? sequence,
          Value<String?> locationName = const Value.absent(),
          String? description,
          bool? isRealWorldLocation,
          Value<String?> realWorldRef = const Value.absent(),
          Value<int?> durationMinutes = const Value.absent(),
          DateTime? createdAt}) =>
      ObeLocationVisit(
        id: id ?? this.id,
        obeLogId: obeLogId ?? this.obeLogId,
        sequence: sequence ?? this.sequence,
        locationName:
            locationName.present ? locationName.value : this.locationName,
        description: description ?? this.description,
        isRealWorldLocation: isRealWorldLocation ?? this.isRealWorldLocation,
        realWorldRef:
            realWorldRef.present ? realWorldRef.value : this.realWorldRef,
        durationMinutes: durationMinutes.present
            ? durationMinutes.value
            : this.durationMinutes,
        createdAt: createdAt ?? this.createdAt,
      );
  ObeLocationVisit copyWithCompanion(ObeLocationVisitsCompanion data) {
    return ObeLocationVisit(
      id: data.id.present ? data.id.value : this.id,
      obeLogId: data.obeLogId.present ? data.obeLogId.value : this.obeLogId,
      sequence: data.sequence.present ? data.sequence.value : this.sequence,
      locationName: data.locationName.present
          ? data.locationName.value
          : this.locationName,
      description:
          data.description.present ? data.description.value : this.description,
      isRealWorldLocation: data.isRealWorldLocation.present
          ? data.isRealWorldLocation.value
          : this.isRealWorldLocation,
      realWorldRef: data.realWorldRef.present
          ? data.realWorldRef.value
          : this.realWorldRef,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ObeLocationVisit(')
          ..write('id: $id, ')
          ..write('obeLogId: $obeLogId, ')
          ..write('sequence: $sequence, ')
          ..write('locationName: $locationName, ')
          ..write('description: $description, ')
          ..write('isRealWorldLocation: $isRealWorldLocation, ')
          ..write('realWorldRef: $realWorldRef, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      obeLogId,
      sequence,
      locationName,
      description,
      isRealWorldLocation,
      realWorldRef,
      durationMinutes,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ObeLocationVisit &&
          other.id == this.id &&
          other.obeLogId == this.obeLogId &&
          other.sequence == this.sequence &&
          other.locationName == this.locationName &&
          other.description == this.description &&
          other.isRealWorldLocation == this.isRealWorldLocation &&
          other.realWorldRef == this.realWorldRef &&
          other.durationMinutes == this.durationMinutes &&
          other.createdAt == this.createdAt);
}

class ObeLocationVisitsCompanion extends UpdateCompanion<ObeLocationVisit> {
  final Value<int> id;
  final Value<int> obeLogId;
  final Value<int> sequence;
  final Value<String?> locationName;
  final Value<String> description;
  final Value<bool> isRealWorldLocation;
  final Value<String?> realWorldRef;
  final Value<int?> durationMinutes;
  final Value<DateTime> createdAt;
  const ObeLocationVisitsCompanion({
    this.id = const Value.absent(),
    this.obeLogId = const Value.absent(),
    this.sequence = const Value.absent(),
    this.locationName = const Value.absent(),
    this.description = const Value.absent(),
    this.isRealWorldLocation = const Value.absent(),
    this.realWorldRef = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ObeLocationVisitsCompanion.insert({
    this.id = const Value.absent(),
    required int obeLogId,
    this.sequence = const Value.absent(),
    this.locationName = const Value.absent(),
    required String description,
    this.isRealWorldLocation = const Value.absent(),
    this.realWorldRef = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : obeLogId = Value(obeLogId),
        description = Value(description);
  static Insertable<ObeLocationVisit> custom({
    Expression<int>? id,
    Expression<int>? obeLogId,
    Expression<int>? sequence,
    Expression<String>? locationName,
    Expression<String>? description,
    Expression<bool>? isRealWorldLocation,
    Expression<String>? realWorldRef,
    Expression<int>? durationMinutes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (obeLogId != null) 'obe_log_id': obeLogId,
      if (sequence != null) 'sequence': sequence,
      if (locationName != null) 'location_name': locationName,
      if (description != null) 'description': description,
      if (isRealWorldLocation != null)
        'is_real_world_location': isRealWorldLocation,
      if (realWorldRef != null) 'real_world_ref': realWorldRef,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ObeLocationVisitsCompanion copyWith(
      {Value<int>? id,
      Value<int>? obeLogId,
      Value<int>? sequence,
      Value<String?>? locationName,
      Value<String>? description,
      Value<bool>? isRealWorldLocation,
      Value<String?>? realWorldRef,
      Value<int?>? durationMinutes,
      Value<DateTime>? createdAt}) {
    return ObeLocationVisitsCompanion(
      id: id ?? this.id,
      obeLogId: obeLogId ?? this.obeLogId,
      sequence: sequence ?? this.sequence,
      locationName: locationName ?? this.locationName,
      description: description ?? this.description,
      isRealWorldLocation: isRealWorldLocation ?? this.isRealWorldLocation,
      realWorldRef: realWorldRef ?? this.realWorldRef,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (obeLogId.present) {
      map['obe_log_id'] = Variable<int>(obeLogId.value);
    }
    if (sequence.present) {
      map['sequence'] = Variable<int>(sequence.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String>(locationName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isRealWorldLocation.present) {
      map['is_real_world_location'] = Variable<bool>(isRealWorldLocation.value);
    }
    if (realWorldRef.present) {
      map['real_world_ref'] = Variable<String>(realWorldRef.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ObeLocationVisitsCompanion(')
          ..write('id: $id, ')
          ..write('obeLogId: $obeLogId, ')
          ..write('sequence: $sequence, ')
          ..write('locationName: $locationName, ')
          ..write('description: $description, ')
          ..write('isRealWorldLocation: $isRealWorldLocation, ')
          ..write('realWorldRef: $realWorldRef, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ContentUsageLogTable extends ContentUsageLog
    with TableInfo<$ContentUsageLogTable, ContentUsageLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContentUsageLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _contentItemIdMeta =
      const VerificationMeta('contentItemId');
  @override
  late final GeneratedColumn<int> contentItemId = GeneratedColumn<int>(
      'content_item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES content_items (id)'));
  static const VerificationMeta _rundownDateMeta =
      const VerificationMeta('rundownDate');
  @override
  late final GeneratedColumn<String> rundownDate = GeneratedColumn<String>(
      'rundown_date', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES daily_rundowns (id)'));
  static const VerificationMeta _wasCompletedMeta =
      const VerificationMeta('wasCompleted');
  @override
  late final GeneratedColumn<bool> wasCompleted = GeneratedColumn<bool>(
      'was_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("was_completed" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _userRatingMeta =
      const VerificationMeta('userRating');
  @override
  late final GeneratedColumn<int> userRating = GeneratedColumn<int>(
      'user_rating', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _usedAtMeta = const VerificationMeta('usedAt');
  @override
  late final GeneratedColumn<DateTime> usedAt = GeneratedColumn<DateTime>(
      'used_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, contentItemId, rundownDate, wasCompleted, userRating, notes, usedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'content_usage_log';
  @override
  VerificationContext validateIntegrity(
      Insertable<ContentUsageLogData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content_item_id')) {
      context.handle(
          _contentItemIdMeta,
          contentItemId.isAcceptableOrUnknown(
              data['content_item_id']!, _contentItemIdMeta));
    } else if (isInserting) {
      context.missing(_contentItemIdMeta);
    }
    if (data.containsKey('rundown_date')) {
      context.handle(
          _rundownDateMeta,
          rundownDate.isAcceptableOrUnknown(
              data['rundown_date']!, _rundownDateMeta));
    }
    if (data.containsKey('was_completed')) {
      context.handle(
          _wasCompletedMeta,
          wasCompleted.isAcceptableOrUnknown(
              data['was_completed']!, _wasCompletedMeta));
    }
    if (data.containsKey('user_rating')) {
      context.handle(
          _userRatingMeta,
          userRating.isAcceptableOrUnknown(
              data['user_rating']!, _userRatingMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('used_at')) {
      context.handle(_usedAtMeta,
          usedAt.isAcceptableOrUnknown(data['used_at']!, _usedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContentUsageLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContentUsageLogData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      contentItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}content_item_id'])!,
      rundownDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rundown_date']),
      wasCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}was_completed'])!,
      userRating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_rating']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      usedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}used_at'])!,
    );
  }

  @override
  $ContentUsageLogTable createAlias(String alias) {
    return $ContentUsageLogTable(attachedDatabase, alias);
  }
}

class ContentUsageLogData extends DataClass
    implements Insertable<ContentUsageLogData> {
  final int id;
  final int contentItemId;

  /// Which daily rundown session this usage belongs to (nullable).
  final String? rundownDate;
  final bool wasCompleted;

  /// User's post-use rating 1-5 (nullable).
  final int? userRating;
  final String? notes;
  final DateTime usedAt;
  const ContentUsageLogData(
      {required this.id,
      required this.contentItemId,
      this.rundownDate,
      required this.wasCompleted,
      this.userRating,
      this.notes,
      required this.usedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content_item_id'] = Variable<int>(contentItemId);
    if (!nullToAbsent || rundownDate != null) {
      map['rundown_date'] = Variable<String>(rundownDate);
    }
    map['was_completed'] = Variable<bool>(wasCompleted);
    if (!nullToAbsent || userRating != null) {
      map['user_rating'] = Variable<int>(userRating);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['used_at'] = Variable<DateTime>(usedAt);
    return map;
  }

  ContentUsageLogCompanion toCompanion(bool nullToAbsent) {
    return ContentUsageLogCompanion(
      id: Value(id),
      contentItemId: Value(contentItemId),
      rundownDate: rundownDate == null && nullToAbsent
          ? const Value.absent()
          : Value(rundownDate),
      wasCompleted: Value(wasCompleted),
      userRating: userRating == null && nullToAbsent
          ? const Value.absent()
          : Value(userRating),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      usedAt: Value(usedAt),
    );
  }

  factory ContentUsageLogData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContentUsageLogData(
      id: serializer.fromJson<int>(json['id']),
      contentItemId: serializer.fromJson<int>(json['contentItemId']),
      rundownDate: serializer.fromJson<String?>(json['rundownDate']),
      wasCompleted: serializer.fromJson<bool>(json['wasCompleted']),
      userRating: serializer.fromJson<int?>(json['userRating']),
      notes: serializer.fromJson<String?>(json['notes']),
      usedAt: serializer.fromJson<DateTime>(json['usedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'contentItemId': serializer.toJson<int>(contentItemId),
      'rundownDate': serializer.toJson<String?>(rundownDate),
      'wasCompleted': serializer.toJson<bool>(wasCompleted),
      'userRating': serializer.toJson<int?>(userRating),
      'notes': serializer.toJson<String?>(notes),
      'usedAt': serializer.toJson<DateTime>(usedAt),
    };
  }

  ContentUsageLogData copyWith(
          {int? id,
          int? contentItemId,
          Value<String?> rundownDate = const Value.absent(),
          bool? wasCompleted,
          Value<int?> userRating = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? usedAt}) =>
      ContentUsageLogData(
        id: id ?? this.id,
        contentItemId: contentItemId ?? this.contentItemId,
        rundownDate: rundownDate.present ? rundownDate.value : this.rundownDate,
        wasCompleted: wasCompleted ?? this.wasCompleted,
        userRating: userRating.present ? userRating.value : this.userRating,
        notes: notes.present ? notes.value : this.notes,
        usedAt: usedAt ?? this.usedAt,
      );
  ContentUsageLogData copyWithCompanion(ContentUsageLogCompanion data) {
    return ContentUsageLogData(
      id: data.id.present ? data.id.value : this.id,
      contentItemId: data.contentItemId.present
          ? data.contentItemId.value
          : this.contentItemId,
      rundownDate:
          data.rundownDate.present ? data.rundownDate.value : this.rundownDate,
      wasCompleted: data.wasCompleted.present
          ? data.wasCompleted.value
          : this.wasCompleted,
      userRating:
          data.userRating.present ? data.userRating.value : this.userRating,
      notes: data.notes.present ? data.notes.value : this.notes,
      usedAt: data.usedAt.present ? data.usedAt.value : this.usedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContentUsageLogData(')
          ..write('id: $id, ')
          ..write('contentItemId: $contentItemId, ')
          ..write('rundownDate: $rundownDate, ')
          ..write('wasCompleted: $wasCompleted, ')
          ..write('userRating: $userRating, ')
          ..write('notes: $notes, ')
          ..write('usedAt: $usedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, contentItemId, rundownDate, wasCompleted, userRating, notes, usedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContentUsageLogData &&
          other.id == this.id &&
          other.contentItemId == this.contentItemId &&
          other.rundownDate == this.rundownDate &&
          other.wasCompleted == this.wasCompleted &&
          other.userRating == this.userRating &&
          other.notes == this.notes &&
          other.usedAt == this.usedAt);
}

class ContentUsageLogCompanion extends UpdateCompanion<ContentUsageLogData> {
  final Value<int> id;
  final Value<int> contentItemId;
  final Value<String?> rundownDate;
  final Value<bool> wasCompleted;
  final Value<int?> userRating;
  final Value<String?> notes;
  final Value<DateTime> usedAt;
  const ContentUsageLogCompanion({
    this.id = const Value.absent(),
    this.contentItemId = const Value.absent(),
    this.rundownDate = const Value.absent(),
    this.wasCompleted = const Value.absent(),
    this.userRating = const Value.absent(),
    this.notes = const Value.absent(),
    this.usedAt = const Value.absent(),
  });
  ContentUsageLogCompanion.insert({
    this.id = const Value.absent(),
    required int contentItemId,
    this.rundownDate = const Value.absent(),
    this.wasCompleted = const Value.absent(),
    this.userRating = const Value.absent(),
    this.notes = const Value.absent(),
    this.usedAt = const Value.absent(),
  }) : contentItemId = Value(contentItemId);
  static Insertable<ContentUsageLogData> custom({
    Expression<int>? id,
    Expression<int>? contentItemId,
    Expression<String>? rundownDate,
    Expression<bool>? wasCompleted,
    Expression<int>? userRating,
    Expression<String>? notes,
    Expression<DateTime>? usedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (contentItemId != null) 'content_item_id': contentItemId,
      if (rundownDate != null) 'rundown_date': rundownDate,
      if (wasCompleted != null) 'was_completed': wasCompleted,
      if (userRating != null) 'user_rating': userRating,
      if (notes != null) 'notes': notes,
      if (usedAt != null) 'used_at': usedAt,
    });
  }

  ContentUsageLogCompanion copyWith(
      {Value<int>? id,
      Value<int>? contentItemId,
      Value<String?>? rundownDate,
      Value<bool>? wasCompleted,
      Value<int?>? userRating,
      Value<String?>? notes,
      Value<DateTime>? usedAt}) {
    return ContentUsageLogCompanion(
      id: id ?? this.id,
      contentItemId: contentItemId ?? this.contentItemId,
      rundownDate: rundownDate ?? this.rundownDate,
      wasCompleted: wasCompleted ?? this.wasCompleted,
      userRating: userRating ?? this.userRating,
      notes: notes ?? this.notes,
      usedAt: usedAt ?? this.usedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (contentItemId.present) {
      map['content_item_id'] = Variable<int>(contentItemId.value);
    }
    if (rundownDate.present) {
      map['rundown_date'] = Variable<String>(rundownDate.value);
    }
    if (wasCompleted.present) {
      map['was_completed'] = Variable<bool>(wasCompleted.value);
    }
    if (userRating.present) {
      map['user_rating'] = Variable<int>(userRating.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (usedAt.present) {
      map['used_at'] = Variable<DateTime>(usedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContentUsageLogCompanion(')
          ..write('id: $id, ')
          ..write('contentItemId: $contentItemId, ')
          ..write('rundownDate: $rundownDate, ')
          ..write('wasCompleted: $wasCompleted, ')
          ..write('userRating: $userRating, ')
          ..write('notes: $notes, ')
          ..write('usedAt: $usedAt')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(Insertable<AppSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String key;
  final String value;
  const AppSetting({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      key: Value(key),
      value: Value(value),
    );
  }

  factory AppSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  AppSetting copyWith({String? key, String? value}) => AppSetting(
        key: key ?? this.key,
        value: value ?? this.value,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.key == this.key &&
          other.value == this.value);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        value = Value(value);
  static Insertable<AppSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith(
      {Value<String>? key, Value<String>? value, Value<int>? rowid}) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DailyRundownsTable dailyRundowns = $DailyRundownsTable(this);
  late final $DreamsTable dreams = $DreamsTable(this);
  late final $DreamCharactersTable dreamCharacters =
      $DreamCharactersTable(this);
  late final $DreamPlacesTable dreamPlaces = $DreamPlacesTable(this);
  late final $DreamTagsTable dreamTags = $DreamTagsTable(this);
  late final $DreamCharacterLinksTable dreamCharacterLinks =
      $DreamCharacterLinksTable(this);
  late final $DreamPlaceLinksTable dreamPlaceLinks =
      $DreamPlaceLinksTable(this);
  late final $DreamTagLinksTable dreamTagLinks = $DreamTagLinksTable(this);
  late final $ContentItemsTable contentItems = $ContentItemsTable(this);
  late final $ObeLogsTable obeLogs = $ObeLogsTable(this);
  late final $ObeLocationVisitsTable obeLocationVisits =
      $ObeLocationVisitsTable(this);
  late final $ContentUsageLogTable contentUsageLog =
      $ContentUsageLogTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final DailyRundownDao dailyRundownDao =
      DailyRundownDao(this as AppDatabase);
  late final DreamDao dreamDao = DreamDao(this as AppDatabase);
  late final DreamEntityDao dreamEntityDao =
      DreamEntityDao(this as AppDatabase);
  late final ObeDao obeDao = ObeDao(this as AppDatabase);
  late final ContentDao contentDao = ContentDao(this as AppDatabase);
  late final CalendarDao calendarDao = CalendarDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        dailyRundowns,
        dreams,
        dreamCharacters,
        dreamPlaces,
        dreamTags,
        dreamCharacterLinks,
        dreamPlaceLinks,
        dreamTagLinks,
        contentItems,
        obeLogs,
        obeLocationVisits,
        contentUsageLog,
        appSettings
      ];
}

typedef $$DailyRundownsTableCreateCompanionBuilder = DailyRundownsCompanion
    Function({
  required String id,
  Value<int?> morningMood,
  Value<int?> eveningMood,
  Value<int?> morningEnergy,
  Value<int?> eveningEnergy,
  Value<int?> sleepQuality,
  Value<int?> sleepDurationMinutes,
  Value<String?> highlights,
  Value<String?> challenges,
  Value<String?> gratitude,
  Value<String?> intentions,
  Value<String?> reflections,
  Value<String?> affirmationOfDay,
  Value<String?> bodyAwareness,
  Value<bool> didMeditate,
  Value<bool> didVisualize,
  Value<bool> didBodyScan,
  Value<bool> didAffirmations,
  Value<bool> ritualClear,
  Value<bool> ritualTone,
  Value<bool> ritualField,
  Value<bool> ritualAffirmation,
  Value<String?> sleepIntention,
  Value<int?> bedtimeHour,
  Value<int?> bedtimeMinute,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$DailyRundownsTableUpdateCompanionBuilder = DailyRundownsCompanion
    Function({
  Value<String> id,
  Value<int?> morningMood,
  Value<int?> eveningMood,
  Value<int?> morningEnergy,
  Value<int?> eveningEnergy,
  Value<int?> sleepQuality,
  Value<int?> sleepDurationMinutes,
  Value<String?> highlights,
  Value<String?> challenges,
  Value<String?> gratitude,
  Value<String?> intentions,
  Value<String?> reflections,
  Value<String?> affirmationOfDay,
  Value<String?> bodyAwareness,
  Value<bool> didMeditate,
  Value<bool> didVisualize,
  Value<bool> didBodyScan,
  Value<bool> didAffirmations,
  Value<bool> ritualClear,
  Value<bool> ritualTone,
  Value<bool> ritualField,
  Value<bool> ritualAffirmation,
  Value<String?> sleepIntention,
  Value<int?> bedtimeHour,
  Value<int?> bedtimeMinute,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$DailyRundownsTableReferences
    extends BaseReferences<_$AppDatabase, $DailyRundownsTable, DailyRundown> {
  $$DailyRundownsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DreamsTable, List<Dream>> _dreamsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.dreams,
          aliasName:
              $_aliasNameGenerator(db.dailyRundowns.id, db.dreams.rundownDate));

  $$DreamsTableProcessedTableManager get dreamsRefs {
    final manager = $$DreamsTableTableManager($_db, $_db.dreams)
        .filter((f) => f.rundownDate.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dreamsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ObeLogsTable, List<ObeLog>> _obeLogsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.obeLogs,
          aliasName: $_aliasNameGenerator(
              db.dailyRundowns.id, db.obeLogs.rundownDate));

  $$ObeLogsTableProcessedTableManager get obeLogsRefs {
    final manager = $$ObeLogsTableTableManager($_db, $_db.obeLogs)
        .filter((f) => f.rundownDate.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_obeLogsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ContentUsageLogTable, List<ContentUsageLogData>>
      _contentUsageLogRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.contentUsageLog,
              aliasName: $_aliasNameGenerator(
                  db.dailyRundowns.id, db.contentUsageLog.rundownDate));

  $$ContentUsageLogTableProcessedTableManager get contentUsageLogRefs {
    final manager = $$ContentUsageLogTableTableManager(
            $_db, $_db.contentUsageLog)
        .filter((f) => f.rundownDate.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_contentUsageLogRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DailyRundownsTableFilterComposer
    extends Composer<_$AppDatabase, $DailyRundownsTable> {
  $$DailyRundownsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get morningMood => $composableBuilder(
      column: $table.morningMood, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get eveningMood => $composableBuilder(
      column: $table.eveningMood, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get morningEnergy => $composableBuilder(
      column: $table.morningEnergy, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get eveningEnergy => $composableBuilder(
      column: $table.eveningEnergy, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sleepQuality => $composableBuilder(
      column: $table.sleepQuality, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sleepDurationMinutes => $composableBuilder(
      column: $table.sleepDurationMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get highlights => $composableBuilder(
      column: $table.highlights, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get challenges => $composableBuilder(
      column: $table.challenges, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gratitude => $composableBuilder(
      column: $table.gratitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get intentions => $composableBuilder(
      column: $table.intentions, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reflections => $composableBuilder(
      column: $table.reflections, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get affirmationOfDay => $composableBuilder(
      column: $table.affirmationOfDay,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bodyAwareness => $composableBuilder(
      column: $table.bodyAwareness, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get didMeditate => $composableBuilder(
      column: $table.didMeditate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get didVisualize => $composableBuilder(
      column: $table.didVisualize, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get didBodyScan => $composableBuilder(
      column: $table.didBodyScan, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get didAffirmations => $composableBuilder(
      column: $table.didAffirmations,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get ritualClear => $composableBuilder(
      column: $table.ritualClear, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get ritualTone => $composableBuilder(
      column: $table.ritualTone, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get ritualField => $composableBuilder(
      column: $table.ritualField, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get ritualAffirmation => $composableBuilder(
      column: $table.ritualAffirmation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sleepIntention => $composableBuilder(
      column: $table.sleepIntention,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bedtimeHour => $composableBuilder(
      column: $table.bedtimeHour, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bedtimeMinute => $composableBuilder(
      column: $table.bedtimeMinute, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> dreamsRefs(
      Expression<bool> Function($$DreamsTableFilterComposer f) f) {
    final $$DreamsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dreams,
        getReferencedColumn: (t) => t.rundownDate,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamsTableFilterComposer(
              $db: $db,
              $table: $db.dreams,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> obeLogsRefs(
      Expression<bool> Function($$ObeLogsTableFilterComposer f) f) {
    final $$ObeLogsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.obeLogs,
        getReferencedColumn: (t) => t.rundownDate,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ObeLogsTableFilterComposer(
              $db: $db,
              $table: $db.obeLogs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> contentUsageLogRefs(
      Expression<bool> Function($$ContentUsageLogTableFilterComposer f) f) {
    final $$ContentUsageLogTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.contentUsageLog,
        getReferencedColumn: (t) => t.rundownDate,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentUsageLogTableFilterComposer(
              $db: $db,
              $table: $db.contentUsageLog,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DailyRundownsTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyRundownsTable> {
  $$DailyRundownsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get morningMood => $composableBuilder(
      column: $table.morningMood, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get eveningMood => $composableBuilder(
      column: $table.eveningMood, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get morningEnergy => $composableBuilder(
      column: $table.morningEnergy,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get eveningEnergy => $composableBuilder(
      column: $table.eveningEnergy,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sleepQuality => $composableBuilder(
      column: $table.sleepQuality,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sleepDurationMinutes => $composableBuilder(
      column: $table.sleepDurationMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get highlights => $composableBuilder(
      column: $table.highlights, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get challenges => $composableBuilder(
      column: $table.challenges, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gratitude => $composableBuilder(
      column: $table.gratitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get intentions => $composableBuilder(
      column: $table.intentions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reflections => $composableBuilder(
      column: $table.reflections, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get affirmationOfDay => $composableBuilder(
      column: $table.affirmationOfDay,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bodyAwareness => $composableBuilder(
      column: $table.bodyAwareness,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get didMeditate => $composableBuilder(
      column: $table.didMeditate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get didVisualize => $composableBuilder(
      column: $table.didVisualize,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get didBodyScan => $composableBuilder(
      column: $table.didBodyScan, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get didAffirmations => $composableBuilder(
      column: $table.didAffirmations,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get ritualClear => $composableBuilder(
      column: $table.ritualClear, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get ritualTone => $composableBuilder(
      column: $table.ritualTone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get ritualField => $composableBuilder(
      column: $table.ritualField, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get ritualAffirmation => $composableBuilder(
      column: $table.ritualAffirmation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sleepIntention => $composableBuilder(
      column: $table.sleepIntention,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bedtimeHour => $composableBuilder(
      column: $table.bedtimeHour, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bedtimeMinute => $composableBuilder(
      column: $table.bedtimeMinute,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$DailyRundownsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyRundownsTable> {
  $$DailyRundownsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get morningMood => $composableBuilder(
      column: $table.morningMood, builder: (column) => column);

  GeneratedColumn<int> get eveningMood => $composableBuilder(
      column: $table.eveningMood, builder: (column) => column);

  GeneratedColumn<int> get morningEnergy => $composableBuilder(
      column: $table.morningEnergy, builder: (column) => column);

  GeneratedColumn<int> get eveningEnergy => $composableBuilder(
      column: $table.eveningEnergy, builder: (column) => column);

  GeneratedColumn<int> get sleepQuality => $composableBuilder(
      column: $table.sleepQuality, builder: (column) => column);

  GeneratedColumn<int> get sleepDurationMinutes => $composableBuilder(
      column: $table.sleepDurationMinutes, builder: (column) => column);

  GeneratedColumn<String> get highlights => $composableBuilder(
      column: $table.highlights, builder: (column) => column);

  GeneratedColumn<String> get challenges => $composableBuilder(
      column: $table.challenges, builder: (column) => column);

  GeneratedColumn<String> get gratitude =>
      $composableBuilder(column: $table.gratitude, builder: (column) => column);

  GeneratedColumn<String> get intentions => $composableBuilder(
      column: $table.intentions, builder: (column) => column);

  GeneratedColumn<String> get reflections => $composableBuilder(
      column: $table.reflections, builder: (column) => column);

  GeneratedColumn<String> get affirmationOfDay => $composableBuilder(
      column: $table.affirmationOfDay, builder: (column) => column);

  GeneratedColumn<String> get bodyAwareness => $composableBuilder(
      column: $table.bodyAwareness, builder: (column) => column);

  GeneratedColumn<bool> get didMeditate => $composableBuilder(
      column: $table.didMeditate, builder: (column) => column);

  GeneratedColumn<bool> get didVisualize => $composableBuilder(
      column: $table.didVisualize, builder: (column) => column);

  GeneratedColumn<bool> get didBodyScan => $composableBuilder(
      column: $table.didBodyScan, builder: (column) => column);

  GeneratedColumn<bool> get didAffirmations => $composableBuilder(
      column: $table.didAffirmations, builder: (column) => column);

  GeneratedColumn<bool> get ritualClear => $composableBuilder(
      column: $table.ritualClear, builder: (column) => column);

  GeneratedColumn<bool> get ritualTone => $composableBuilder(
      column: $table.ritualTone, builder: (column) => column);

  GeneratedColumn<bool> get ritualField => $composableBuilder(
      column: $table.ritualField, builder: (column) => column);

  GeneratedColumn<bool> get ritualAffirmation => $composableBuilder(
      column: $table.ritualAffirmation, builder: (column) => column);

  GeneratedColumn<String> get sleepIntention => $composableBuilder(
      column: $table.sleepIntention, builder: (column) => column);

  GeneratedColumn<int> get bedtimeHour => $composableBuilder(
      column: $table.bedtimeHour, builder: (column) => column);

  GeneratedColumn<int> get bedtimeMinute => $composableBuilder(
      column: $table.bedtimeMinute, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> dreamsRefs<T extends Object>(
      Expression<T> Function($$DreamsTableAnnotationComposer a) f) {
    final $$DreamsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dreams,
        getReferencedColumn: (t) => t.rundownDate,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamsTableAnnotationComposer(
              $db: $db,
              $table: $db.dreams,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> obeLogsRefs<T extends Object>(
      Expression<T> Function($$ObeLogsTableAnnotationComposer a) f) {
    final $$ObeLogsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.obeLogs,
        getReferencedColumn: (t) => t.rundownDate,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ObeLogsTableAnnotationComposer(
              $db: $db,
              $table: $db.obeLogs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> contentUsageLogRefs<T extends Object>(
      Expression<T> Function($$ContentUsageLogTableAnnotationComposer a) f) {
    final $$ContentUsageLogTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.contentUsageLog,
        getReferencedColumn: (t) => t.rundownDate,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentUsageLogTableAnnotationComposer(
              $db: $db,
              $table: $db.contentUsageLog,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DailyRundownsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DailyRundownsTable,
    DailyRundown,
    $$DailyRundownsTableFilterComposer,
    $$DailyRundownsTableOrderingComposer,
    $$DailyRundownsTableAnnotationComposer,
    $$DailyRundownsTableCreateCompanionBuilder,
    $$DailyRundownsTableUpdateCompanionBuilder,
    (DailyRundown, $$DailyRundownsTableReferences),
    DailyRundown,
    PrefetchHooks Function(
        {bool dreamsRefs, bool obeLogsRefs, bool contentUsageLogRefs})> {
  $$DailyRundownsTableTableManager(_$AppDatabase db, $DailyRundownsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyRundownsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyRundownsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyRundownsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<int?> morningMood = const Value.absent(),
            Value<int?> eveningMood = const Value.absent(),
            Value<int?> morningEnergy = const Value.absent(),
            Value<int?> eveningEnergy = const Value.absent(),
            Value<int?> sleepQuality = const Value.absent(),
            Value<int?> sleepDurationMinutes = const Value.absent(),
            Value<String?> highlights = const Value.absent(),
            Value<String?> challenges = const Value.absent(),
            Value<String?> gratitude = const Value.absent(),
            Value<String?> intentions = const Value.absent(),
            Value<String?> reflections = const Value.absent(),
            Value<String?> affirmationOfDay = const Value.absent(),
            Value<String?> bodyAwareness = const Value.absent(),
            Value<bool> didMeditate = const Value.absent(),
            Value<bool> didVisualize = const Value.absent(),
            Value<bool> didBodyScan = const Value.absent(),
            Value<bool> didAffirmations = const Value.absent(),
            Value<bool> ritualClear = const Value.absent(),
            Value<bool> ritualTone = const Value.absent(),
            Value<bool> ritualField = const Value.absent(),
            Value<bool> ritualAffirmation = const Value.absent(),
            Value<String?> sleepIntention = const Value.absent(),
            Value<int?> bedtimeHour = const Value.absent(),
            Value<int?> bedtimeMinute = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DailyRundownsCompanion(
            id: id,
            morningMood: morningMood,
            eveningMood: eveningMood,
            morningEnergy: morningEnergy,
            eveningEnergy: eveningEnergy,
            sleepQuality: sleepQuality,
            sleepDurationMinutes: sleepDurationMinutes,
            highlights: highlights,
            challenges: challenges,
            gratitude: gratitude,
            intentions: intentions,
            reflections: reflections,
            affirmationOfDay: affirmationOfDay,
            bodyAwareness: bodyAwareness,
            didMeditate: didMeditate,
            didVisualize: didVisualize,
            didBodyScan: didBodyScan,
            didAffirmations: didAffirmations,
            ritualClear: ritualClear,
            ritualTone: ritualTone,
            ritualField: ritualField,
            ritualAffirmation: ritualAffirmation,
            sleepIntention: sleepIntention,
            bedtimeHour: bedtimeHour,
            bedtimeMinute: bedtimeMinute,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<int?> morningMood = const Value.absent(),
            Value<int?> eveningMood = const Value.absent(),
            Value<int?> morningEnergy = const Value.absent(),
            Value<int?> eveningEnergy = const Value.absent(),
            Value<int?> sleepQuality = const Value.absent(),
            Value<int?> sleepDurationMinutes = const Value.absent(),
            Value<String?> highlights = const Value.absent(),
            Value<String?> challenges = const Value.absent(),
            Value<String?> gratitude = const Value.absent(),
            Value<String?> intentions = const Value.absent(),
            Value<String?> reflections = const Value.absent(),
            Value<String?> affirmationOfDay = const Value.absent(),
            Value<String?> bodyAwareness = const Value.absent(),
            Value<bool> didMeditate = const Value.absent(),
            Value<bool> didVisualize = const Value.absent(),
            Value<bool> didBodyScan = const Value.absent(),
            Value<bool> didAffirmations = const Value.absent(),
            Value<bool> ritualClear = const Value.absent(),
            Value<bool> ritualTone = const Value.absent(),
            Value<bool> ritualField = const Value.absent(),
            Value<bool> ritualAffirmation = const Value.absent(),
            Value<String?> sleepIntention = const Value.absent(),
            Value<int?> bedtimeHour = const Value.absent(),
            Value<int?> bedtimeMinute = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DailyRundownsCompanion.insert(
            id: id,
            morningMood: morningMood,
            eveningMood: eveningMood,
            morningEnergy: morningEnergy,
            eveningEnergy: eveningEnergy,
            sleepQuality: sleepQuality,
            sleepDurationMinutes: sleepDurationMinutes,
            highlights: highlights,
            challenges: challenges,
            gratitude: gratitude,
            intentions: intentions,
            reflections: reflections,
            affirmationOfDay: affirmationOfDay,
            bodyAwareness: bodyAwareness,
            didMeditate: didMeditate,
            didVisualize: didVisualize,
            didBodyScan: didBodyScan,
            didAffirmations: didAffirmations,
            ritualClear: ritualClear,
            ritualTone: ritualTone,
            ritualField: ritualField,
            ritualAffirmation: ritualAffirmation,
            sleepIntention: sleepIntention,
            bedtimeHour: bedtimeHour,
            bedtimeMinute: bedtimeMinute,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DailyRundownsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {dreamsRefs = false,
              obeLogsRefs = false,
              contentUsageLogRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (dreamsRefs) db.dreams,
                if (obeLogsRefs) db.obeLogs,
                if (contentUsageLogRefs) db.contentUsageLog
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dreamsRefs)
                    await $_getPrefetchedData<DailyRundown, $DailyRundownsTable,
                            Dream>(
                        currentTable: table,
                        referencedTable:
                            $$DailyRundownsTableReferences._dreamsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DailyRundownsTableReferences(db, table, p0)
                                .dreamsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.rundownDate == item.id),
                        typedResults: items),
                  if (obeLogsRefs)
                    await $_getPrefetchedData<DailyRundown, $DailyRundownsTable,
                            ObeLog>(
                        currentTable: table,
                        referencedTable: $$DailyRundownsTableReferences
                            ._obeLogsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DailyRundownsTableReferences(db, table, p0)
                                .obeLogsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.rundownDate == item.id),
                        typedResults: items),
                  if (contentUsageLogRefs)
                    await $_getPrefetchedData<DailyRundown, $DailyRundownsTable,
                            ContentUsageLogData>(
                        currentTable: table,
                        referencedTable: $$DailyRundownsTableReferences
                            ._contentUsageLogRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DailyRundownsTableReferences(db, table, p0)
                                .contentUsageLogRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.rundownDate == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DailyRundownsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DailyRundownsTable,
    DailyRundown,
    $$DailyRundownsTableFilterComposer,
    $$DailyRundownsTableOrderingComposer,
    $$DailyRundownsTableAnnotationComposer,
    $$DailyRundownsTableCreateCompanionBuilder,
    $$DailyRundownsTableUpdateCompanionBuilder,
    (DailyRundown, $$DailyRundownsTableReferences),
    DailyRundown,
    PrefetchHooks Function(
        {bool dreamsRefs, bool obeLogsRefs, bool contentUsageLogRefs})>;
typedef $$DreamsTableCreateCompanionBuilder = DreamsCompanion Function({
  Value<int> id,
  Value<String?> rundownDate,
  Value<int?> continuationOfId,
  Value<String?> continuationChainId,
  required String title,
  required String description,
  Value<String?> summary,
  Value<int> dreamType,
  Value<int> clarity,
  Value<String?> emotionsJson,
  Value<bool> achievedLucidity,
  Value<String?> lucidityTrigger,
  Value<int?> lucidDurationEstimateMinutes,
  Value<int?> estimatedTimeMinutes,
  Value<int?> significanceRating,
  Value<bool> isPrivate,
  Value<bool> isArchived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$DreamsTableUpdateCompanionBuilder = DreamsCompanion Function({
  Value<int> id,
  Value<String?> rundownDate,
  Value<int?> continuationOfId,
  Value<String?> continuationChainId,
  Value<String> title,
  Value<String> description,
  Value<String?> summary,
  Value<int> dreamType,
  Value<int> clarity,
  Value<String?> emotionsJson,
  Value<bool> achievedLucidity,
  Value<String?> lucidityTrigger,
  Value<int?> lucidDurationEstimateMinutes,
  Value<int?> estimatedTimeMinutes,
  Value<int?> significanceRating,
  Value<bool> isPrivate,
  Value<bool> isArchived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$DreamsTableReferences
    extends BaseReferences<_$AppDatabase, $DreamsTable, Dream> {
  $$DreamsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DailyRundownsTable _rundownDateTable(_$AppDatabase db) =>
      db.dailyRundowns.createAlias(
          $_aliasNameGenerator(db.dreams.rundownDate, db.dailyRundowns.id));

  $$DailyRundownsTableProcessedTableManager? get rundownDate {
    final $_column = $_itemColumn<String>('rundown_date');
    if ($_column == null) return null;
    final manager = $$DailyRundownsTableTableManager($_db, $_db.dailyRundowns)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_rundownDateTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $DreamsTable _continuationOfIdTable(_$AppDatabase db) =>
      db.dreams.createAlias(
          $_aliasNameGenerator(db.dreams.continuationOfId, db.dreams.id));

  $$DreamsTableProcessedTableManager? get continuationOfId {
    final $_column = $_itemColumn<int>('continuation_of_id');
    if ($_column == null) return null;
    final manager = $$DreamsTableTableManager($_db, $_db.dreams)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_continuationOfIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$DreamCharacterLinksTable,
      List<DreamCharacterLink>> _dreamCharacterLinksRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.dreamCharacterLinks,
          aliasName: $_aliasNameGenerator(
              db.dreams.id, db.dreamCharacterLinks.dreamId));

  $$DreamCharacterLinksTableProcessedTableManager get dreamCharacterLinksRefs {
    final manager =
        $$DreamCharacterLinksTableTableManager($_db, $_db.dreamCharacterLinks)
            .filter((f) => f.dreamId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_dreamCharacterLinksRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$DreamPlaceLinksTable, List<DreamPlaceLink>>
      _dreamPlaceLinksRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.dreamPlaceLinks,
              aliasName: $_aliasNameGenerator(
                  db.dreams.id, db.dreamPlaceLinks.dreamId));

  $$DreamPlaceLinksTableProcessedTableManager get dreamPlaceLinksRefs {
    final manager =
        $$DreamPlaceLinksTableTableManager($_db, $_db.dreamPlaceLinks)
            .filter((f) => f.dreamId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_dreamPlaceLinksRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$DreamTagLinksTable, List<DreamTagLink>>
      _dreamTagLinksRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.dreamTagLinks,
              aliasName:
                  $_aliasNameGenerator(db.dreams.id, db.dreamTagLinks.dreamId));

  $$DreamTagLinksTableProcessedTableManager get dreamTagLinksRefs {
    final manager = $$DreamTagLinksTableTableManager($_db, $_db.dreamTagLinks)
        .filter((f) => f.dreamId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dreamTagLinksRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DreamsTableFilterComposer
    extends Composer<_$AppDatabase, $DreamsTable> {
  $$DreamsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get continuationChainId => $composableBuilder(
      column: $table.continuationChainId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dreamType => $composableBuilder(
      column: $table.dreamType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get clarity => $composableBuilder(
      column: $table.clarity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get emotionsJson => $composableBuilder(
      column: $table.emotionsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get achievedLucidity => $composableBuilder(
      column: $table.achievedLucidity,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lucidityTrigger => $composableBuilder(
      column: $table.lucidityTrigger,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lucidDurationEstimateMinutes => $composableBuilder(
      column: $table.lucidDurationEstimateMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get estimatedTimeMinutes => $composableBuilder(
      column: $table.estimatedTimeMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get significanceRating => $composableBuilder(
      column: $table.significanceRating,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPrivate => $composableBuilder(
      column: $table.isPrivate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$DailyRundownsTableFilterComposer get rundownDate {
    final $$DailyRundownsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.rundownDate,
        referencedTable: $db.dailyRundowns,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DailyRundownsTableFilterComposer(
              $db: $db,
              $table: $db.dailyRundowns,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DreamsTableFilterComposer get continuationOfId {
    final $$DreamsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.continuationOfId,
        referencedTable: $db.dreams,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamsTableFilterComposer(
              $db: $db,
              $table: $db.dreams,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> dreamCharacterLinksRefs(
      Expression<bool> Function($$DreamCharacterLinksTableFilterComposer f) f) {
    final $$DreamCharacterLinksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dreamCharacterLinks,
        getReferencedColumn: (t) => t.dreamId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamCharacterLinksTableFilterComposer(
              $db: $db,
              $table: $db.dreamCharacterLinks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> dreamPlaceLinksRefs(
      Expression<bool> Function($$DreamPlaceLinksTableFilterComposer f) f) {
    final $$DreamPlaceLinksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dreamPlaceLinks,
        getReferencedColumn: (t) => t.dreamId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamPlaceLinksTableFilterComposer(
              $db: $db,
              $table: $db.dreamPlaceLinks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> dreamTagLinksRefs(
      Expression<bool> Function($$DreamTagLinksTableFilterComposer f) f) {
    final $$DreamTagLinksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dreamTagLinks,
        getReferencedColumn: (t) => t.dreamId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamTagLinksTableFilterComposer(
              $db: $db,
              $table: $db.dreamTagLinks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DreamsTableOrderingComposer
    extends Composer<_$AppDatabase, $DreamsTable> {
  $$DreamsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get continuationChainId => $composableBuilder(
      column: $table.continuationChainId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dreamType => $composableBuilder(
      column: $table.dreamType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get clarity => $composableBuilder(
      column: $table.clarity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get emotionsJson => $composableBuilder(
      column: $table.emotionsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get achievedLucidity => $composableBuilder(
      column: $table.achievedLucidity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lucidityTrigger => $composableBuilder(
      column: $table.lucidityTrigger,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lucidDurationEstimateMinutes => $composableBuilder(
      column: $table.lucidDurationEstimateMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get estimatedTimeMinutes => $composableBuilder(
      column: $table.estimatedTimeMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get significanceRating => $composableBuilder(
      column: $table.significanceRating,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPrivate => $composableBuilder(
      column: $table.isPrivate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$DailyRundownsTableOrderingComposer get rundownDate {
    final $$DailyRundownsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.rundownDate,
        referencedTable: $db.dailyRundowns,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DailyRundownsTableOrderingComposer(
              $db: $db,
              $table: $db.dailyRundowns,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DreamsTableOrderingComposer get continuationOfId {
    final $$DreamsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.continuationOfId,
        referencedTable: $db.dreams,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamsTableOrderingComposer(
              $db: $db,
              $table: $db.dreams,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DreamsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DreamsTable> {
  $$DreamsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get continuationChainId => $composableBuilder(
      column: $table.continuationChainId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<int> get dreamType =>
      $composableBuilder(column: $table.dreamType, builder: (column) => column);

  GeneratedColumn<int> get clarity =>
      $composableBuilder(column: $table.clarity, builder: (column) => column);

  GeneratedColumn<String> get emotionsJson => $composableBuilder(
      column: $table.emotionsJson, builder: (column) => column);

  GeneratedColumn<bool> get achievedLucidity => $composableBuilder(
      column: $table.achievedLucidity, builder: (column) => column);

  GeneratedColumn<String> get lucidityTrigger => $composableBuilder(
      column: $table.lucidityTrigger, builder: (column) => column);

  GeneratedColumn<int> get lucidDurationEstimateMinutes => $composableBuilder(
      column: $table.lucidDurationEstimateMinutes, builder: (column) => column);

  GeneratedColumn<int> get estimatedTimeMinutes => $composableBuilder(
      column: $table.estimatedTimeMinutes, builder: (column) => column);

  GeneratedColumn<int> get significanceRating => $composableBuilder(
      column: $table.significanceRating, builder: (column) => column);

  GeneratedColumn<bool> get isPrivate =>
      $composableBuilder(column: $table.isPrivate, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$DailyRundownsTableAnnotationComposer get rundownDate {
    final $$DailyRundownsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.rundownDate,
        referencedTable: $db.dailyRundowns,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DailyRundownsTableAnnotationComposer(
              $db: $db,
              $table: $db.dailyRundowns,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DreamsTableAnnotationComposer get continuationOfId {
    final $$DreamsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.continuationOfId,
        referencedTable: $db.dreams,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamsTableAnnotationComposer(
              $db: $db,
              $table: $db.dreams,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> dreamCharacterLinksRefs<T extends Object>(
      Expression<T> Function($$DreamCharacterLinksTableAnnotationComposer a)
          f) {
    final $$DreamCharacterLinksTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.dreamCharacterLinks,
            getReferencedColumn: (t) => t.dreamId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DreamCharacterLinksTableAnnotationComposer(
                  $db: $db,
                  $table: $db.dreamCharacterLinks,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> dreamPlaceLinksRefs<T extends Object>(
      Expression<T> Function($$DreamPlaceLinksTableAnnotationComposer a) f) {
    final $$DreamPlaceLinksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dreamPlaceLinks,
        getReferencedColumn: (t) => t.dreamId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamPlaceLinksTableAnnotationComposer(
              $db: $db,
              $table: $db.dreamPlaceLinks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> dreamTagLinksRefs<T extends Object>(
      Expression<T> Function($$DreamTagLinksTableAnnotationComposer a) f) {
    final $$DreamTagLinksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dreamTagLinks,
        getReferencedColumn: (t) => t.dreamId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamTagLinksTableAnnotationComposer(
              $db: $db,
              $table: $db.dreamTagLinks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DreamsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DreamsTable,
    Dream,
    $$DreamsTableFilterComposer,
    $$DreamsTableOrderingComposer,
    $$DreamsTableAnnotationComposer,
    $$DreamsTableCreateCompanionBuilder,
    $$DreamsTableUpdateCompanionBuilder,
    (Dream, $$DreamsTableReferences),
    Dream,
    PrefetchHooks Function(
        {bool rundownDate,
        bool continuationOfId,
        bool dreamCharacterLinksRefs,
        bool dreamPlaceLinksRefs,
        bool dreamTagLinksRefs})> {
  $$DreamsTableTableManager(_$AppDatabase db, $DreamsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DreamsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DreamsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DreamsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> rundownDate = const Value.absent(),
            Value<int?> continuationOfId = const Value.absent(),
            Value<String?> continuationChainId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String?> summary = const Value.absent(),
            Value<int> dreamType = const Value.absent(),
            Value<int> clarity = const Value.absent(),
            Value<String?> emotionsJson = const Value.absent(),
            Value<bool> achievedLucidity = const Value.absent(),
            Value<String?> lucidityTrigger = const Value.absent(),
            Value<int?> lucidDurationEstimateMinutes = const Value.absent(),
            Value<int?> estimatedTimeMinutes = const Value.absent(),
            Value<int?> significanceRating = const Value.absent(),
            Value<bool> isPrivate = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              DreamsCompanion(
            id: id,
            rundownDate: rundownDate,
            continuationOfId: continuationOfId,
            continuationChainId: continuationChainId,
            title: title,
            description: description,
            summary: summary,
            dreamType: dreamType,
            clarity: clarity,
            emotionsJson: emotionsJson,
            achievedLucidity: achievedLucidity,
            lucidityTrigger: lucidityTrigger,
            lucidDurationEstimateMinutes: lucidDurationEstimateMinutes,
            estimatedTimeMinutes: estimatedTimeMinutes,
            significanceRating: significanceRating,
            isPrivate: isPrivate,
            isArchived: isArchived,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> rundownDate = const Value.absent(),
            Value<int?> continuationOfId = const Value.absent(),
            Value<String?> continuationChainId = const Value.absent(),
            required String title,
            required String description,
            Value<String?> summary = const Value.absent(),
            Value<int> dreamType = const Value.absent(),
            Value<int> clarity = const Value.absent(),
            Value<String?> emotionsJson = const Value.absent(),
            Value<bool> achievedLucidity = const Value.absent(),
            Value<String?> lucidityTrigger = const Value.absent(),
            Value<int?> lucidDurationEstimateMinutes = const Value.absent(),
            Value<int?> estimatedTimeMinutes = const Value.absent(),
            Value<int?> significanceRating = const Value.absent(),
            Value<bool> isPrivate = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              DreamsCompanion.insert(
            id: id,
            rundownDate: rundownDate,
            continuationOfId: continuationOfId,
            continuationChainId: continuationChainId,
            title: title,
            description: description,
            summary: summary,
            dreamType: dreamType,
            clarity: clarity,
            emotionsJson: emotionsJson,
            achievedLucidity: achievedLucidity,
            lucidityTrigger: lucidityTrigger,
            lucidDurationEstimateMinutes: lucidDurationEstimateMinutes,
            estimatedTimeMinutes: estimatedTimeMinutes,
            significanceRating: significanceRating,
            isPrivate: isPrivate,
            isArchived: isArchived,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$DreamsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {rundownDate = false,
              continuationOfId = false,
              dreamCharacterLinksRefs = false,
              dreamPlaceLinksRefs = false,
              dreamTagLinksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (dreamCharacterLinksRefs) db.dreamCharacterLinks,
                if (dreamPlaceLinksRefs) db.dreamPlaceLinks,
                if (dreamTagLinksRefs) db.dreamTagLinks
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (rundownDate) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.rundownDate,
                    referencedTable:
                        $$DreamsTableReferences._rundownDateTable(db),
                    referencedColumn:
                        $$DreamsTableReferences._rundownDateTable(db).id,
                  ) as T;
                }
                if (continuationOfId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.continuationOfId,
                    referencedTable:
                        $$DreamsTableReferences._continuationOfIdTable(db),
                    referencedColumn:
                        $$DreamsTableReferences._continuationOfIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dreamCharacterLinksRefs)
                    await $_getPrefetchedData<Dream, $DreamsTable,
                            DreamCharacterLink>(
                        currentTable: table,
                        referencedTable: $$DreamsTableReferences
                            ._dreamCharacterLinksRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DreamsTableReferences(db, table, p0)
                                .dreamCharacterLinksRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.dreamId == item.id),
                        typedResults: items),
                  if (dreamPlaceLinksRefs)
                    await $_getPrefetchedData<Dream, $DreamsTable,
                            DreamPlaceLink>(
                        currentTable: table,
                        referencedTable: $$DreamsTableReferences
                            ._dreamPlaceLinksRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DreamsTableReferences(db, table, p0)
                                .dreamPlaceLinksRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.dreamId == item.id),
                        typedResults: items),
                  if (dreamTagLinksRefs)
                    await $_getPrefetchedData<Dream, $DreamsTable,
                            DreamTagLink>(
                        currentTable: table,
                        referencedTable:
                            $$DreamsTableReferences._dreamTagLinksRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DreamsTableReferences(db, table, p0)
                                .dreamTagLinksRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.dreamId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DreamsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DreamsTable,
    Dream,
    $$DreamsTableFilterComposer,
    $$DreamsTableOrderingComposer,
    $$DreamsTableAnnotationComposer,
    $$DreamsTableCreateCompanionBuilder,
    $$DreamsTableUpdateCompanionBuilder,
    (Dream, $$DreamsTableReferences),
    Dream,
    PrefetchHooks Function(
        {bool rundownDate,
        bool continuationOfId,
        bool dreamCharacterLinksRefs,
        bool dreamPlaceLinksRefs,
        bool dreamTagLinksRefs})>;
typedef $$DreamCharactersTableCreateCompanionBuilder = DreamCharactersCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  Value<bool> isRealPerson,
  Value<String?> archetypeTag,
  Value<String?> avatarPath,
  Value<bool> isArchived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$DreamCharactersTableUpdateCompanionBuilder = DreamCharactersCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<bool> isRealPerson,
  Value<String?> archetypeTag,
  Value<String?> avatarPath,
  Value<bool> isArchived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$DreamCharactersTableReferences extends BaseReferences<
    _$AppDatabase, $DreamCharactersTable, DreamCharacter> {
  $$DreamCharactersTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DreamCharacterLinksTable,
      List<DreamCharacterLink>> _dreamCharacterLinksRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.dreamCharacterLinks,
          aliasName: $_aliasNameGenerator(
              db.dreamCharacters.id, db.dreamCharacterLinks.characterId));

  $$DreamCharacterLinksTableProcessedTableManager get dreamCharacterLinksRefs {
    final manager = $$DreamCharacterLinksTableTableManager(
            $_db, $_db.dreamCharacterLinks)
        .filter((f) => f.characterId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_dreamCharacterLinksRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DreamCharactersTableFilterComposer
    extends Composer<_$AppDatabase, $DreamCharactersTable> {
  $$DreamCharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRealPerson => $composableBuilder(
      column: $table.isRealPerson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get archetypeTag => $composableBuilder(
      column: $table.archetypeTag, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get avatarPath => $composableBuilder(
      column: $table.avatarPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> dreamCharacterLinksRefs(
      Expression<bool> Function($$DreamCharacterLinksTableFilterComposer f) f) {
    final $$DreamCharacterLinksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dreamCharacterLinks,
        getReferencedColumn: (t) => t.characterId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamCharacterLinksTableFilterComposer(
              $db: $db,
              $table: $db.dreamCharacterLinks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DreamCharactersTableOrderingComposer
    extends Composer<_$AppDatabase, $DreamCharactersTable> {
  $$DreamCharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRealPerson => $composableBuilder(
      column: $table.isRealPerson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get archetypeTag => $composableBuilder(
      column: $table.archetypeTag,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get avatarPath => $composableBuilder(
      column: $table.avatarPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$DreamCharactersTableAnnotationComposer
    extends Composer<_$AppDatabase, $DreamCharactersTable> {
  $$DreamCharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get isRealPerson => $composableBuilder(
      column: $table.isRealPerson, builder: (column) => column);

  GeneratedColumn<String> get archetypeTag => $composableBuilder(
      column: $table.archetypeTag, builder: (column) => column);

  GeneratedColumn<String> get avatarPath => $composableBuilder(
      column: $table.avatarPath, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> dreamCharacterLinksRefs<T extends Object>(
      Expression<T> Function($$DreamCharacterLinksTableAnnotationComposer a)
          f) {
    final $$DreamCharacterLinksTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.dreamCharacterLinks,
            getReferencedColumn: (t) => t.characterId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DreamCharacterLinksTableAnnotationComposer(
                  $db: $db,
                  $table: $db.dreamCharacterLinks,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$DreamCharactersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DreamCharactersTable,
    DreamCharacter,
    $$DreamCharactersTableFilterComposer,
    $$DreamCharactersTableOrderingComposer,
    $$DreamCharactersTableAnnotationComposer,
    $$DreamCharactersTableCreateCompanionBuilder,
    $$DreamCharactersTableUpdateCompanionBuilder,
    (DreamCharacter, $$DreamCharactersTableReferences),
    DreamCharacter,
    PrefetchHooks Function({bool dreamCharacterLinksRefs})> {
  $$DreamCharactersTableTableManager(
      _$AppDatabase db, $DreamCharactersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DreamCharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DreamCharactersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DreamCharactersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<bool> isRealPerson = const Value.absent(),
            Value<String?> archetypeTag = const Value.absent(),
            Value<String?> avatarPath = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              DreamCharactersCompanion(
            id: id,
            name: name,
            description: description,
            isRealPerson: isRealPerson,
            archetypeTag: archetypeTag,
            avatarPath: avatarPath,
            isArchived: isArchived,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<bool> isRealPerson = const Value.absent(),
            Value<String?> archetypeTag = const Value.absent(),
            Value<String?> avatarPath = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              DreamCharactersCompanion.insert(
            id: id,
            name: name,
            description: description,
            isRealPerson: isRealPerson,
            archetypeTag: archetypeTag,
            avatarPath: avatarPath,
            isArchived: isArchived,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DreamCharactersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({dreamCharacterLinksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (dreamCharacterLinksRefs) db.dreamCharacterLinks
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dreamCharacterLinksRefs)
                    await $_getPrefetchedData<DreamCharacter,
                            $DreamCharactersTable, DreamCharacterLink>(
                        currentTable: table,
                        referencedTable: $$DreamCharactersTableReferences
                            ._dreamCharacterLinksRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DreamCharactersTableReferences(db, table, p0)
                                .dreamCharacterLinksRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.characterId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DreamCharactersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DreamCharactersTable,
    DreamCharacter,
    $$DreamCharactersTableFilterComposer,
    $$DreamCharactersTableOrderingComposer,
    $$DreamCharactersTableAnnotationComposer,
    $$DreamCharactersTableCreateCompanionBuilder,
    $$DreamCharactersTableUpdateCompanionBuilder,
    (DreamCharacter, $$DreamCharactersTableReferences),
    DreamCharacter,
    PrefetchHooks Function({bool dreamCharacterLinksRefs})>;
typedef $$DreamPlacesTableCreateCompanionBuilder = DreamPlacesCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  Value<String?> category,
  Value<bool> isRealWorld,
  Value<String?> atmosphere,
  Value<bool> isArchived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$DreamPlacesTableUpdateCompanionBuilder = DreamPlacesCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<String?> category,
  Value<bool> isRealWorld,
  Value<String?> atmosphere,
  Value<bool> isArchived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$DreamPlacesTableReferences
    extends BaseReferences<_$AppDatabase, $DreamPlacesTable, DreamPlace> {
  $$DreamPlacesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DreamPlaceLinksTable, List<DreamPlaceLink>>
      _dreamPlaceLinksRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.dreamPlaceLinks,
              aliasName: $_aliasNameGenerator(
                  db.dreamPlaces.id, db.dreamPlaceLinks.placeId));

  $$DreamPlaceLinksTableProcessedTableManager get dreamPlaceLinksRefs {
    final manager =
        $$DreamPlaceLinksTableTableManager($_db, $_db.dreamPlaceLinks)
            .filter((f) => f.placeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_dreamPlaceLinksRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DreamPlacesTableFilterComposer
    extends Composer<_$AppDatabase, $DreamPlacesTable> {
  $$DreamPlacesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRealWorld => $composableBuilder(
      column: $table.isRealWorld, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get atmosphere => $composableBuilder(
      column: $table.atmosphere, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> dreamPlaceLinksRefs(
      Expression<bool> Function($$DreamPlaceLinksTableFilterComposer f) f) {
    final $$DreamPlaceLinksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dreamPlaceLinks,
        getReferencedColumn: (t) => t.placeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamPlaceLinksTableFilterComposer(
              $db: $db,
              $table: $db.dreamPlaceLinks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DreamPlacesTableOrderingComposer
    extends Composer<_$AppDatabase, $DreamPlacesTable> {
  $$DreamPlacesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRealWorld => $composableBuilder(
      column: $table.isRealWorld, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get atmosphere => $composableBuilder(
      column: $table.atmosphere, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$DreamPlacesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DreamPlacesTable> {
  $$DreamPlacesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get isRealWorld => $composableBuilder(
      column: $table.isRealWorld, builder: (column) => column);

  GeneratedColumn<String> get atmosphere => $composableBuilder(
      column: $table.atmosphere, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> dreamPlaceLinksRefs<T extends Object>(
      Expression<T> Function($$DreamPlaceLinksTableAnnotationComposer a) f) {
    final $$DreamPlaceLinksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dreamPlaceLinks,
        getReferencedColumn: (t) => t.placeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamPlaceLinksTableAnnotationComposer(
              $db: $db,
              $table: $db.dreamPlaceLinks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DreamPlacesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DreamPlacesTable,
    DreamPlace,
    $$DreamPlacesTableFilterComposer,
    $$DreamPlacesTableOrderingComposer,
    $$DreamPlacesTableAnnotationComposer,
    $$DreamPlacesTableCreateCompanionBuilder,
    $$DreamPlacesTableUpdateCompanionBuilder,
    (DreamPlace, $$DreamPlacesTableReferences),
    DreamPlace,
    PrefetchHooks Function({bool dreamPlaceLinksRefs})> {
  $$DreamPlacesTableTableManager(_$AppDatabase db, $DreamPlacesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DreamPlacesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DreamPlacesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DreamPlacesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<bool> isRealWorld = const Value.absent(),
            Value<String?> atmosphere = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              DreamPlacesCompanion(
            id: id,
            name: name,
            description: description,
            category: category,
            isRealWorld: isRealWorld,
            atmosphere: atmosphere,
            isArchived: isArchived,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<bool> isRealWorld = const Value.absent(),
            Value<String?> atmosphere = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              DreamPlacesCompanion.insert(
            id: id,
            name: name,
            description: description,
            category: category,
            isRealWorld: isRealWorld,
            atmosphere: atmosphere,
            isArchived: isArchived,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DreamPlacesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({dreamPlaceLinksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (dreamPlaceLinksRefs) db.dreamPlaceLinks
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dreamPlaceLinksRefs)
                    await $_getPrefetchedData<DreamPlace, $DreamPlacesTable,
                            DreamPlaceLink>(
                        currentTable: table,
                        referencedTable: $$DreamPlacesTableReferences
                            ._dreamPlaceLinksRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DreamPlacesTableReferences(db, table, p0)
                                .dreamPlaceLinksRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.placeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DreamPlacesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DreamPlacesTable,
    DreamPlace,
    $$DreamPlacesTableFilterComposer,
    $$DreamPlacesTableOrderingComposer,
    $$DreamPlacesTableAnnotationComposer,
    $$DreamPlacesTableCreateCompanionBuilder,
    $$DreamPlacesTableUpdateCompanionBuilder,
    (DreamPlace, $$DreamPlacesTableReferences),
    DreamPlace,
    PrefetchHooks Function({bool dreamPlaceLinksRefs})>;
typedef $$DreamTagsTableCreateCompanionBuilder = DreamTagsCompanion Function({
  Value<int> id,
  required String name,
  required String color,
  Value<String?> category,
  Value<String?> notes,
  Value<DateTime> createdAt,
});
typedef $$DreamTagsTableUpdateCompanionBuilder = DreamTagsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> color,
  Value<String?> category,
  Value<String?> notes,
  Value<DateTime> createdAt,
});

final class $$DreamTagsTableReferences
    extends BaseReferences<_$AppDatabase, $DreamTagsTable, DreamTag> {
  $$DreamTagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DreamTagLinksTable, List<DreamTagLink>>
      _dreamTagLinksRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.dreamTagLinks,
              aliasName: $_aliasNameGenerator(
                  db.dreamTags.id, db.dreamTagLinks.tagId));

  $$DreamTagLinksTableProcessedTableManager get dreamTagLinksRefs {
    final manager = $$DreamTagLinksTableTableManager($_db, $_db.dreamTagLinks)
        .filter((f) => f.tagId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dreamTagLinksRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DreamTagsTableFilterComposer
    extends Composer<_$AppDatabase, $DreamTagsTable> {
  $$DreamTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> dreamTagLinksRefs(
      Expression<bool> Function($$DreamTagLinksTableFilterComposer f) f) {
    final $$DreamTagLinksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dreamTagLinks,
        getReferencedColumn: (t) => t.tagId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamTagLinksTableFilterComposer(
              $db: $db,
              $table: $db.dreamTagLinks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DreamTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $DreamTagsTable> {
  $$DreamTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$DreamTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DreamTagsTable> {
  $$DreamTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> dreamTagLinksRefs<T extends Object>(
      Expression<T> Function($$DreamTagLinksTableAnnotationComposer a) f) {
    final $$DreamTagLinksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dreamTagLinks,
        getReferencedColumn: (t) => t.tagId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamTagLinksTableAnnotationComposer(
              $db: $db,
              $table: $db.dreamTagLinks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DreamTagsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DreamTagsTable,
    DreamTag,
    $$DreamTagsTableFilterComposer,
    $$DreamTagsTableOrderingComposer,
    $$DreamTagsTableAnnotationComposer,
    $$DreamTagsTableCreateCompanionBuilder,
    $$DreamTagsTableUpdateCompanionBuilder,
    (DreamTag, $$DreamTagsTableReferences),
    DreamTag,
    PrefetchHooks Function({bool dreamTagLinksRefs})> {
  $$DreamTagsTableTableManager(_$AppDatabase db, $DreamTagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DreamTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DreamTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DreamTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> color = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              DreamTagsCompanion(
            id: id,
            name: name,
            color: color,
            category: category,
            notes: notes,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String color,
            Value<String?> category = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              DreamTagsCompanion.insert(
            id: id,
            name: name,
            color: color,
            category: category,
            notes: notes,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DreamTagsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({dreamTagLinksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (dreamTagLinksRefs) db.dreamTagLinks
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dreamTagLinksRefs)
                    await $_getPrefetchedData<DreamTag, $DreamTagsTable,
                            DreamTagLink>(
                        currentTable: table,
                        referencedTable: $$DreamTagsTableReferences
                            ._dreamTagLinksRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DreamTagsTableReferences(db, table, p0)
                                .dreamTagLinksRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.tagId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DreamTagsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DreamTagsTable,
    DreamTag,
    $$DreamTagsTableFilterComposer,
    $$DreamTagsTableOrderingComposer,
    $$DreamTagsTableAnnotationComposer,
    $$DreamTagsTableCreateCompanionBuilder,
    $$DreamTagsTableUpdateCompanionBuilder,
    (DreamTag, $$DreamTagsTableReferences),
    DreamTag,
    PrefetchHooks Function({bool dreamTagLinksRefs})>;
typedef $$DreamCharacterLinksTableCreateCompanionBuilder
    = DreamCharacterLinksCompanion Function({
  required int dreamId,
  required int characterId,
  Value<String?> roleInDream,
  Value<String?> appearanceNotes,
  Value<int> rowid,
});
typedef $$DreamCharacterLinksTableUpdateCompanionBuilder
    = DreamCharacterLinksCompanion Function({
  Value<int> dreamId,
  Value<int> characterId,
  Value<String?> roleInDream,
  Value<String?> appearanceNotes,
  Value<int> rowid,
});

final class $$DreamCharacterLinksTableReferences extends BaseReferences<
    _$AppDatabase, $DreamCharacterLinksTable, DreamCharacterLink> {
  $$DreamCharacterLinksTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DreamsTable _dreamIdTable(_$AppDatabase db) => db.dreams.createAlias(
      $_aliasNameGenerator(db.dreamCharacterLinks.dreamId, db.dreams.id));

  $$DreamsTableProcessedTableManager get dreamId {
    final $_column = $_itemColumn<int>('dream_id')!;

    final manager = $$DreamsTableTableManager($_db, $_db.dreams)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dreamIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $DreamCharactersTable _characterIdTable(_$AppDatabase db) =>
      db.dreamCharacters.createAlias($_aliasNameGenerator(
          db.dreamCharacterLinks.characterId, db.dreamCharacters.id));

  $$DreamCharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<int>('character_id')!;

    final manager =
        $$DreamCharactersTableTableManager($_db, $_db.dreamCharacters)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DreamCharacterLinksTableFilterComposer
    extends Composer<_$AppDatabase, $DreamCharacterLinksTable> {
  $$DreamCharacterLinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get roleInDream => $composableBuilder(
      column: $table.roleInDream, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get appearanceNotes => $composableBuilder(
      column: $table.appearanceNotes,
      builder: (column) => ColumnFilters(column));

  $$DreamsTableFilterComposer get dreamId {
    final $$DreamsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dreamId,
        referencedTable: $db.dreams,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamsTableFilterComposer(
              $db: $db,
              $table: $db.dreams,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DreamCharactersTableFilterComposer get characterId {
    final $$DreamCharactersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.characterId,
        referencedTable: $db.dreamCharacters,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamCharactersTableFilterComposer(
              $db: $db,
              $table: $db.dreamCharacters,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DreamCharacterLinksTableOrderingComposer
    extends Composer<_$AppDatabase, $DreamCharacterLinksTable> {
  $$DreamCharacterLinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get roleInDream => $composableBuilder(
      column: $table.roleInDream, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get appearanceNotes => $composableBuilder(
      column: $table.appearanceNotes,
      builder: (column) => ColumnOrderings(column));

  $$DreamsTableOrderingComposer get dreamId {
    final $$DreamsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dreamId,
        referencedTable: $db.dreams,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamsTableOrderingComposer(
              $db: $db,
              $table: $db.dreams,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DreamCharactersTableOrderingComposer get characterId {
    final $$DreamCharactersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.characterId,
        referencedTable: $db.dreamCharacters,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamCharactersTableOrderingComposer(
              $db: $db,
              $table: $db.dreamCharacters,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DreamCharacterLinksTableAnnotationComposer
    extends Composer<_$AppDatabase, $DreamCharacterLinksTable> {
  $$DreamCharacterLinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get roleInDream => $composableBuilder(
      column: $table.roleInDream, builder: (column) => column);

  GeneratedColumn<String> get appearanceNotes => $composableBuilder(
      column: $table.appearanceNotes, builder: (column) => column);

  $$DreamsTableAnnotationComposer get dreamId {
    final $$DreamsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dreamId,
        referencedTable: $db.dreams,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamsTableAnnotationComposer(
              $db: $db,
              $table: $db.dreams,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DreamCharactersTableAnnotationComposer get characterId {
    final $$DreamCharactersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.characterId,
        referencedTable: $db.dreamCharacters,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamCharactersTableAnnotationComposer(
              $db: $db,
              $table: $db.dreamCharacters,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DreamCharacterLinksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DreamCharacterLinksTable,
    DreamCharacterLink,
    $$DreamCharacterLinksTableFilterComposer,
    $$DreamCharacterLinksTableOrderingComposer,
    $$DreamCharacterLinksTableAnnotationComposer,
    $$DreamCharacterLinksTableCreateCompanionBuilder,
    $$DreamCharacterLinksTableUpdateCompanionBuilder,
    (DreamCharacterLink, $$DreamCharacterLinksTableReferences),
    DreamCharacterLink,
    PrefetchHooks Function({bool dreamId, bool characterId})> {
  $$DreamCharacterLinksTableTableManager(
      _$AppDatabase db, $DreamCharacterLinksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DreamCharacterLinksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DreamCharacterLinksTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DreamCharacterLinksTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> dreamId = const Value.absent(),
            Value<int> characterId = const Value.absent(),
            Value<String?> roleInDream = const Value.absent(),
            Value<String?> appearanceNotes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DreamCharacterLinksCompanion(
            dreamId: dreamId,
            characterId: characterId,
            roleInDream: roleInDream,
            appearanceNotes: appearanceNotes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int dreamId,
            required int characterId,
            Value<String?> roleInDream = const Value.absent(),
            Value<String?> appearanceNotes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DreamCharacterLinksCompanion.insert(
            dreamId: dreamId,
            characterId: characterId,
            roleInDream: roleInDream,
            appearanceNotes: appearanceNotes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DreamCharacterLinksTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({dreamId = false, characterId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (dreamId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.dreamId,
                    referencedTable:
                        $$DreamCharacterLinksTableReferences._dreamIdTable(db),
                    referencedColumn: $$DreamCharacterLinksTableReferences
                        ._dreamIdTable(db)
                        .id,
                  ) as T;
                }
                if (characterId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.characterId,
                    referencedTable: $$DreamCharacterLinksTableReferences
                        ._characterIdTable(db),
                    referencedColumn: $$DreamCharacterLinksTableReferences
                        ._characterIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DreamCharacterLinksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DreamCharacterLinksTable,
    DreamCharacterLink,
    $$DreamCharacterLinksTableFilterComposer,
    $$DreamCharacterLinksTableOrderingComposer,
    $$DreamCharacterLinksTableAnnotationComposer,
    $$DreamCharacterLinksTableCreateCompanionBuilder,
    $$DreamCharacterLinksTableUpdateCompanionBuilder,
    (DreamCharacterLink, $$DreamCharacterLinksTableReferences),
    DreamCharacterLink,
    PrefetchHooks Function({bool dreamId, bool characterId})>;
typedef $$DreamPlaceLinksTableCreateCompanionBuilder = DreamPlaceLinksCompanion
    Function({
  required int dreamId,
  required int placeId,
  Value<bool> isPrimary,
  Value<String?> appearanceNotes,
  Value<int> rowid,
});
typedef $$DreamPlaceLinksTableUpdateCompanionBuilder = DreamPlaceLinksCompanion
    Function({
  Value<int> dreamId,
  Value<int> placeId,
  Value<bool> isPrimary,
  Value<String?> appearanceNotes,
  Value<int> rowid,
});

final class $$DreamPlaceLinksTableReferences extends BaseReferences<
    _$AppDatabase, $DreamPlaceLinksTable, DreamPlaceLink> {
  $$DreamPlaceLinksTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DreamsTable _dreamIdTable(_$AppDatabase db) => db.dreams.createAlias(
      $_aliasNameGenerator(db.dreamPlaceLinks.dreamId, db.dreams.id));

  $$DreamsTableProcessedTableManager get dreamId {
    final $_column = $_itemColumn<int>('dream_id')!;

    final manager = $$DreamsTableTableManager($_db, $_db.dreams)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dreamIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $DreamPlacesTable _placeIdTable(_$AppDatabase db) =>
      db.dreamPlaces.createAlias(
          $_aliasNameGenerator(db.dreamPlaceLinks.placeId, db.dreamPlaces.id));

  $$DreamPlacesTableProcessedTableManager get placeId {
    final $_column = $_itemColumn<int>('place_id')!;

    final manager = $$DreamPlacesTableTableManager($_db, $_db.dreamPlaces)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_placeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DreamPlaceLinksTableFilterComposer
    extends Composer<_$AppDatabase, $DreamPlaceLinksTable> {
  $$DreamPlaceLinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<bool> get isPrimary => $composableBuilder(
      column: $table.isPrimary, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get appearanceNotes => $composableBuilder(
      column: $table.appearanceNotes,
      builder: (column) => ColumnFilters(column));

  $$DreamsTableFilterComposer get dreamId {
    final $$DreamsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dreamId,
        referencedTable: $db.dreams,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamsTableFilterComposer(
              $db: $db,
              $table: $db.dreams,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DreamPlacesTableFilterComposer get placeId {
    final $$DreamPlacesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.placeId,
        referencedTable: $db.dreamPlaces,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamPlacesTableFilterComposer(
              $db: $db,
              $table: $db.dreamPlaces,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DreamPlaceLinksTableOrderingComposer
    extends Composer<_$AppDatabase, $DreamPlaceLinksTable> {
  $$DreamPlaceLinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<bool> get isPrimary => $composableBuilder(
      column: $table.isPrimary, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get appearanceNotes => $composableBuilder(
      column: $table.appearanceNotes,
      builder: (column) => ColumnOrderings(column));

  $$DreamsTableOrderingComposer get dreamId {
    final $$DreamsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dreamId,
        referencedTable: $db.dreams,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamsTableOrderingComposer(
              $db: $db,
              $table: $db.dreams,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DreamPlacesTableOrderingComposer get placeId {
    final $$DreamPlacesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.placeId,
        referencedTable: $db.dreamPlaces,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamPlacesTableOrderingComposer(
              $db: $db,
              $table: $db.dreamPlaces,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DreamPlaceLinksTableAnnotationComposer
    extends Composer<_$AppDatabase, $DreamPlaceLinksTable> {
  $$DreamPlaceLinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<bool> get isPrimary =>
      $composableBuilder(column: $table.isPrimary, builder: (column) => column);

  GeneratedColumn<String> get appearanceNotes => $composableBuilder(
      column: $table.appearanceNotes, builder: (column) => column);

  $$DreamsTableAnnotationComposer get dreamId {
    final $$DreamsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dreamId,
        referencedTable: $db.dreams,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamsTableAnnotationComposer(
              $db: $db,
              $table: $db.dreams,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DreamPlacesTableAnnotationComposer get placeId {
    final $$DreamPlacesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.placeId,
        referencedTable: $db.dreamPlaces,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamPlacesTableAnnotationComposer(
              $db: $db,
              $table: $db.dreamPlaces,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DreamPlaceLinksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DreamPlaceLinksTable,
    DreamPlaceLink,
    $$DreamPlaceLinksTableFilterComposer,
    $$DreamPlaceLinksTableOrderingComposer,
    $$DreamPlaceLinksTableAnnotationComposer,
    $$DreamPlaceLinksTableCreateCompanionBuilder,
    $$DreamPlaceLinksTableUpdateCompanionBuilder,
    (DreamPlaceLink, $$DreamPlaceLinksTableReferences),
    DreamPlaceLink,
    PrefetchHooks Function({bool dreamId, bool placeId})> {
  $$DreamPlaceLinksTableTableManager(
      _$AppDatabase db, $DreamPlaceLinksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DreamPlaceLinksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DreamPlaceLinksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DreamPlaceLinksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> dreamId = const Value.absent(),
            Value<int> placeId = const Value.absent(),
            Value<bool> isPrimary = const Value.absent(),
            Value<String?> appearanceNotes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DreamPlaceLinksCompanion(
            dreamId: dreamId,
            placeId: placeId,
            isPrimary: isPrimary,
            appearanceNotes: appearanceNotes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int dreamId,
            required int placeId,
            Value<bool> isPrimary = const Value.absent(),
            Value<String?> appearanceNotes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DreamPlaceLinksCompanion.insert(
            dreamId: dreamId,
            placeId: placeId,
            isPrimary: isPrimary,
            appearanceNotes: appearanceNotes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DreamPlaceLinksTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({dreamId = false, placeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (dreamId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.dreamId,
                    referencedTable:
                        $$DreamPlaceLinksTableReferences._dreamIdTable(db),
                    referencedColumn:
                        $$DreamPlaceLinksTableReferences._dreamIdTable(db).id,
                  ) as T;
                }
                if (placeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.placeId,
                    referencedTable:
                        $$DreamPlaceLinksTableReferences._placeIdTable(db),
                    referencedColumn:
                        $$DreamPlaceLinksTableReferences._placeIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DreamPlaceLinksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DreamPlaceLinksTable,
    DreamPlaceLink,
    $$DreamPlaceLinksTableFilterComposer,
    $$DreamPlaceLinksTableOrderingComposer,
    $$DreamPlaceLinksTableAnnotationComposer,
    $$DreamPlaceLinksTableCreateCompanionBuilder,
    $$DreamPlaceLinksTableUpdateCompanionBuilder,
    (DreamPlaceLink, $$DreamPlaceLinksTableReferences),
    DreamPlaceLink,
    PrefetchHooks Function({bool dreamId, bool placeId})>;
typedef $$DreamTagLinksTableCreateCompanionBuilder = DreamTagLinksCompanion
    Function({
  required int dreamId,
  required int tagId,
  Value<int> rowid,
});
typedef $$DreamTagLinksTableUpdateCompanionBuilder = DreamTagLinksCompanion
    Function({
  Value<int> dreamId,
  Value<int> tagId,
  Value<int> rowid,
});

final class $$DreamTagLinksTableReferences
    extends BaseReferences<_$AppDatabase, $DreamTagLinksTable, DreamTagLink> {
  $$DreamTagLinksTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DreamsTable _dreamIdTable(_$AppDatabase db) => db.dreams.createAlias(
      $_aliasNameGenerator(db.dreamTagLinks.dreamId, db.dreams.id));

  $$DreamsTableProcessedTableManager get dreamId {
    final $_column = $_itemColumn<int>('dream_id')!;

    final manager = $$DreamsTableTableManager($_db, $_db.dreams)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dreamIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $DreamTagsTable _tagIdTable(_$AppDatabase db) =>
      db.dreamTags.createAlias(
          $_aliasNameGenerator(db.dreamTagLinks.tagId, db.dreamTags.id));

  $$DreamTagsTableProcessedTableManager get tagId {
    final $_column = $_itemColumn<int>('tag_id')!;

    final manager = $$DreamTagsTableTableManager($_db, $_db.dreamTags)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DreamTagLinksTableFilterComposer
    extends Composer<_$AppDatabase, $DreamTagLinksTable> {
  $$DreamTagLinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DreamsTableFilterComposer get dreamId {
    final $$DreamsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dreamId,
        referencedTable: $db.dreams,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamsTableFilterComposer(
              $db: $db,
              $table: $db.dreams,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DreamTagsTableFilterComposer get tagId {
    final $$DreamTagsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $db.dreamTags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamTagsTableFilterComposer(
              $db: $db,
              $table: $db.dreamTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DreamTagLinksTableOrderingComposer
    extends Composer<_$AppDatabase, $DreamTagLinksTable> {
  $$DreamTagLinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DreamsTableOrderingComposer get dreamId {
    final $$DreamsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dreamId,
        referencedTable: $db.dreams,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamsTableOrderingComposer(
              $db: $db,
              $table: $db.dreams,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DreamTagsTableOrderingComposer get tagId {
    final $$DreamTagsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $db.dreamTags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamTagsTableOrderingComposer(
              $db: $db,
              $table: $db.dreamTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DreamTagLinksTableAnnotationComposer
    extends Composer<_$AppDatabase, $DreamTagLinksTable> {
  $$DreamTagLinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DreamsTableAnnotationComposer get dreamId {
    final $$DreamsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dreamId,
        referencedTable: $db.dreams,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamsTableAnnotationComposer(
              $db: $db,
              $table: $db.dreams,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DreamTagsTableAnnotationComposer get tagId {
    final $$DreamTagsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $db.dreamTags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DreamTagsTableAnnotationComposer(
              $db: $db,
              $table: $db.dreamTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DreamTagLinksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DreamTagLinksTable,
    DreamTagLink,
    $$DreamTagLinksTableFilterComposer,
    $$DreamTagLinksTableOrderingComposer,
    $$DreamTagLinksTableAnnotationComposer,
    $$DreamTagLinksTableCreateCompanionBuilder,
    $$DreamTagLinksTableUpdateCompanionBuilder,
    (DreamTagLink, $$DreamTagLinksTableReferences),
    DreamTagLink,
    PrefetchHooks Function({bool dreamId, bool tagId})> {
  $$DreamTagLinksTableTableManager(_$AppDatabase db, $DreamTagLinksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DreamTagLinksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DreamTagLinksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DreamTagLinksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> dreamId = const Value.absent(),
            Value<int> tagId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DreamTagLinksCompanion(
            dreamId: dreamId,
            tagId: tagId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int dreamId,
            required int tagId,
            Value<int> rowid = const Value.absent(),
          }) =>
              DreamTagLinksCompanion.insert(
            dreamId: dreamId,
            tagId: tagId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DreamTagLinksTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({dreamId = false, tagId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (dreamId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.dreamId,
                    referencedTable:
                        $$DreamTagLinksTableReferences._dreamIdTable(db),
                    referencedColumn:
                        $$DreamTagLinksTableReferences._dreamIdTable(db).id,
                  ) as T;
                }
                if (tagId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tagId,
                    referencedTable:
                        $$DreamTagLinksTableReferences._tagIdTable(db),
                    referencedColumn:
                        $$DreamTagLinksTableReferences._tagIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DreamTagLinksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DreamTagLinksTable,
    DreamTagLink,
    $$DreamTagLinksTableFilterComposer,
    $$DreamTagLinksTableOrderingComposer,
    $$DreamTagLinksTableAnnotationComposer,
    $$DreamTagLinksTableCreateCompanionBuilder,
    $$DreamTagLinksTableUpdateCompanionBuilder,
    (DreamTagLink, $$DreamTagLinksTableReferences),
    DreamTagLink,
    PrefetchHooks Function({bool dreamId, bool tagId})>;
typedef $$ContentItemsTableCreateCompanionBuilder = ContentItemsCompanion
    Function({
  Value<int> id,
  required int contentType,
  required String title,
  required String body,
  Value<String?> excerpt,
  Value<int?> difficulty,
  Value<int?> estimatedDurationMinutes,
  Value<bool> isBuiltIn,
  Value<bool> isFavorited,
  Value<String?> bestPracticeContext,
  Value<String?> tagsRaw,
  Value<String?> sourceAttribution,
  Value<int> sortOrder,
  Value<bool> isArchived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$ContentItemsTableUpdateCompanionBuilder = ContentItemsCompanion
    Function({
  Value<int> id,
  Value<int> contentType,
  Value<String> title,
  Value<String> body,
  Value<String?> excerpt,
  Value<int?> difficulty,
  Value<int?> estimatedDurationMinutes,
  Value<bool> isBuiltIn,
  Value<bool> isFavorited,
  Value<String?> bestPracticeContext,
  Value<String?> tagsRaw,
  Value<String?> sourceAttribution,
  Value<int> sortOrder,
  Value<bool> isArchived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$ContentItemsTableReferences
    extends BaseReferences<_$AppDatabase, $ContentItemsTable, ContentItem> {
  $$ContentItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ObeLogsTable, List<ObeLog>> _obeLogsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.obeLogs,
          aliasName: $_aliasNameGenerator(
              db.contentItems.id, db.obeLogs.techniqueContentId));

  $$ObeLogsTableProcessedTableManager get obeLogsRefs {
    final manager = $$ObeLogsTableTableManager($_db, $_db.obeLogs).filter(
        (f) => f.techniqueContentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_obeLogsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ContentUsageLogTable, List<ContentUsageLogData>>
      _contentUsageLogRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.contentUsageLog,
              aliasName: $_aliasNameGenerator(
                  db.contentItems.id, db.contentUsageLog.contentItemId));

  $$ContentUsageLogTableProcessedTableManager get contentUsageLogRefs {
    final manager = $$ContentUsageLogTableTableManager(
            $_db, $_db.contentUsageLog)
        .filter((f) => f.contentItemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_contentUsageLogRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ContentItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ContentItemsTable> {
  $$ContentItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get contentType => $composableBuilder(
      column: $table.contentType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get excerpt => $composableBuilder(
      column: $table.excerpt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get estimatedDurationMinutes => $composableBuilder(
      column: $table.estimatedDurationMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isBuiltIn => $composableBuilder(
      column: $table.isBuiltIn, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFavorited => $composableBuilder(
      column: $table.isFavorited, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bestPracticeContext => $composableBuilder(
      column: $table.bestPracticeContext,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tagsRaw => $composableBuilder(
      column: $table.tagsRaw, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceAttribution => $composableBuilder(
      column: $table.sourceAttribution,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> obeLogsRefs(
      Expression<bool> Function($$ObeLogsTableFilterComposer f) f) {
    final $$ObeLogsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.obeLogs,
        getReferencedColumn: (t) => t.techniqueContentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ObeLogsTableFilterComposer(
              $db: $db,
              $table: $db.obeLogs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> contentUsageLogRefs(
      Expression<bool> Function($$ContentUsageLogTableFilterComposer f) f) {
    final $$ContentUsageLogTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.contentUsageLog,
        getReferencedColumn: (t) => t.contentItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentUsageLogTableFilterComposer(
              $db: $db,
              $table: $db.contentUsageLog,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ContentItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ContentItemsTable> {
  $$ContentItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get contentType => $composableBuilder(
      column: $table.contentType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get excerpt => $composableBuilder(
      column: $table.excerpt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get estimatedDurationMinutes => $composableBuilder(
      column: $table.estimatedDurationMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isBuiltIn => $composableBuilder(
      column: $table.isBuiltIn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFavorited => $composableBuilder(
      column: $table.isFavorited, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bestPracticeContext => $composableBuilder(
      column: $table.bestPracticeContext,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tagsRaw => $composableBuilder(
      column: $table.tagsRaw, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceAttribution => $composableBuilder(
      column: $table.sourceAttribution,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ContentItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContentItemsTable> {
  $$ContentItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get contentType => $composableBuilder(
      column: $table.contentType, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get excerpt =>
      $composableBuilder(column: $table.excerpt, builder: (column) => column);

  GeneratedColumn<int> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => column);

  GeneratedColumn<int> get estimatedDurationMinutes => $composableBuilder(
      column: $table.estimatedDurationMinutes, builder: (column) => column);

  GeneratedColumn<bool> get isBuiltIn =>
      $composableBuilder(column: $table.isBuiltIn, builder: (column) => column);

  GeneratedColumn<bool> get isFavorited => $composableBuilder(
      column: $table.isFavorited, builder: (column) => column);

  GeneratedColumn<String> get bestPracticeContext => $composableBuilder(
      column: $table.bestPracticeContext, builder: (column) => column);

  GeneratedColumn<String> get tagsRaw =>
      $composableBuilder(column: $table.tagsRaw, builder: (column) => column);

  GeneratedColumn<String> get sourceAttribution => $composableBuilder(
      column: $table.sourceAttribution, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> obeLogsRefs<T extends Object>(
      Expression<T> Function($$ObeLogsTableAnnotationComposer a) f) {
    final $$ObeLogsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.obeLogs,
        getReferencedColumn: (t) => t.techniqueContentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ObeLogsTableAnnotationComposer(
              $db: $db,
              $table: $db.obeLogs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> contentUsageLogRefs<T extends Object>(
      Expression<T> Function($$ContentUsageLogTableAnnotationComposer a) f) {
    final $$ContentUsageLogTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.contentUsageLog,
        getReferencedColumn: (t) => t.contentItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentUsageLogTableAnnotationComposer(
              $db: $db,
              $table: $db.contentUsageLog,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ContentItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ContentItemsTable,
    ContentItem,
    $$ContentItemsTableFilterComposer,
    $$ContentItemsTableOrderingComposer,
    $$ContentItemsTableAnnotationComposer,
    $$ContentItemsTableCreateCompanionBuilder,
    $$ContentItemsTableUpdateCompanionBuilder,
    (ContentItem, $$ContentItemsTableReferences),
    ContentItem,
    PrefetchHooks Function({bool obeLogsRefs, bool contentUsageLogRefs})> {
  $$ContentItemsTableTableManager(_$AppDatabase db, $ContentItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContentItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContentItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContentItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> contentType = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> body = const Value.absent(),
            Value<String?> excerpt = const Value.absent(),
            Value<int?> difficulty = const Value.absent(),
            Value<int?> estimatedDurationMinutes = const Value.absent(),
            Value<bool> isBuiltIn = const Value.absent(),
            Value<bool> isFavorited = const Value.absent(),
            Value<String?> bestPracticeContext = const Value.absent(),
            Value<String?> tagsRaw = const Value.absent(),
            Value<String?> sourceAttribution = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ContentItemsCompanion(
            id: id,
            contentType: contentType,
            title: title,
            body: body,
            excerpt: excerpt,
            difficulty: difficulty,
            estimatedDurationMinutes: estimatedDurationMinutes,
            isBuiltIn: isBuiltIn,
            isFavorited: isFavorited,
            bestPracticeContext: bestPracticeContext,
            tagsRaw: tagsRaw,
            sourceAttribution: sourceAttribution,
            sortOrder: sortOrder,
            isArchived: isArchived,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int contentType,
            required String title,
            required String body,
            Value<String?> excerpt = const Value.absent(),
            Value<int?> difficulty = const Value.absent(),
            Value<int?> estimatedDurationMinutes = const Value.absent(),
            Value<bool> isBuiltIn = const Value.absent(),
            Value<bool> isFavorited = const Value.absent(),
            Value<String?> bestPracticeContext = const Value.absent(),
            Value<String?> tagsRaw = const Value.absent(),
            Value<String?> sourceAttribution = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ContentItemsCompanion.insert(
            id: id,
            contentType: contentType,
            title: title,
            body: body,
            excerpt: excerpt,
            difficulty: difficulty,
            estimatedDurationMinutes: estimatedDurationMinutes,
            isBuiltIn: isBuiltIn,
            isFavorited: isFavorited,
            bestPracticeContext: bestPracticeContext,
            tagsRaw: tagsRaw,
            sourceAttribution: sourceAttribution,
            sortOrder: sortOrder,
            isArchived: isArchived,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ContentItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {obeLogsRefs = false, contentUsageLogRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (obeLogsRefs) db.obeLogs,
                if (contentUsageLogRefs) db.contentUsageLog
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (obeLogsRefs)
                    await $_getPrefetchedData<ContentItem, $ContentItemsTable,
                            ObeLog>(
                        currentTable: table,
                        referencedTable:
                            $$ContentItemsTableReferences._obeLogsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ContentItemsTableReferences(db, table, p0)
                                .obeLogsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.techniqueContentId == item.id),
                        typedResults: items),
                  if (contentUsageLogRefs)
                    await $_getPrefetchedData<ContentItem, $ContentItemsTable,
                            ContentUsageLogData>(
                        currentTable: table,
                        referencedTable: $$ContentItemsTableReferences
                            ._contentUsageLogRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ContentItemsTableReferences(db, table, p0)
                                .contentUsageLogRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.contentItemId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ContentItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ContentItemsTable,
    ContentItem,
    $$ContentItemsTableFilterComposer,
    $$ContentItemsTableOrderingComposer,
    $$ContentItemsTableAnnotationComposer,
    $$ContentItemsTableCreateCompanionBuilder,
    $$ContentItemsTableUpdateCompanionBuilder,
    (ContentItem, $$ContentItemsTableReferences),
    ContentItem,
    PrefetchHooks Function({bool obeLogsRefs, bool contentUsageLogRefs})>;
typedef $$ObeLogsTableCreateCompanionBuilder = ObeLogsCompanion Function({
  Value<int> id,
  Value<String?> rundownDate,
  Value<int?> techniqueContentId,
  Value<String?> techniqueNameOverride,
  Value<int> entryState,
  required DateTime sessionDate,
  Value<int?> durationMinutes,
  Value<int?> preMoodLevel,
  Value<int?> preEnergyLevel,
  Value<String?> intention,
  Value<int> sessionType,
  required String description,
  Value<String?> sensationsJson,
  Value<bool> hadVisuals,
  Value<bool> hadAudio,
  Value<bool> hadTactile,
  Value<String?> experienceNarrative,
  Value<String?> primaryLocationDescription,
  Value<String?> challenges,
  Value<String?> returnMethod,
  Value<int?> focusLevel,
  Value<bool> onsetReached,
  Value<int?> onsetIntensity,
  Value<int?> fieldType,
  Value<int?> postMoodLevel,
  Value<String?> postReflection,
  Value<int?> significanceRating,
  Value<bool> isPrivate,
  Value<bool> isArchived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$ObeLogsTableUpdateCompanionBuilder = ObeLogsCompanion Function({
  Value<int> id,
  Value<String?> rundownDate,
  Value<int?> techniqueContentId,
  Value<String?> techniqueNameOverride,
  Value<int> entryState,
  Value<DateTime> sessionDate,
  Value<int?> durationMinutes,
  Value<int?> preMoodLevel,
  Value<int?> preEnergyLevel,
  Value<String?> intention,
  Value<int> sessionType,
  Value<String> description,
  Value<String?> sensationsJson,
  Value<bool> hadVisuals,
  Value<bool> hadAudio,
  Value<bool> hadTactile,
  Value<String?> experienceNarrative,
  Value<String?> primaryLocationDescription,
  Value<String?> challenges,
  Value<String?> returnMethod,
  Value<int?> focusLevel,
  Value<bool> onsetReached,
  Value<int?> onsetIntensity,
  Value<int?> fieldType,
  Value<int?> postMoodLevel,
  Value<String?> postReflection,
  Value<int?> significanceRating,
  Value<bool> isPrivate,
  Value<bool> isArchived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$ObeLogsTableReferences
    extends BaseReferences<_$AppDatabase, $ObeLogsTable, ObeLog> {
  $$ObeLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DailyRundownsTable _rundownDateTable(_$AppDatabase db) =>
      db.dailyRundowns.createAlias(
          $_aliasNameGenerator(db.obeLogs.rundownDate, db.dailyRundowns.id));

  $$DailyRundownsTableProcessedTableManager? get rundownDate {
    final $_column = $_itemColumn<String>('rundown_date');
    if ($_column == null) return null;
    final manager = $$DailyRundownsTableTableManager($_db, $_db.dailyRundowns)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_rundownDateTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ContentItemsTable _techniqueContentIdTable(_$AppDatabase db) =>
      db.contentItems.createAlias($_aliasNameGenerator(
          db.obeLogs.techniqueContentId, db.contentItems.id));

  $$ContentItemsTableProcessedTableManager? get techniqueContentId {
    final $_column = $_itemColumn<int>('technique_content_id');
    if ($_column == null) return null;
    final manager = $$ContentItemsTableTableManager($_db, $_db.contentItems)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_techniqueContentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ObeLocationVisitsTable, List<ObeLocationVisit>>
      _obeLocationVisitsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.obeLocationVisits,
              aliasName: $_aliasNameGenerator(
                  db.obeLogs.id, db.obeLocationVisits.obeLogId));

  $$ObeLocationVisitsTableProcessedTableManager get obeLocationVisitsRefs {
    final manager =
        $$ObeLocationVisitsTableTableManager($_db, $_db.obeLocationVisits)
            .filter((f) => f.obeLogId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_obeLocationVisitsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ObeLogsTableFilterComposer
    extends Composer<_$AppDatabase, $ObeLogsTable> {
  $$ObeLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get techniqueNameOverride => $composableBuilder(
      column: $table.techniqueNameOverride,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get entryState => $composableBuilder(
      column: $table.entryState, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get sessionDate => $composableBuilder(
      column: $table.sessionDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get preMoodLevel => $composableBuilder(
      column: $table.preMoodLevel, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get preEnergyLevel => $composableBuilder(
      column: $table.preEnergyLevel,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get intention => $composableBuilder(
      column: $table.intention, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sessionType => $composableBuilder(
      column: $table.sessionType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sensationsJson => $composableBuilder(
      column: $table.sensationsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hadVisuals => $composableBuilder(
      column: $table.hadVisuals, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hadAudio => $composableBuilder(
      column: $table.hadAudio, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hadTactile => $composableBuilder(
      column: $table.hadTactile, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get experienceNarrative => $composableBuilder(
      column: $table.experienceNarrative,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get primaryLocationDescription => $composableBuilder(
      column: $table.primaryLocationDescription,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get challenges => $composableBuilder(
      column: $table.challenges, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get returnMethod => $composableBuilder(
      column: $table.returnMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get focusLevel => $composableBuilder(
      column: $table.focusLevel, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get onsetReached => $composableBuilder(
      column: $table.onsetReached, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get onsetIntensity => $composableBuilder(
      column: $table.onsetIntensity,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fieldType => $composableBuilder(
      column: $table.fieldType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get postMoodLevel => $composableBuilder(
      column: $table.postMoodLevel, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get postReflection => $composableBuilder(
      column: $table.postReflection,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get significanceRating => $composableBuilder(
      column: $table.significanceRating,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPrivate => $composableBuilder(
      column: $table.isPrivate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$DailyRundownsTableFilterComposer get rundownDate {
    final $$DailyRundownsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.rundownDate,
        referencedTable: $db.dailyRundowns,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DailyRundownsTableFilterComposer(
              $db: $db,
              $table: $db.dailyRundowns,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ContentItemsTableFilterComposer get techniqueContentId {
    final $$ContentItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.techniqueContentId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableFilterComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> obeLocationVisitsRefs(
      Expression<bool> Function($$ObeLocationVisitsTableFilterComposer f) f) {
    final $$ObeLocationVisitsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.obeLocationVisits,
        getReferencedColumn: (t) => t.obeLogId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ObeLocationVisitsTableFilterComposer(
              $db: $db,
              $table: $db.obeLocationVisits,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ObeLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $ObeLogsTable> {
  $$ObeLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get techniqueNameOverride => $composableBuilder(
      column: $table.techniqueNameOverride,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get entryState => $composableBuilder(
      column: $table.entryState, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get sessionDate => $composableBuilder(
      column: $table.sessionDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get preMoodLevel => $composableBuilder(
      column: $table.preMoodLevel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get preEnergyLevel => $composableBuilder(
      column: $table.preEnergyLevel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get intention => $composableBuilder(
      column: $table.intention, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sessionType => $composableBuilder(
      column: $table.sessionType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sensationsJson => $composableBuilder(
      column: $table.sensationsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hadVisuals => $composableBuilder(
      column: $table.hadVisuals, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hadAudio => $composableBuilder(
      column: $table.hadAudio, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hadTactile => $composableBuilder(
      column: $table.hadTactile, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get experienceNarrative => $composableBuilder(
      column: $table.experienceNarrative,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get primaryLocationDescription => $composableBuilder(
      column: $table.primaryLocationDescription,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get challenges => $composableBuilder(
      column: $table.challenges, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get returnMethod => $composableBuilder(
      column: $table.returnMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get focusLevel => $composableBuilder(
      column: $table.focusLevel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get onsetReached => $composableBuilder(
      column: $table.onsetReached,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get onsetIntensity => $composableBuilder(
      column: $table.onsetIntensity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fieldType => $composableBuilder(
      column: $table.fieldType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get postMoodLevel => $composableBuilder(
      column: $table.postMoodLevel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get postReflection => $composableBuilder(
      column: $table.postReflection,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get significanceRating => $composableBuilder(
      column: $table.significanceRating,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPrivate => $composableBuilder(
      column: $table.isPrivate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$DailyRundownsTableOrderingComposer get rundownDate {
    final $$DailyRundownsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.rundownDate,
        referencedTable: $db.dailyRundowns,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DailyRundownsTableOrderingComposer(
              $db: $db,
              $table: $db.dailyRundowns,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ContentItemsTableOrderingComposer get techniqueContentId {
    final $$ContentItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.techniqueContentId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableOrderingComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ObeLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ObeLogsTable> {
  $$ObeLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get techniqueNameOverride => $composableBuilder(
      column: $table.techniqueNameOverride, builder: (column) => column);

  GeneratedColumn<int> get entryState => $composableBuilder(
      column: $table.entryState, builder: (column) => column);

  GeneratedColumn<DateTime> get sessionDate => $composableBuilder(
      column: $table.sessionDate, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes, builder: (column) => column);

  GeneratedColumn<int> get preMoodLevel => $composableBuilder(
      column: $table.preMoodLevel, builder: (column) => column);

  GeneratedColumn<int> get preEnergyLevel => $composableBuilder(
      column: $table.preEnergyLevel, builder: (column) => column);

  GeneratedColumn<String> get intention =>
      $composableBuilder(column: $table.intention, builder: (column) => column);

  GeneratedColumn<int> get sessionType => $composableBuilder(
      column: $table.sessionType, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get sensationsJson => $composableBuilder(
      column: $table.sensationsJson, builder: (column) => column);

  GeneratedColumn<bool> get hadVisuals => $composableBuilder(
      column: $table.hadVisuals, builder: (column) => column);

  GeneratedColumn<bool> get hadAudio =>
      $composableBuilder(column: $table.hadAudio, builder: (column) => column);

  GeneratedColumn<bool> get hadTactile => $composableBuilder(
      column: $table.hadTactile, builder: (column) => column);

  GeneratedColumn<String> get experienceNarrative => $composableBuilder(
      column: $table.experienceNarrative, builder: (column) => column);

  GeneratedColumn<String> get primaryLocationDescription => $composableBuilder(
      column: $table.primaryLocationDescription, builder: (column) => column);

  GeneratedColumn<String> get challenges => $composableBuilder(
      column: $table.challenges, builder: (column) => column);

  GeneratedColumn<String> get returnMethod => $composableBuilder(
      column: $table.returnMethod, builder: (column) => column);

  GeneratedColumn<int> get focusLevel => $composableBuilder(
      column: $table.focusLevel, builder: (column) => column);

  GeneratedColumn<bool> get onsetReached => $composableBuilder(
      column: $table.onsetReached, builder: (column) => column);

  GeneratedColumn<int> get onsetIntensity => $composableBuilder(
      column: $table.onsetIntensity, builder: (column) => column);

  GeneratedColumn<int> get fieldType =>
      $composableBuilder(column: $table.fieldType, builder: (column) => column);

  GeneratedColumn<int> get postMoodLevel => $composableBuilder(
      column: $table.postMoodLevel, builder: (column) => column);

  GeneratedColumn<String> get postReflection => $composableBuilder(
      column: $table.postReflection, builder: (column) => column);

  GeneratedColumn<int> get significanceRating => $composableBuilder(
      column: $table.significanceRating, builder: (column) => column);

  GeneratedColumn<bool> get isPrivate =>
      $composableBuilder(column: $table.isPrivate, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$DailyRundownsTableAnnotationComposer get rundownDate {
    final $$DailyRundownsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.rundownDate,
        referencedTable: $db.dailyRundowns,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DailyRundownsTableAnnotationComposer(
              $db: $db,
              $table: $db.dailyRundowns,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ContentItemsTableAnnotationComposer get techniqueContentId {
    final $$ContentItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.techniqueContentId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> obeLocationVisitsRefs<T extends Object>(
      Expression<T> Function($$ObeLocationVisitsTableAnnotationComposer a) f) {
    final $$ObeLocationVisitsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.obeLocationVisits,
            getReferencedColumn: (t) => t.obeLogId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ObeLocationVisitsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.obeLocationVisits,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ObeLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ObeLogsTable,
    ObeLog,
    $$ObeLogsTableFilterComposer,
    $$ObeLogsTableOrderingComposer,
    $$ObeLogsTableAnnotationComposer,
    $$ObeLogsTableCreateCompanionBuilder,
    $$ObeLogsTableUpdateCompanionBuilder,
    (ObeLog, $$ObeLogsTableReferences),
    ObeLog,
    PrefetchHooks Function(
        {bool rundownDate,
        bool techniqueContentId,
        bool obeLocationVisitsRefs})> {
  $$ObeLogsTableTableManager(_$AppDatabase db, $ObeLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ObeLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ObeLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ObeLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> rundownDate = const Value.absent(),
            Value<int?> techniqueContentId = const Value.absent(),
            Value<String?> techniqueNameOverride = const Value.absent(),
            Value<int> entryState = const Value.absent(),
            Value<DateTime> sessionDate = const Value.absent(),
            Value<int?> durationMinutes = const Value.absent(),
            Value<int?> preMoodLevel = const Value.absent(),
            Value<int?> preEnergyLevel = const Value.absent(),
            Value<String?> intention = const Value.absent(),
            Value<int> sessionType = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String?> sensationsJson = const Value.absent(),
            Value<bool> hadVisuals = const Value.absent(),
            Value<bool> hadAudio = const Value.absent(),
            Value<bool> hadTactile = const Value.absent(),
            Value<String?> experienceNarrative = const Value.absent(),
            Value<String?> primaryLocationDescription = const Value.absent(),
            Value<String?> challenges = const Value.absent(),
            Value<String?> returnMethod = const Value.absent(),
            Value<int?> focusLevel = const Value.absent(),
            Value<bool> onsetReached = const Value.absent(),
            Value<int?> onsetIntensity = const Value.absent(),
            Value<int?> fieldType = const Value.absent(),
            Value<int?> postMoodLevel = const Value.absent(),
            Value<String?> postReflection = const Value.absent(),
            Value<int?> significanceRating = const Value.absent(),
            Value<bool> isPrivate = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ObeLogsCompanion(
            id: id,
            rundownDate: rundownDate,
            techniqueContentId: techniqueContentId,
            techniqueNameOverride: techniqueNameOverride,
            entryState: entryState,
            sessionDate: sessionDate,
            durationMinutes: durationMinutes,
            preMoodLevel: preMoodLevel,
            preEnergyLevel: preEnergyLevel,
            intention: intention,
            sessionType: sessionType,
            description: description,
            sensationsJson: sensationsJson,
            hadVisuals: hadVisuals,
            hadAudio: hadAudio,
            hadTactile: hadTactile,
            experienceNarrative: experienceNarrative,
            primaryLocationDescription: primaryLocationDescription,
            challenges: challenges,
            returnMethod: returnMethod,
            focusLevel: focusLevel,
            onsetReached: onsetReached,
            onsetIntensity: onsetIntensity,
            fieldType: fieldType,
            postMoodLevel: postMoodLevel,
            postReflection: postReflection,
            significanceRating: significanceRating,
            isPrivate: isPrivate,
            isArchived: isArchived,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> rundownDate = const Value.absent(),
            Value<int?> techniqueContentId = const Value.absent(),
            Value<String?> techniqueNameOverride = const Value.absent(),
            Value<int> entryState = const Value.absent(),
            required DateTime sessionDate,
            Value<int?> durationMinutes = const Value.absent(),
            Value<int?> preMoodLevel = const Value.absent(),
            Value<int?> preEnergyLevel = const Value.absent(),
            Value<String?> intention = const Value.absent(),
            Value<int> sessionType = const Value.absent(),
            required String description,
            Value<String?> sensationsJson = const Value.absent(),
            Value<bool> hadVisuals = const Value.absent(),
            Value<bool> hadAudio = const Value.absent(),
            Value<bool> hadTactile = const Value.absent(),
            Value<String?> experienceNarrative = const Value.absent(),
            Value<String?> primaryLocationDescription = const Value.absent(),
            Value<String?> challenges = const Value.absent(),
            Value<String?> returnMethod = const Value.absent(),
            Value<int?> focusLevel = const Value.absent(),
            Value<bool> onsetReached = const Value.absent(),
            Value<int?> onsetIntensity = const Value.absent(),
            Value<int?> fieldType = const Value.absent(),
            Value<int?> postMoodLevel = const Value.absent(),
            Value<String?> postReflection = const Value.absent(),
            Value<int?> significanceRating = const Value.absent(),
            Value<bool> isPrivate = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ObeLogsCompanion.insert(
            id: id,
            rundownDate: rundownDate,
            techniqueContentId: techniqueContentId,
            techniqueNameOverride: techniqueNameOverride,
            entryState: entryState,
            sessionDate: sessionDate,
            durationMinutes: durationMinutes,
            preMoodLevel: preMoodLevel,
            preEnergyLevel: preEnergyLevel,
            intention: intention,
            sessionType: sessionType,
            description: description,
            sensationsJson: sensationsJson,
            hadVisuals: hadVisuals,
            hadAudio: hadAudio,
            hadTactile: hadTactile,
            experienceNarrative: experienceNarrative,
            primaryLocationDescription: primaryLocationDescription,
            challenges: challenges,
            returnMethod: returnMethod,
            focusLevel: focusLevel,
            onsetReached: onsetReached,
            onsetIntensity: onsetIntensity,
            fieldType: fieldType,
            postMoodLevel: postMoodLevel,
            postReflection: postReflection,
            significanceRating: significanceRating,
            isPrivate: isPrivate,
            isArchived: isArchived,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ObeLogsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {rundownDate = false,
              techniqueContentId = false,
              obeLocationVisitsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (obeLocationVisitsRefs) db.obeLocationVisits
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (rundownDate) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.rundownDate,
                    referencedTable:
                        $$ObeLogsTableReferences._rundownDateTable(db),
                    referencedColumn:
                        $$ObeLogsTableReferences._rundownDateTable(db).id,
                  ) as T;
                }
                if (techniqueContentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.techniqueContentId,
                    referencedTable:
                        $$ObeLogsTableReferences._techniqueContentIdTable(db),
                    referencedColumn: $$ObeLogsTableReferences
                        ._techniqueContentIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (obeLocationVisitsRefs)
                    await $_getPrefetchedData<ObeLog, $ObeLogsTable,
                            ObeLocationVisit>(
                        currentTable: table,
                        referencedTable: $$ObeLogsTableReferences
                            ._obeLocationVisitsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ObeLogsTableReferences(db, table, p0)
                                .obeLocationVisitsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.obeLogId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ObeLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ObeLogsTable,
    ObeLog,
    $$ObeLogsTableFilterComposer,
    $$ObeLogsTableOrderingComposer,
    $$ObeLogsTableAnnotationComposer,
    $$ObeLogsTableCreateCompanionBuilder,
    $$ObeLogsTableUpdateCompanionBuilder,
    (ObeLog, $$ObeLogsTableReferences),
    ObeLog,
    PrefetchHooks Function(
        {bool rundownDate,
        bool techniqueContentId,
        bool obeLocationVisitsRefs})>;
typedef $$ObeLocationVisitsTableCreateCompanionBuilder
    = ObeLocationVisitsCompanion Function({
  Value<int> id,
  required int obeLogId,
  Value<int> sequence,
  Value<String?> locationName,
  required String description,
  Value<bool> isRealWorldLocation,
  Value<String?> realWorldRef,
  Value<int?> durationMinutes,
  Value<DateTime> createdAt,
});
typedef $$ObeLocationVisitsTableUpdateCompanionBuilder
    = ObeLocationVisitsCompanion Function({
  Value<int> id,
  Value<int> obeLogId,
  Value<int> sequence,
  Value<String?> locationName,
  Value<String> description,
  Value<bool> isRealWorldLocation,
  Value<String?> realWorldRef,
  Value<int?> durationMinutes,
  Value<DateTime> createdAt,
});

final class $$ObeLocationVisitsTableReferences extends BaseReferences<
    _$AppDatabase, $ObeLocationVisitsTable, ObeLocationVisit> {
  $$ObeLocationVisitsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ObeLogsTable _obeLogIdTable(_$AppDatabase db) =>
      db.obeLogs.createAlias(
          $_aliasNameGenerator(db.obeLocationVisits.obeLogId, db.obeLogs.id));

  $$ObeLogsTableProcessedTableManager get obeLogId {
    final $_column = $_itemColumn<int>('obe_log_id')!;

    final manager = $$ObeLogsTableTableManager($_db, $_db.obeLogs)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_obeLogIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ObeLocationVisitsTableFilterComposer
    extends Composer<_$AppDatabase, $ObeLocationVisitsTable> {
  $$ObeLocationVisitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sequence => $composableBuilder(
      column: $table.sequence, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get locationName => $composableBuilder(
      column: $table.locationName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRealWorldLocation => $composableBuilder(
      column: $table.isRealWorldLocation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get realWorldRef => $composableBuilder(
      column: $table.realWorldRef, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$ObeLogsTableFilterComposer get obeLogId {
    final $$ObeLogsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.obeLogId,
        referencedTable: $db.obeLogs,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ObeLogsTableFilterComposer(
              $db: $db,
              $table: $db.obeLogs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ObeLocationVisitsTableOrderingComposer
    extends Composer<_$AppDatabase, $ObeLocationVisitsTable> {
  $$ObeLocationVisitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sequence => $composableBuilder(
      column: $table.sequence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get locationName => $composableBuilder(
      column: $table.locationName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRealWorldLocation => $composableBuilder(
      column: $table.isRealWorldLocation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get realWorldRef => $composableBuilder(
      column: $table.realWorldRef,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$ObeLogsTableOrderingComposer get obeLogId {
    final $$ObeLogsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.obeLogId,
        referencedTable: $db.obeLogs,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ObeLogsTableOrderingComposer(
              $db: $db,
              $table: $db.obeLogs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ObeLocationVisitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ObeLocationVisitsTable> {
  $$ObeLocationVisitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get sequence =>
      $composableBuilder(column: $table.sequence, builder: (column) => column);

  GeneratedColumn<String> get locationName => $composableBuilder(
      column: $table.locationName, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get isRealWorldLocation => $composableBuilder(
      column: $table.isRealWorldLocation, builder: (column) => column);

  GeneratedColumn<String> get realWorldRef => $composableBuilder(
      column: $table.realWorldRef, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$ObeLogsTableAnnotationComposer get obeLogId {
    final $$ObeLogsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.obeLogId,
        referencedTable: $db.obeLogs,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ObeLogsTableAnnotationComposer(
              $db: $db,
              $table: $db.obeLogs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ObeLocationVisitsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ObeLocationVisitsTable,
    ObeLocationVisit,
    $$ObeLocationVisitsTableFilterComposer,
    $$ObeLocationVisitsTableOrderingComposer,
    $$ObeLocationVisitsTableAnnotationComposer,
    $$ObeLocationVisitsTableCreateCompanionBuilder,
    $$ObeLocationVisitsTableUpdateCompanionBuilder,
    (ObeLocationVisit, $$ObeLocationVisitsTableReferences),
    ObeLocationVisit,
    PrefetchHooks Function({bool obeLogId})> {
  $$ObeLocationVisitsTableTableManager(
      _$AppDatabase db, $ObeLocationVisitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ObeLocationVisitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ObeLocationVisitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ObeLocationVisitsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> obeLogId = const Value.absent(),
            Value<int> sequence = const Value.absent(),
            Value<String?> locationName = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<bool> isRealWorldLocation = const Value.absent(),
            Value<String?> realWorldRef = const Value.absent(),
            Value<int?> durationMinutes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ObeLocationVisitsCompanion(
            id: id,
            obeLogId: obeLogId,
            sequence: sequence,
            locationName: locationName,
            description: description,
            isRealWorldLocation: isRealWorldLocation,
            realWorldRef: realWorldRef,
            durationMinutes: durationMinutes,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int obeLogId,
            Value<int> sequence = const Value.absent(),
            Value<String?> locationName = const Value.absent(),
            required String description,
            Value<bool> isRealWorldLocation = const Value.absent(),
            Value<String?> realWorldRef = const Value.absent(),
            Value<int?> durationMinutes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ObeLocationVisitsCompanion.insert(
            id: id,
            obeLogId: obeLogId,
            sequence: sequence,
            locationName: locationName,
            description: description,
            isRealWorldLocation: isRealWorldLocation,
            realWorldRef: realWorldRef,
            durationMinutes: durationMinutes,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ObeLocationVisitsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({obeLogId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (obeLogId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.obeLogId,
                    referencedTable:
                        $$ObeLocationVisitsTableReferences._obeLogIdTable(db),
                    referencedColumn: $$ObeLocationVisitsTableReferences
                        ._obeLogIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ObeLocationVisitsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ObeLocationVisitsTable,
    ObeLocationVisit,
    $$ObeLocationVisitsTableFilterComposer,
    $$ObeLocationVisitsTableOrderingComposer,
    $$ObeLocationVisitsTableAnnotationComposer,
    $$ObeLocationVisitsTableCreateCompanionBuilder,
    $$ObeLocationVisitsTableUpdateCompanionBuilder,
    (ObeLocationVisit, $$ObeLocationVisitsTableReferences),
    ObeLocationVisit,
    PrefetchHooks Function({bool obeLogId})>;
typedef $$ContentUsageLogTableCreateCompanionBuilder = ContentUsageLogCompanion
    Function({
  Value<int> id,
  required int contentItemId,
  Value<String?> rundownDate,
  Value<bool> wasCompleted,
  Value<int?> userRating,
  Value<String?> notes,
  Value<DateTime> usedAt,
});
typedef $$ContentUsageLogTableUpdateCompanionBuilder = ContentUsageLogCompanion
    Function({
  Value<int> id,
  Value<int> contentItemId,
  Value<String?> rundownDate,
  Value<bool> wasCompleted,
  Value<int?> userRating,
  Value<String?> notes,
  Value<DateTime> usedAt,
});

final class $$ContentUsageLogTableReferences extends BaseReferences<
    _$AppDatabase, $ContentUsageLogTable, ContentUsageLogData> {
  $$ContentUsageLogTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ContentItemsTable _contentItemIdTable(_$AppDatabase db) =>
      db.contentItems.createAlias($_aliasNameGenerator(
          db.contentUsageLog.contentItemId, db.contentItems.id));

  $$ContentItemsTableProcessedTableManager get contentItemId {
    final $_column = $_itemColumn<int>('content_item_id')!;

    final manager = $$ContentItemsTableTableManager($_db, $_db.contentItems)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_contentItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $DailyRundownsTable _rundownDateTable(_$AppDatabase db) =>
      db.dailyRundowns.createAlias($_aliasNameGenerator(
          db.contentUsageLog.rundownDate, db.dailyRundowns.id));

  $$DailyRundownsTableProcessedTableManager? get rundownDate {
    final $_column = $_itemColumn<String>('rundown_date');
    if ($_column == null) return null;
    final manager = $$DailyRundownsTableTableManager($_db, $_db.dailyRundowns)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_rundownDateTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ContentUsageLogTableFilterComposer
    extends Composer<_$AppDatabase, $ContentUsageLogTable> {
  $$ContentUsageLogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get wasCompleted => $composableBuilder(
      column: $table.wasCompleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userRating => $composableBuilder(
      column: $table.userRating, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get usedAt => $composableBuilder(
      column: $table.usedAt, builder: (column) => ColumnFilters(column));

  $$ContentItemsTableFilterComposer get contentItemId {
    final $$ContentItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableFilterComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DailyRundownsTableFilterComposer get rundownDate {
    final $$DailyRundownsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.rundownDate,
        referencedTable: $db.dailyRundowns,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DailyRundownsTableFilterComposer(
              $db: $db,
              $table: $db.dailyRundowns,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ContentUsageLogTableOrderingComposer
    extends Composer<_$AppDatabase, $ContentUsageLogTable> {
  $$ContentUsageLogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get wasCompleted => $composableBuilder(
      column: $table.wasCompleted,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userRating => $composableBuilder(
      column: $table.userRating, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get usedAt => $composableBuilder(
      column: $table.usedAt, builder: (column) => ColumnOrderings(column));

  $$ContentItemsTableOrderingComposer get contentItemId {
    final $$ContentItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableOrderingComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DailyRundownsTableOrderingComposer get rundownDate {
    final $$DailyRundownsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.rundownDate,
        referencedTable: $db.dailyRundowns,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DailyRundownsTableOrderingComposer(
              $db: $db,
              $table: $db.dailyRundowns,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ContentUsageLogTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContentUsageLogTable> {
  $$ContentUsageLogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get wasCompleted => $composableBuilder(
      column: $table.wasCompleted, builder: (column) => column);

  GeneratedColumn<int> get userRating => $composableBuilder(
      column: $table.userRating, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get usedAt =>
      $composableBuilder(column: $table.usedAt, builder: (column) => column);

  $$ContentItemsTableAnnotationComposer get contentItemId {
    final $$ContentItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DailyRundownsTableAnnotationComposer get rundownDate {
    final $$DailyRundownsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.rundownDate,
        referencedTable: $db.dailyRundowns,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DailyRundownsTableAnnotationComposer(
              $db: $db,
              $table: $db.dailyRundowns,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ContentUsageLogTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ContentUsageLogTable,
    ContentUsageLogData,
    $$ContentUsageLogTableFilterComposer,
    $$ContentUsageLogTableOrderingComposer,
    $$ContentUsageLogTableAnnotationComposer,
    $$ContentUsageLogTableCreateCompanionBuilder,
    $$ContentUsageLogTableUpdateCompanionBuilder,
    (ContentUsageLogData, $$ContentUsageLogTableReferences),
    ContentUsageLogData,
    PrefetchHooks Function({bool contentItemId, bool rundownDate})> {
  $$ContentUsageLogTableTableManager(
      _$AppDatabase db, $ContentUsageLogTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContentUsageLogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContentUsageLogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContentUsageLogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> contentItemId = const Value.absent(),
            Value<String?> rundownDate = const Value.absent(),
            Value<bool> wasCompleted = const Value.absent(),
            Value<int?> userRating = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> usedAt = const Value.absent(),
          }) =>
              ContentUsageLogCompanion(
            id: id,
            contentItemId: contentItemId,
            rundownDate: rundownDate,
            wasCompleted: wasCompleted,
            userRating: userRating,
            notes: notes,
            usedAt: usedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int contentItemId,
            Value<String?> rundownDate = const Value.absent(),
            Value<bool> wasCompleted = const Value.absent(),
            Value<int?> userRating = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> usedAt = const Value.absent(),
          }) =>
              ContentUsageLogCompanion.insert(
            id: id,
            contentItemId: contentItemId,
            rundownDate: rundownDate,
            wasCompleted: wasCompleted,
            userRating: userRating,
            notes: notes,
            usedAt: usedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ContentUsageLogTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {contentItemId = false, rundownDate = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (contentItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.contentItemId,
                    referencedTable: $$ContentUsageLogTableReferences
                        ._contentItemIdTable(db),
                    referencedColumn: $$ContentUsageLogTableReferences
                        ._contentItemIdTable(db)
                        .id,
                  ) as T;
                }
                if (rundownDate) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.rundownDate,
                    referencedTable:
                        $$ContentUsageLogTableReferences._rundownDateTable(db),
                    referencedColumn: $$ContentUsageLogTableReferences
                        ._rundownDateTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ContentUsageLogTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ContentUsageLogTable,
    ContentUsageLogData,
    $$ContentUsageLogTableFilterComposer,
    $$ContentUsageLogTableOrderingComposer,
    $$ContentUsageLogTableAnnotationComposer,
    $$ContentUsageLogTableCreateCompanionBuilder,
    $$ContentUsageLogTableUpdateCompanionBuilder,
    (ContentUsageLogData, $$ContentUsageLogTableReferences),
    ContentUsageLogData,
    PrefetchHooks Function({bool contentItemId, bool rundownDate})>;
typedef $$AppSettingsTableCreateCompanionBuilder = AppSettingsCompanion
    Function({
  required String key,
  required String value,
  Value<int> rowid,
});
typedef $$AppSettingsTableUpdateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<String> key,
  Value<String> value,
  Value<int> rowid,
});

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$AppSettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion(
            key: key,
            value: value,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            required String value,
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion.insert(
            key: key,
            value: value,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DailyRundownsTableTableManager get dailyRundowns =>
      $$DailyRundownsTableTableManager(_db, _db.dailyRundowns);
  $$DreamsTableTableManager get dreams =>
      $$DreamsTableTableManager(_db, _db.dreams);
  $$DreamCharactersTableTableManager get dreamCharacters =>
      $$DreamCharactersTableTableManager(_db, _db.dreamCharacters);
  $$DreamPlacesTableTableManager get dreamPlaces =>
      $$DreamPlacesTableTableManager(_db, _db.dreamPlaces);
  $$DreamTagsTableTableManager get dreamTags =>
      $$DreamTagsTableTableManager(_db, _db.dreamTags);
  $$DreamCharacterLinksTableTableManager get dreamCharacterLinks =>
      $$DreamCharacterLinksTableTableManager(_db, _db.dreamCharacterLinks);
  $$DreamPlaceLinksTableTableManager get dreamPlaceLinks =>
      $$DreamPlaceLinksTableTableManager(_db, _db.dreamPlaceLinks);
  $$DreamTagLinksTableTableManager get dreamTagLinks =>
      $$DreamTagLinksTableTableManager(_db, _db.dreamTagLinks);
  $$ContentItemsTableTableManager get contentItems =>
      $$ContentItemsTableTableManager(_db, _db.contentItems);
  $$ObeLogsTableTableManager get obeLogs =>
      $$ObeLogsTableTableManager(_db, _db.obeLogs);
  $$ObeLocationVisitsTableTableManager get obeLocationVisits =>
      $$ObeLocationVisitsTableTableManager(_db, _db.obeLocationVisits);
  $$ContentUsageLogTableTableManager get contentUsageLog =>
      $$ContentUsageLogTableTableManager(_db, _db.contentUsageLog);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
