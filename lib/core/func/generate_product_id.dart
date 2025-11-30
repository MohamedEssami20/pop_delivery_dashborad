import 'dart:math';

String generateProductId() {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random();
  return String.fromCharCodes(
    Iterable.generate(
      15,
      (_) => chars.codeUnitAt(random.nextInt(chars.length)),
    ),
  );
}
