enum PopupMenuOptions {
  edit('edit'),
  delete('delete');

  final String value;
  const PopupMenuOptions(this.value);

  @override
  String toString() => value;
}
