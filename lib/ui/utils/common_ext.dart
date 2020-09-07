extension StringExtension on String{
  String get toUrlImage {
    return 'https://image.tmdb.org/t/p/original$this';
  }
}