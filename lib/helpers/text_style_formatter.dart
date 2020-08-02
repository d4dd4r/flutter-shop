camelCaseToUpperSpaceBetween(String text) {
  return text.replaceAllMapped(RegExp(r'([a-z])([A-Z])', multiLine: true),
      (match) {
    return ['${match[1]}', match[2]].join(' ');
  }).replaceAllMapped(RegExp(r'^[a-z]'), (m) => m[0].toUpperCase());
}
