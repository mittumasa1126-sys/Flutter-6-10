class Validators {
  static String? name(String? v) {
    if (v == null || v.trim().isEmpty) return 'Name required';
    if (v.trim().length < 3) return 'At least 3 characters';
    return null;
  }

  static String? email(String? v) {
    if (v == null || v.trim().isEmpty) return 'Email required';
    final re = RegExp(r"^[^@\s]+@[^@\s]+\.[^@\s]+$");
    if (!re.hasMatch(v.trim())) return 'Invalid email';
    return null;
  }

  static String? age(String? v) {
    if (v == null || v.trim().isEmpty) return 'Age required';
    final age = int.tryParse(v.trim());
    if (age == null) return 'Enter a valid number';
    if (age < 10 || age > 100) return 'Age should be between 10 and 100';
    return null;
  }
}
