
import 'package:get_storage/get_storage.dart';

class AppPreference {
  static const STORAGE_NAME = 'Fudo';
  final _storage = GetStorage(STORAGE_NAME);

  Future<void> init() async {
    await _storage.initStorage;
  }

  static const latitude = 'Latitude';
  static const longitude = 'Longitude';

  static const address = 'Address';
  static const title = 'Title';
  static const bookingTitle = 'BookingTitle';

  static const mobNumber = 'MobileNum';
  static const depId = 'DepartmentId';
  static const attendanceValueId = 'AttendanceId';

  updateLatitude(double Latitude) {
    _storage.write(latitude, Latitude);
  }

  double get getLatitude {
    try {
      return _storage.read(latitude);
    } catch (e) {
      return 0.0;
    }
  }

  updateLongitude(double Longitude) {
    _storage.write(longitude, Longitude);
  }

  double get getLongitude {
    try {
      return _storage.read(longitude);
    } catch (e) {
      return 0.0;
    }
  }

  updateDepId(int departmentId) {
    _storage.write(depId, departmentId);
  }

  int get getDepId {
    try {
      return _storage.read(depId);
    } catch (e) {
      return 0;
    }
  }

  updateAddress(String addressCurrent) {
    _storage.write(address, addressCurrent);
  }

  String get getAddress {
    try {
      return _storage.read(address);
    } catch (e) {
      return '';
    }
  }



  updateTitle(String curTitle) {
    _storage.write(title, curTitle);
  }

  String get getTitle {
    try {
      return _storage.read(title);
    } catch (e) {
      return '';
    }
  }

  updateBookingTitle(String curBookingTitle) {
    _storage.write(bookingTitle, curBookingTitle);
  }

  String get getBookingTitle {
    try {
      return _storage.read(bookingTitle);
    } catch (e) {
      return '';
    }
  }

  updateMobileNumber(String mobileNumber) {
    _storage.write(mobNumber, mobileNumber);
  }

  String get getMobileNumber {
    try {
      return _storage.read(mobNumber);
    } catch (e) {
      return '';
    }
  }

  updateAttendanceId(String attendanceID) {
    _storage.write(attendanceValueId, attendanceID);
  }

  String get getAttendanceId {
    try {
      return _storage.read(attendanceValueId);
    } catch (e) {
      return '';
    }
  }

  clearData() {
    _storage.erase();
  }
}
