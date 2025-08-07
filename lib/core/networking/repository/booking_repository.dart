import 'package:coach/core/networking/responses/booking/booking_response.dart';

import '../network_response.dart';
import 'base_repository.dart';

class BookingRepository extends BaseRepository {
  /// End Points
  final String _todayBooking = '/coach/today-bookings';
  final String _historyBooking = '/coach/bookings-history';

  /// _todayBooking
  Future<NetworkResponse<BookingResponse>> todayBooking() async {
    return networkHandler.get<BookingResponse>(
      BookingResponse(),
      _todayBooking,
    );
  }

  /// _historyBooking
  Future<NetworkResponse<BookingResponse>> historyBooking({String? period}) async {
    final String params = period != null ? '?period=$period' : '';
    return networkHandler.get<BookingResponse>(
      BookingResponse(),
      _historyBooking + params,
    );
  }
}
