extension RemoveDuplicatesExtension<T> on List<T> {
  List<T> removeDuplicates(dynamic Function(T) getKey) {
    List<T> uniqueList = [];

    for (var data in this) {
      if (!uniqueList.any((element) => getKey(element) == getKey(data))) {
        uniqueList.add(data);
      }
    }

    return uniqueList;
  }
}
