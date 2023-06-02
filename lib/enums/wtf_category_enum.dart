enum WTFCategoryEnum {
  all,
  wtfExclusive,
  wtfCoBranded,
  wtfPowered,
}

extension CustomEnumExtension on WTFCategoryEnum {
  String get name {
    switch (this) {
      case WTFCategoryEnum.all:
        return 'All';
      case WTFCategoryEnum.wtfExclusive:
        return 'WTF Exclusive';
      case WTFCategoryEnum.wtfCoBranded:
        return 'WTF Co-branded';
      case WTFCategoryEnum.wtfPowered:
        return 'WTF Powered';
    }
  }

  String get value {
    switch (this) {
      case WTFCategoryEnum.all:
        return 'All';
      case WTFCategoryEnum.wtfExclusive:
        return 'Exclusive';
      case WTFCategoryEnum.wtfCoBranded:
        return 'Co-branded';
      case WTFCategoryEnum.wtfPowered:
        return 'Powered';
    }
  }
}
