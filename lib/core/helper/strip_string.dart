/// Cleans any Markdown fences and extracts the JSON array.
String cleanJsonArray(String input) {
  // Strip out all code block markers with more comprehensive patterns
  // This handles indentation, optional language specifiers, and various whitespace patterns
  var s =
      input.replaceAll(RegExp(r'^\s*```\s*(?:json)?\s*', multiLine: true), '');
  s = s.replaceAll(RegExp(r'\s*```\s*$', multiLine: true), '');

  // Remove any leading/trailing whitespace before looking for brackets
  s = s.trim();

  // Find the first `[` and the last `]`
  final start = s.indexOf('[');
  final end = s.lastIndexOf(']') + 1;

  // If we found a valid bracket pair, substring it
  if (start >= 0 && end > start) {
    s = s.substring(start, end);
  }

  return s.trim();
}
