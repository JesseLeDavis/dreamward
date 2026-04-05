# Dreamward — Atmospheric Design Proposal
## From Field Terminal to Signal Receiver

---

## Diagnostic: What the App Is Now

The current design system is disciplined and coherent. Share Tech Mono everywhere, sharp corners, amber on deep olive-black, data-dense cards. It reads correctly as "military field terminal from the 1990s." That foundation is solid and should be preserved.

What it lacks is the sense that the device is doing something — that it is **receiving**. The current UI is a very good display system. It does not feel like it is listening to anything. The borders are inert. The backgrounds are flat. The empty states say "nothing here yet" rather than "channel open, awaiting signal."

The gap between what exists and what the vision requires is not about adding decoration. It is about making the UI behave as if it is *tuned to something*. Every element should imply: there is a void on the other side of this interface, and the device is in contact with it.

---

## 1. Color Palette Refinements

### What to Keep

Keep the amber system exactly as-is. `#E8A020` (amber), `#F5C050` (amberGlow), `#B87818` (amberDim), `#3D2E08` (amberMuted). Amber is the primary phosphor color. It is correct.

Keep all background tiers. The olive-black gradient from `#0E0F0B` to `#21241A` is exactly right for a device that has been running in a dark room.

### Changes

**Add a phosphor green signal color.** The current `green` (`#7AB648`) is too bright and too natural — it reads as "success indicator" on a modern app. Replace it with a true phosphor green:

```
signalGreen      = Color(0xFF39FF14)  // raw phosphor — use sparingly
signalGreenDim   = Color(0xFF1A7A0A)  // dimmed signal / inactive
signalGreenMuted = Color(0xFF0D2A08)  // tinted background surface
```

The existing `green` / `greenDim` / `greenMuted` can remain for the "logged/success" semantic use, but the new signal green is used specifically for: onset indicators, active reception states, live data coming in. The distinction matters — amber is the operator's interface, green is data arriving from outside.

**Add a deep void color for atmospheric use:**

```
voidBlack = Color(0xFF090A07)  // deeper than backgroundDeep
```

**Add a carrier amber for FieldSection header backgrounds:**

```
amberCarrier = Color(0xFF1A1208)  // barely visible amber tint, darker than amberMuted
```

**Modify textMuted slightly:** Current `#545040` is warm but reads as "disabled." Push to `#4A4E3C` — slightly cooler, reads as ambient background noise rather than disabled state.

### Scan Line Overlay (CustomPainter)

Add a `ScanLineOverlay` widget that draws horizontal lines at 3px intervals with 8% opacity using a `CustomPainter`. Apply to the scaffold background of Today and OBE screens, and FieldSection headers. Never applied over text content areas. Target: visible when looking for them, invisible during normal use.

### Background Noise Texture

Add very subtle static noise to `backgroundBase`. Best approach: pre-bake a 256x256 noise PNG at 4% opacity, tiled as a `DecorationImage`. Monochrome, slightly cool, not animated. Static — like phosphor persistence on a monitor, not television static.

---

## 2. Typography Enhancements

### Keep Share Tech Mono

Do not change fonts. Share Tech Mono is correct. It has the right weight and the slightly-uneven character spacing that reads as a real terminal rather than a font designed to look like one.

### Adjustments

**Increase `heading` letter-spacing from 2.5 to 3.5.** Single highest-impact typography change in the system. App bar titles and FieldSection labels will read as NOAA data readout or military teletype headers.

**Increase `label` letter-spacing from 1.8 to 2.2.** All instrument panel labels read with more authority.

**Introduce `dataOutput` style** — for dream snippets and OBE narrative content (data that came back from the field):

```dart
static TextStyle get dataOutput => _mono(
  fontSize: 12,
  color: AppColors.textPrimary,
  letterSpacing: 0.1,
  height: 1.5,
);
```

Text the user *writes* (prompts, intentions) uses `body`. Text that *came back* (dream content, OBE narratives) uses `dataOutput`. Subtle but semantically meaningful.

**Introduce `signalText`** — for instrument status lines:

