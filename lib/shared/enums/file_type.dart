enum FileType {
  avatar('avatar'),
  sendFile('sendFile');

  final String value;

  const FileType(this.value);

  @override
  String toString() => value;
}
