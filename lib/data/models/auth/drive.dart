import 'package:freezed_annotation/freezed_annotation.dart';

part 'drive.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Drive {
  final int packageId;
  final String packageName;
  final int storageLimit;
  final int storageUsed;
  final int storageRemain;

  const Drive({
    required this.packageId,
    required this.packageName,
    required this.storageLimit,
    required this.storageUsed,
    required this.storageRemain,
  });

  factory Drive.fromJson(Map<String, dynamic> json) => _$DriveFromJson(json);

  double getRemainPercentage() {
    if (storageLimit == 0) {
      return 0.0; // Avoid division by zero
    }
    return 100 - (storageRemain / storageLimit) * 100;
  }
}
