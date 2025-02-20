class SelectedRowModel {
  int ?id;
  bool isSelected;
  SelectedRowModel({
    this.id,
    this.isSelected = false,
  });
}

class SelectedAvailableModel {
  int ?id;
  List<String>? available;
  SelectedAvailableModel({
    this.id,
    this.available,
  });
}