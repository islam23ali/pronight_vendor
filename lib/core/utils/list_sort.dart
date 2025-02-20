enum SortOrder { ascending, descending, unsorted }

// void main() {
//   List<String> timeList = ['2:30', '10:15', '5:45', '1:00', '8:20'];
//
//   // Define a function to check if the list is sorted alphabetically (ACE)
//   bool isSortedAlphabetically(List<String> list) {
//     for (int i = 0; i < list.length - 1; i++) {
//       if (list[i].compareTo(list[i + 1]) > 0) {
//         return false;
//       }
//     }
//     return true;
//   }
//
//   // Define a function to check if the list is sorted in reverse order (DE)
//   bool isSortedReverse(List<String> list) {
//     for (int i = 0; i < list.length - 1; i++) {
//       if (list[i].compareTo(list[i + 1]) < 0) {
//         return false;
//       }
//     }
//     return true;
//   }
//
//   // Custom comparator function to sort by hour and minute
//   timeList.sort((a, b) {
//     List<String> timePartsA = a.split(':');
//     List<String> timePartsB = b.split(':');
//
//     int hourA = int.parse(timePartsA[0]);
//     int minuteA = int.parse(timePartsA[1]);
//
//     int hourB = int.parse(timePartsB[0]);
//     int minuteB = int.parse(timePartsB[1]);
//
//     if (hourA != hourB) {
//       return hourA.compareTo(hourB);
//     } else {
//       return minuteA.compareTo(minuteB);
//     }
//   });
//
//   // Check sorting condition and adjust if necessary
//   if (isSortedAlphabetically(timeList)) {
//     timeList.sort((a, b) => b.compareTo(a)); // Reverse sort if already alphabetical
//   } else if (isSortedReverse(timeList)) {
//     timeList.sort((a, b) => a.compareTo(b)); // Alphabetical sort if reverse
//   }
//
//   print(timeList); // Output the sorted list
// }

// void main() {
//   List<String> timeList = ['2:30', '10:15', '5:45', '1:00', '8:20'];
//
//   sortTimeList(timeList);
//   checkAndAdjustSortOrder(timeList);
//
//   print(timeList); // Output the sorted list
// }

/// Sorts a list of time strings in "HH:MM" format by hour and minute.
void sortTimeList(List<String> timeList) {
  timeList.sort((a, b) {
    List<String> timePartsA = a.split(':');
    List<String> timePartsB = b.split(':');

    int hourA = int.parse(timePartsA[0]);
    int minuteA = int.parse(timePartsA[1]);

    int hourB = int.parse(timePartsB[0]);
    int minuteB = int.parse(timePartsB[1]);

    if (hourA != hourB) {
      return hourA.compareTo(hourB);
    } else {
      return minuteA.compareTo(minuteB);
    }
  });

}

/// Checks if the list is sorted alphabetically or in reverse order and adjusts if needed.
void checkAndAdjustSortOrder(List<String> timeList) {
  if (isSortedAlphabetically(timeList)) {
    timeList.sort((a, b) => b.compareTo(a)); // Reverse sort if already alphabetical
  } else if (isSortedReverse(timeList)) {
    timeList.sort((a, b) => a.compareTo(b)); // Alphabetical sort if in reverse order
  }
}

/// Returns true if the list is sorted alphabetically.
bool isSortedAlphabetically(List<String> list) {
  for (int i = 0; i < list.length - 1; i++) {
    if (list[i].compareTo(list[i + 1]) > 0) {
      return false;
    }
  }
  return true;
}

/// Returns true if the list is sorted in reverse order.
bool isSortedReverse(List<String> list) {
  for (int i = 0; i < list.length - 1; i++) {
    if (list[i].compareTo(list[i + 1]) < 0) {
      return false;
    }
  }
  return true;
}

SortOrder getAlphabeticSortOrder(List<String> list) {
  List<String> sortedList = List.from(list)..sort();

  if (list.isEmpty || list.length == 1) {
    return SortOrder.unsorted;
  }

  if (list.toString() == sortedList.toString()) {
    return SortOrder.ascending;
  } else if (list.toString() == sortedList.reversed.toList().toString()) {
    return SortOrder.descending;
  } else {
    return SortOrder.unsorted;
  }
}
SortOrder checkSortOrder(List<int> list) {

  if (list.isEmpty || list.length == 1) {
    return SortOrder.unsorted;
  }

  // Check if the list is sorted in ascending order
  bool isAscending = true;
  for (int i = 0; i < list.length - 1; i++) {
    if (list[i] > list[i + 1]) {
      isAscending = false;
      break;
    }
  }

  if (isAscending) {
    return SortOrder.ascending;
  }

  // Check if the list is sorted in descending order
  bool isDescending = true;
  for (int i = 0; i < list.length - 1; i++) {
    if (list[i] < list[i + 1]) {
      isDescending = false;
      break;
    }
  }

  if (isDescending) {
    return SortOrder.descending;
  }

  return SortOrder.unsorted;
}

  // List<int> ascendingList = [1, 2, 3, 4, 5];
  // List<int> descendingList = [5, 4, 3, 2, 1];
  // List<int> unsortedList = [2, 5, 3, 1, 4];
  //
  // print(checkSortOrder(ascendingList)); // Output: SortOrder.ascending
  // print(checkSortOrder(descendingList)); // Output: SortOrder.descending
  // print(checkSortOrder(unsortedList)); // Output: SortOrder.unsorted