```dart
static TextStyle get signalText => _mono(
  fontSize: 11,
  color: AppColors.signalGreenDim,
  letterSpacing: 0.3,
  height: 1.6,
);
```

Used for: carrier status lines, transmission received headers, "awaiting signal" states. The voice of the device, not the operator.

### Case Rules

- **ALL CAPS**: Labels, headers, status indicators, section titles, tags. Operator commands and instrument readouts.
- **Lowercase**: Signal-received data. Dream snippet body text and OBE narrative content should be lowercase. The machine speaks in uppercase. The signal comes back in lowercase.
- **Mixed / sentence case**: Field Guide descriptions only. These are explanations written by a human for a human.

This is a deliberate inversion. The content that came from somewhere else should look different from the interface that displays it.

---

## 3. Structural UI Patterns

### Signal Divider

Replace non-structural `Divider` uses with a `SignalDivider` widget. The pattern: `─────── ◇ ───────` for prominent dividers; alternating 4px dash / 3px gap for secondary ones. The solid 1px `Divider` remains only for the FieldSection header-to-body separator — that one is structural.

### FieldSection Header Refinement

1. Add a 4px amber left-border accent to every FieldSection header bar. `Border(left: BorderSide(color: AppColors.amberDim, width: 4))` on the header Container. This creates a channel indicator — the most important single visual change to `field_section.dart`.

2. Use `amberCarrier` as the header background instead of `backgroundSurface`. Faint but warm — implies the header is powered.

3. Add a 5px status dot to the right of the label. Three states: `nominal` (borderStrong), `active` (amber), `receiving` (signalGreen, pulsing). Default: `nominal`. Sections with live data can be wired to `active`.

### Instrument Panel Borders (OBE Cards and Stats Strip)

Double-border treatment: inner border `borderNormal`, outer border `borderSubtle`, 1px gap via `Padding(padding: EdgeInsets.all(1))`. Not applied to dream cards (too much visual density) — only OBE cards and the stats strip.

### Transmission Frame

New `TransmissionFrame` widget for received content (dream body text, OBE narratives):
- Background: `voidBlack`
- Left border: 2px `signalGreenDim`
- Top label: `◀ TRANSMISSION RECEIVED [timestamp]` in `signalText`
- Content padding: `EdgeInsets.fromLTRB(12, 8, 10, 10)`

A dream is not a note. This widget makes the receiver/signal relationship explicit.

### Signal Status Bar

Persistent 18px strip between AppBar bottom line and screen content on Today and OBE screens:
- Left: `CARRIER: STABLE` in `signalText`
- Center: animated `· · · · · · · ·` dots cycling at 800ms intervals in `textMuted`
- Right: last log timestamp in `signalText`

The device is always running. It does not go idle.

### Checklist Item Markers

Replace `✓` with terminal state markers:
- Unchecked: `[ ]` with inner `--` in `textMuted`
- Checked: `[◆]` with amber diamond fill
- Auto/true: `[●]` green circle; Auto/false: `[○]` dim outline

---

## 4. App-Wide Atmosphere Changes

### Bottom Navigation Bar

1. Add 2px amber top border to the nav bar (facing the content, not the system tray). Instrument housing boundary.
2. Replace the filled `amberMuted` indicator rectangle with a 2px amber underline below the active label only. Terminals use underlines, not highlight boxes.
3. Increase nav label size to 10px, letter-spacing 1.5.

Optional nav label rename for full aesthetic consistency:
- TODAY → CURRENT | DREAMS → LOG | OBE → FIELD | EXPLORE → LIB | CALENDAR → ARCHIVE

### Screen Transitions

Replace Flutter default slide with a `FadeToBlackTransition`: fade out to `voidBlack` in 80ms, fade in from `voidBlack` in 100ms. Total 180ms. Mimics a CRT switching inputs. Implement via `CustomTransitionPage` in `app_router.dart`.

### Loading States

Replace `CircularProgressIndicator` with a horizontal bar acquisition animation:
- 6 rectangles (4px wide, 8px tall, 2px gap)
- Fill left-to-right over 1.2 seconds in amber, loop
- Below bar: `ACQUIRING...` in `signalText`
- On data return: crossfade over 150ms — the signal came in

