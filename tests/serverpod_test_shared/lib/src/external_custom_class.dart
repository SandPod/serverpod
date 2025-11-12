class ExternalCustomClass {
  final String value;

  const ExternalCustomClass(this.value);

  String toJson() => value;

  static ExternalCustomClass fromJson(final dynamic data) {
    return ExternalCustomClass(data);
  }
}
