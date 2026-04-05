import 'package:drift/drift.dart';

import '../app_database.dart';

/// Seeds the built-in library of OBE techniques, affirmations, meditations,
/// and visualizations on first launch. Uses insertOnConflictUpdate so it can
/// also be called during upgrades to refresh built-in content text.
class BuiltInContentSeeder {
  final AppDatabase _db;

  BuiltInContentSeeder(this._db);

  Future<void> seed() async {
    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(_db.contentItems, _techniques());
      batch.insertAllOnConflictUpdate(_db.contentItems, _affirmations());
      batch.insertAllOnConflictUpdate(_db.contentItems, _meditations());
      batch.insertAllOnConflictUpdate(_db.contentItems, _visualizations());
    });
  }

  List<ContentItemsCompanion> _techniques() => [
        _technique(
          id: -1,
          title: 'WILD – Wake Induced Lucid Dream',
          excerpt: 'Maintain consciousness as your body falls asleep.',
          body: '''WILD (Wake Induced Lucid Dream) involves maintaining conscious awareness
as your physical body transitions into sleep.

Steps:
1. Wake up after 5-6 hours of sleep (WBTB enhances success rate).
2. Lie still and relaxed. Close your eyes.
3. Watch the hypnagogic imagery that forms behind your eyelids without engaging it.
4. Allow sleep paralysis to set in — don't resist the sensations.
5. When the imagery becomes vivid and stable, "step into" the dreamscape.
6. Stabilize by touching surfaces, spinning, or demanding clarity.

Key: Passive awareness is everything. Trying to force it breaks the state.''',
          difficulty: 2,
          duration: 45,
          sortOrder: 1,
          tags: 'WILD,sleep-paralysis,hypnagogic,advanced',
        ),
        _technique(
          id: -2,
          title: 'MILD – Mnemonic Induction',
          excerpt: 'Set a dream intention as you drift off to sleep.',
          body: '''MILD (Mnemonic Induction of Lucid Dreams) uses prospective memory —
the intention to remember to do something in the future.

Steps:
1. As you fall asleep, repeat a mantra: "Next time I'm dreaming, I will know I am dreaming."
2. Visualize yourself becoming lucid in a recent dream.
3. Feel the emotions of that moment of recognition.
4. Let the visualization and mantra fade as sleep takes over.
5. If you wake, write the dream down and repeat the process.

Key: The emotional charge of the intention matters more than the words.''',
          difficulty: 0,
          duration: 15,
          sortOrder: 2,
          tags: 'MILD,intention,beginner,classic',
        ),
        _technique(
          id: -3,
          title: 'WBTB – Wake Back to Bed',
          excerpt: 'Use a mid-sleep wake to boost REM lucidity.',
          body: '''WBTB (Wake Back to Bed) exploits the fact that REM sleep periods lengthen
toward morning. Interrupting sleep and returning intensifies the next REM cycle.

Steps:
1. Set an alarm for 5-6 hours after sleep onset.
2. Wake up. Stay awake for 20-60 minutes — read about lucid dreaming or OBE.
3. Return to bed with a clear intention (pair with MILD or WILD).
4. The next sleep cycle will be predominantly REM, increasing lucidity chances.

Key: Keep the wake period calm. Screens reduce effectiveness.''',
          difficulty: 1,
          duration: 60,
          sortOrder: 3,
          tags: 'WBTB,REM,intermediate,enhancer',
        ),
        _technique(
          id: -4,
          title: 'Monroe Method (Vibration Stage)',
          excerpt: 'Robert Monroe\'s classic OBE induction via vibrations.',
          body: '''Robert Monroe\'s method focuses on entering the "vibrational state"
as a gateway to OBE.

Steps:
1. Lie down in a dark, quiet room. Relax completely.
2. Enter the hypnagogic state (the edge of sleep).
3. Deepen the state by imagining a point 12 inches from your forehead,
   then extend it further and further out.
4. Notice vibrations beginning. They may feel like electricity or buzzing.
5. Mentally "pull" the vibrations through your body until they become full-body.
6. From this state, imagine yourself rolling out of your physical body.

Key: Do not react to the vibrations with excitement — stay calm and curious.''',
          difficulty: 2,
          duration: 40,
          sortOrder: 4,
          tags: 'Monroe,OBE,vibrations,classic,advanced',
        ),
      ];

  List<ContentItemsCompanion> _affirmations() => [
        _affirmation(
          id: -10,
          title: 'Lucid Dream Affirmation',
          body: 'Tonight, I will become aware that I am dreaming.\n'
              'I remember my dreams with vivid clarity.\n'
              'My mind is awake within sleep.',
          sortOrder: 1,
        ),
        _affirmation(
          id: -11,
          title: 'OBE Readiness Affirmation',
          body: 'I am ready to experience expanded states of consciousness.\n'
              'My awareness travels freely and returns safely.\n'
              'I explore with curiosity and return with peace.',
          sortOrder: 2,
        ),
        _affirmation(
          id: -12,
          title: 'Dream Recall Affirmation',
          body: 'I remember every detail of my dreams upon waking.\n'
              'My dream memory grows stronger each night.\n'
              'I honor my inner experiences by recording them.',
          sortOrder: 3,
        ),
      ];

  List<ContentItemsCompanion> _meditations() => [
        _meditation(
          id: -20,
          title: 'Body Scan for Sleep',
          excerpt: 'A progressive relaxation to prepare the body for deep sleep.',
          body: '''Find a comfortable position lying down. Close your eyes.

Begin at the top of your head. Notice any tension there — and release it.
Move your awareness slowly down to your forehead. Soften the muscles around your eyes.
Your jaw... let it drop slightly. Your neck and shoulders... release.

Continue this slow, attentive movement through your chest... your arms...
your hands... your belly... your lower back... your hips...
your thighs... your knees... your calves... and finally your feet.

With each exhale, let your body sink a little deeper into the surface beneath you.
You are safe. You are relaxed. Sleep is near.''',
          duration: 15,
          sortOrder: 1,
        ),
        _meditation(
          id: -21,
          title: 'Consciousness Anchor Meditation',
          excerpt: 'Cultivate the witnessing awareness that carries into dreams.',
          body: '''Sit or lie comfortably. Close your eyes.

Bring your attention to the fact that you are aware right now.
Not aware of anything in particular — just the bare fact of awareness itself.

Notice thoughts arising. You are the one noticing them.
Notice sounds. You are the one hearing them.
Notice the sensation of breathing. You are the one feeling it.

This witnessing presence — this "I am" — is what you want to take into sleep.
Rest here for as long as feels natural.
Before sleep, set the intention: "This aware presence will continue into my dreams."''',
          duration: 20,
          sortOrder: 2,
        ),
      ];

  List<ContentItemsCompanion> _visualizations() => [
        _visualization(
          id: -30,
          title: 'Dream Scene Incubation',
          excerpt: 'Vividly imagine a scene to seed your dreams.',
          body: '''Choose a specific place you want to dream about tonight.
It could be somewhere you\'ve been, or somewhere entirely imagined.

Close your eyes and construct this place with all your senses:
- What do you see? (Colors, shapes, light quality)
- What do you hear? (Wind, water, voices, music)
- What do you feel beneath your feet? (Grass, stone, sand)
- What is the temperature? The smell?

Walk through this place in your mind. Touch the surfaces.
Sit down somewhere comfortable within it.

As you drift to sleep, let yourself "stay" in this place.
Your brain may carry you there.''',
          sortOrder: 1,
        ),
        _visualization(
          id: -31,
          title: 'Silver Cord Visualization',
          excerpt: 'Visualize the energetic connection between body and consciousness.',
          body: '''Lie down comfortably. Close your eyes and breathe slowly.

Imagine a silver, luminous cord attached to the center of your chest.
It is unbreakable and infinite in length. It connects your awareness to your body.

Now imagine your awareness gently rising — just a few inches above your body.
The silver cord stretches easily. You are still connected, still safe.

Float here. Notice what it feels like to be slightly separate from your physical form.
When you are ready, drift back down. Let the visualization dissolve.

Use this before sleep to normalize the sensation of separation.''',
          sortOrder: 2,
        ),
      ];

  // --- Helpers ---

  ContentItemsCompanion _technique({
    required int id,
    required String title,
    required String body,
    required String excerpt,
    required int difficulty,
    required int duration,
    required int sortOrder,
    required String tags,
  }) =>
      ContentItemsCompanion(
        id: Value(id),
        contentType: const Value(0), // obeTechnique
        title: Value(title),
        body: Value(body),
        excerpt: Value(excerpt),
        difficulty: Value(difficulty),
        estimatedDurationMinutes: Value(duration),
        isBuiltIn: const Value(true),
        tagsRaw: Value(tags),
        sortOrder: Value(sortOrder),
      );

  ContentItemsCompanion _affirmation({
    required int id,
    required String title,
    required String body,
    required int sortOrder,
  }) =>
      ContentItemsCompanion(
        id: Value(id),
        contentType: const Value(1), // affirmation
        title: Value(title),
        body: Value(body),
        isBuiltIn: const Value(true),
        sortOrder: Value(sortOrder),
      );

  ContentItemsCompanion _meditation({
    required int id,
    required String title,
    required String body,
    required String excerpt,
    required int duration,
    required int sortOrder,
  }) =>
      ContentItemsCompanion(
        id: Value(id),
        contentType: const Value(2), // meditation
        title: Value(title),
        body: Value(body),
        excerpt: Value(excerpt),
        estimatedDurationMinutes: Value(duration),
        isBuiltIn: const Value(true),
        sortOrder: Value(sortOrder),
      );

  ContentItemsCompanion _visualization({
    required int id,
    required String title,
    required String body,
    required String excerpt,
    required int sortOrder,
  }) =>
      ContentItemsCompanion(
        id: Value(id),
        contentType: const Value(3), // visualization
        title: Value(title),
        body: Value(body),
        excerpt: Value(excerpt),
        isBuiltIn: const Value(true),
        sortOrder: Value(sortOrder),
      );
}