---

## 5. Per-Screen Suggestions

### Today Screen

- **AppBar**: Add `SIG: NOMINAL` in `signalText` style next to the date. 10px. Carrier signal monitor.
- **Sleep Stat**: Add `↓` prefix before the value — downward arrow implies incoming data. Add `QUALITY: --` below in `label` style (grayed until data exists).
- **Affirmation**: Slow opacity pulse 100%→85%→100% over 4 seconds. The text is being broadcast, not displayed. `CYCLE ▶` becomes `NEXT SIGNAL ▶` after first cycle.
- **Session Target placeholder**: Change from `SET YOUR TARGET FOR TONIGHT...` to `// awaiting target coordinates`. The `//` comment syntax reads as a system prompt awaiting operator input.
- **Status line**: `TARGET LOCKED` → `TARGET ACQUIRED`. `NO TARGET SET` → `NO TARGET — OPEN FIELD`.
- **Last Session**: FieldSection label: `LAST TRANSMISSION`. Apply `TransmissionFrame` to OBE and dream snippets. Date inside frame: `RECEIVED: 01 MAR`.
- **Ritual Checklist**: Rename to `PRE-TRANSMISSION PROTOCOL`. After all 5 complete, status dot pulses once amber.
- **Stats Strip**: Replace pipe separators with `SignalDivider`. Add fourth stat: `CLARITY AVG`.

### Dreams Screen

- **AppBar subtitle**: `[n] TRANSMISSIONS ON RECORD` in `signalText` below the title.
- **Dream cards**: Move clarity bar to header row, relabel `REC:` (reception quality). Frees body for more snippet text.
- **Dream snippets**: Apply `dataOutput` style.
- **Empty state**: `CHANNEL OPEN.\nNO TRANSMISSIONS ON RECORD.\n\nSignal is present. Recall what you find there.` — first two lines in `label`, third in `signalText`.
- **Date separators**: Replace simple separators with telemetry-style date headers: `── 2026.03.01 ──────────────────`

### OBE Screen

- **Filter bar**: Add third line: `CHANNEL: ◀ RECEIVING` in `signalText` when entries exist; `◀ OPEN` when no matches.
- **Phase bar**: Add faint amber `BoxShadow` behind filled segments (30% alpha, zero blur). Phase depth gets a glow. Only place in app where glow is appropriate.
- **SURGE onset**: Use `signalGreen` color for the bar segments and label — not amber. SURGE is contact. It gets the signal color.
- **Empty state**: Add `FIELD UNIT READY.\nNO EXCURSIONS ON RECORD.` above the phase table.
- **OBE card snippets**: Apply `dataOutput` style. Most "received" data in the app.

### Explore Screen

- Frame content as a classified field manual. Section headers: `TECHNIQUE LIBRARY` etc.
- Affirmations displayed in `displayAmber` large format — they are declarations, not list items.
- Loading state: `RETRIEVING FIELD DATA...` with bar acquisition animation.

### Calendar Screen

- Replace dot indicators with small 3-segment horizontal bars in day cell corners. Amber for dreams, `signalGreenDim` for OBE.
- Selected day: double-border treatment + amber left-accent border. No highlight fill.
- Month navigation: `◀ PREV` / `NEXT ▶` text buttons. No icons.

---

## 6. Micro-Interactions and Copy Tone

### Language Principles

Sounds like a scientist who genuinely believes they are operating detection equipment. Not ironic. Not mystical-marketing. Operational. Calm. Precise. The Field Guide section can be slightly more human — it is documentation.

### Specific String Replacements

