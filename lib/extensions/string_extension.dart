extension StringExtension on String {
  bool get isRemoteSource => startsWith('http');
}
