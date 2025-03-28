String formatCep(String value) {
  value = value.replaceAll(RegExp(r'\D'), '');

  if (value.length > 8) {
    value = value.substring(0, 8);
  }

  if (value.length >= 6) {
    return '${value.substring(0, 5)}-${value.substring(5)}';
  }

  return value;
}
