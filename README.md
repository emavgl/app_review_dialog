# App Review Dialog

A beautiful, fully localised in-app rating dialog for Flutter. Inspired by the native Android in-app review flow — but fully customisable and works on all platforms.

## Features

- ⭐ **Star rating** with half-star granularity (tap to select)
- 🎯 **Two paths** — positive ratings → "Rate in store" + optional "Support" link; lower ratings → send feedback via email
- 🌐 **22 languages** — all strings localised with a `LocalizationsDelegate`
- 🎨 **Theme-aware** — follows `Material` color scheme (light & dark)
- 🔧 **Everything overridable** — pass your own strings, email, URLs per invocation
- 📱 **Play Store deep link** — just pass the package name, the dialog builds `market://` + https fallback

## Quick start

```dart
import 'package:app_review_dialog/app_review_dialog.dart';

final result = await AppReviewDialog.show(
  context,
  supportEmail: 'hello@myapp.com',
  storePackageName: 'com.example.myapp',
  supportWebsitePage: 'https://myapp.com/support',  // optional
  minPositiveRating: 3.5,                            // default
);
```

| `result.rating` | `result.action` | What happens next |
|---|---|---|
| ≥ 3.5 | `ratedPositive` | Dialog popped; you can call your own analytics. |
| < 3.5 | `ratedNegative` | Email button opens `mailto:` with `supportEmail`. |
| — | `dismissed` | User tapped outside or pressed Back. |

## Setup

Add the localisation delegate to your `MaterialApp`:

```dart
MaterialApp(
  localizationsDelegates: [
    appReviewLocalizationsDelegate,
    // ... other delegates
  ],
  supportedLocales: supportedAppReviewLocales,
  // ...
);
```

## Parameters

| Parameter | Type | Required | Description |
|---|---|---|---|
| `supportEmail` | `String` | ✅ | Email for the feedback button |
| `storePackageName` | `String?` | | Google Play package name for `market://` deep link |
| `supportWebsitePage` | `String?` | | Adds a "Support & Contribute" button on positive path |
| `minPositiveRating` | `double` | | Threshold between positive/negative flows (default 3.5) |
| `title` … `emailButtonLabel` | `String?` | | Override any localised string |

## Supported locales

`ar` · `ca` · `da` · `de` · `el` · `en` · `es` · `fr` · `hr` · `it` · `ja` · `or` · `pl` · `pt` · `pt-BR` · `pt-PT` · `ru` · `ta` · `tr` · `uk` · `vec` · `zh`

## License

MIT
