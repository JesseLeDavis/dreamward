import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/signal_loader.dart';
import '../../../../core/widgets/terminal_dialog.dart';
import '../../../../core/widgets/terminal_toast.dart';

/// Create or edit a user-owned affirmation. Built-ins are not routed here.
class AffirmationEditScreen extends StatefulWidget {
  const AffirmationEditScreen({super.key, this.itemId});

  /// Null = create mode.
  final int? itemId;

  @override
  State<AffirmationEditScreen> createState() => _AffirmationEditScreenState();
}

class _AffirmationEditScreenState extends State<AffirmationEditScreen> {
  final _controller = TextEditingController();
  final _db = GetIt.instance<AppDatabase>();

  bool _loading = false;
  String _initial = '';

  bool get _isEdit => widget.itemId != null;

  @override
  void initState() {
    super.initState();
    if (_isEdit) _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final item = await _db.contentDao.getContentItemById(widget.itemId!);
    if (!mounted) return;
    setState(() {
      _initial = item?.title ?? '';
      _controller.text = _initial;
      _loading = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _hasDraft => _controller.text.trim() != _initial.trim();

  Future<bool> _confirmDiscard() async {
    if (!_hasDraft) return true;
    return TerminalDialog.confirm(
      context: context,
      title: 'DISCARD CHANGES?',
      message: 'Unsaved edits will be lost.',
      confirmLabel: 'DISCARD',
      cancelLabel: 'KEEP',
      destructive: true,
    );
  }

  Future<void> _save() async {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      TerminalToast.show(
        context,
        'AFFIRMATION REQUIRED',
        tone: ToastTone.alert,
      );
      return;
    }
    final navigator = Navigator.of(context);
    if (_isEdit) {
      await _db.contentDao.updateContentItem(ContentItemsCompanion(
        id: Value(widget.itemId!),
        title: Value(text),
        body: Value(text),
        updatedAt: Value(DateTime.now()),
      ));
    } else {
      await _db.contentDao.insertContentItem(ContentItemsCompanion(
        contentType: const Value(1),
        title: Value(text),
        body: Value(text),
        isBuiltIn: const Value(false),
        sortOrder: const Value(1000),
      ));
    }
    if (!mounted) return;
    navigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final navigator = Navigator.of(context);
        final discard = await _confirmDiscard();
        if (!mounted) return;
        if (discard) navigator.pop();
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundBase,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundDeep,
          leading: IconButton(
            icon: const Icon(Icons.close,
                size: 24, color: AppColors.textSecondary),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          title: Text(
            _isEdit ? 'EDIT AFFIRMATION' : 'NEW AFFIRMATION',
            style: AppTypography.heading,
          ),
          actions: [
            TextButton(
              onPressed: _loading ? null : _save,
              child: Text(
                'SAVE',
                style: AppTypography.label.copyWith(color: AppColors.amber),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(height: 1, color: AppColors.borderSubtle),
          ),
        ),
        body: _loading
            ? const Center(child: SignalLoader(label: 'LOADING ENTRY...'))
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenH,
                  vertical: AppSpacing.screenV,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('DECLARATION', style: AppTypography.label),
                    const SizedBox(height: 6),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.borderNormal,
                        border: Border.all(
                          color: AppColors.borderStrong.withValues(alpha: 0.6),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: _controller,
                        autofocus: !_isEdit,
                        style: AppTypography.displayAmber.copyWith(fontSize: 16),
                        textCapitalization: TextCapitalization.characters,
                        maxLines: null,
                        minLines: 3,
                        decoration: InputDecoration(
                          hintText: '// I AM ...',
                          hintStyle: AppTypography.hint,
                          contentPadding:
                              const EdgeInsets.all(AppSpacing.cardPad),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      'Spoken or read internally before sleep. Short, present-tense, your voice.',
                      style: AppTypography.signalText,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
