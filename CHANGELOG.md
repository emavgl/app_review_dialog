## 2.0.1

- Shortened the pubspec description to fit pub.dev's length guidelines.
- Replaced deprecated `WillPopScope` with `PopScope`; bumped the minimum
  Flutter SDK to 3.22.0 accordingly.
- Raised the minimum `url_launcher` constraint to `^6.1.0` (the lowest
  version that provides the `LaunchMode` API this package relies on),
  fixing `dart pub downgrade` resolution.
- Added an `example/` app.

## 2.0.0

- **Breaking:** `AppReviewDialog.show()` now always returns a non-null
  `AppReviewDialogResult` (tapping the modal barrier used to return `null`;
  it now resolves to `AppReviewDialogAction.dismissed`).
- **Breaking:** `AppReviewDialogAction` gained a new `cancelled` value.
  Tapping the explicit "Cancel" button now returns `cancelled`, while
  backing out via the device back button/gesture or tapping outside the
  dialog returns `dismissed` — callers can tell an explicit "no thanks"
  apart from an incidental dismissal.

## 1.0.0

- Initial release.
- 5‑star rating dialog with full‑point granularity.
- Two outcome paths: positive → "Rate in store" + "Support & Contribute"; negative → "Send us an email".
- Automatic locale detection (22 languages).
- Android `market://` and iOS `itms-apps://` deep links with HTTPS fallbacks.
- Theme‑aware (follows `Material` color scheme, light & dark).
- Every string overridable per invocation.
- `minPositiveRating` threshold, `continueButtonLabel`, `storePackageName`, `appStoreId`, `supportWebsitePage` parameters.
- Bounce animation on tapped star.
