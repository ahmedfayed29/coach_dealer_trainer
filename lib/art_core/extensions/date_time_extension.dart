// extension TimeDate on String {
//   String get time {
//     DateTime? dateTime = DateTime.tryParse(this);
//     if (dateTime != null) {
//       return DateFormat('HH:mm').format(dateTime).toString();
//     } else {
//       return this;
//     }
//   }
//
//   String get date {
//     DateTime? dateTime = DateTime.tryParse(this);
//     if (dateTime != null) {
//       return DateFormat('yyyy-MM-dd').format(dateTime).toString();
//     } else {
//       return this;
//     }
//   }
// }
