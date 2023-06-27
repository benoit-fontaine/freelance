import 'pricing_data.dart';

extension PricingDataExtensions on PricingData {
  String get backgroundTag => tag + TAG_BG_SUFFIX;

  String get titleTag => tag + TAG_TITLE_SUFFIX;

  String get iconTag => tag + TAG_ICON_SUFFIX;
}

const String TAG_BG_SUFFIX = "_image";
const String TAG_TITLE_SUFFIX = "_title";
const String TAG_ICON_SUFFIX = "_icon";
