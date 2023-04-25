// ignore_for_file: public_member_api_docs, sort_constructors_first
class FileModel {
  final String path;
  final String name;
  final String? extension;
  final int size;

  const FileModel(
    this.path,
    this.name,
    this.extension,
    this.size,
  );

  @override
  String toString() =>
      'FileModel(path: $path, name: $name, extension: $extension, size: $size)';
}
