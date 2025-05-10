extension CapitalizeExtension on String {
  String capitalizeFirstOfEach() {
    return this.split(' ').map((word) => word.capitalize()).join(' ');
  }

  String capitalize() {
    if (this.isEmpty) return this;
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