| Current | Replacement |
|---------|-------------|
| `NO DREAMS LOGGED` | `CHANNEL OPEN. NO TRANSMISSIONS ON RECORD.` |
| `+ LOG FIRST DREAM` | `+ OPEN FIRST LOG ENTRY` |
| `NO SESSIONS RECORDED.` | `FIELD UNIT READY. NO EXCURSIONS LOGGED.` |
| `+ LOG FIRST ATTEMPT` | `+ BEGIN FIRST EXCURSION RECORD` |
| `NO ENTRIES MATCH CURRENT FILTER.` | `NO RECORDS MATCH CURRENT PARAMETERS.` |
| `SET YOUR TARGET FOR TONIGHT...` | `// awaiting target coordinates` |
| `TARGET LOCKED` | `TARGET ACQUIRED` |
| `NO TARGET SET` | `NO TARGET — OPEN FIELD` |
| `CYCLE ▶` | `NEXT SIGNAL ▶` |
| `VIEW →` | `OPEN RECORD →` |
| `RESET` (ritual) | `CLEAR SEQUENCE` |
| `0 / 4 MANUAL STEPS COMPLETE` | `SEQUENCE 0 / 4 — STANDBY` |
| `4 / 4 MANUAL STEPS COMPLETE` | `SEQUENCE COMPLETE — FIELD READY` |
| Loading text | `ACQUIRING SIGNAL...` |
| Field Guide footer | `This system is yours. The language is a map, not the territory. Adapt it.` |
| Empty calendar day | `NO TRANSMISSIONS — [date]` |
| `STREAK` | `ACTIVE SEQUENCE` |
| `OBE ATTEMPT` (Last Session) | `LAST FIELD EXCURSION` |
| `DREAMS LOGGED` (Last Session) | `SIGNAL RECORD` |
| Error state | `SIGNAL LOST. DATA UNAVAILABLE. [RETRY]` |

---

## 7. Implementation Priority

### Tier 1: High impact, low effort (0.5–1 day each)

1. **Heading letter-spacing 2.5 → 3.5, label 1.8 → 2.2** — one file, `app_typography.dart`. Immediate upgrade across the entire app.
2. **FieldSection 4px amber left-border on header** — one Container decoration change in `field_section.dart`. Every section gets a channel indicator.
3. **All copy replacements** — no visual changes, high conceptual impact. The app stops feeling like an app and starts feeling like a device.
4. **SURGE onset → signalGreen** — single conditional color change in `_VibrationIndicator`. Makes the most intense state visually distinct.
5. **`dataOutput` text style** — add style, apply to dream and OBE snippet text. Reinforces signal/receiver distinction.

### Tier 2: Medium effort, high impact (1–2 days each)

6. **Scan line overlay** — build `ScanLinePainter`, apply to Today and OBE scaffold backgrounds.
7. **`SignalDivider` widget** — build and replace non-structural `Divider` instances.
8. **Carrier status bar strip** — 18px persistent strip on Today and OBE screens.
9. **Screen fade-to-black transition** — `CustomTransitionPage` in `app_router.dart`. One change, global effect.
10. **Ritual checklist terminal markers** — replace `✓` with `◆` / `●` / `○` in `_RitualItem`.

### Tier 3: Significant effort, distinctive impact (2–4 days each)

11. **`TransmissionFrame` widget** — build and apply to dream/OBE detail screens.
12. **Signal acquisition loading animation** — custom animation widget, replace all spinners.
13. **Background noise texture** — noise PNG or shader, always-present texture.
14. **Calendar segment-bar indicators** — rework calendar cell painter.
15. **FieldSection status dot** — add parameter to `FieldSection`, wire from parent state.

### Tier 4: Deferred (implement after BLoC data wiring)

16. Affirmation shimmer animation
17. Sleep stat double-border instrument treatment
18. Ritual completion pulse animation

---

## Summary: The Core Principle

Every element should answer: "Is this the operator's interface, or is this data received from the field?"

The operator's interface (labels, headers, buttons, status indicators) speaks in ALL CAPS, amber, wide tracking. It is what the device displays about itself.

The received data (dream snippets, OBE narratives, affirmations cycling in) comes back cooler, tighter, lowercase. It came from somewhere else. The device is displaying what it caught.

The scan lines, carrier strip, signal acquisition animation — none of these are decorative. They are physical properties of a device that is running, monitoring, receiving. The void is present in the background. The instrument is in contact with it.

The user is not writing in a journal. They are operating field equipment and logging what it returns.
