

class Directions {
  String? humanReadableAddress;
  String? locationAddress;
  String? locationId;
  double? locationLatitude;
  double? locationLongitude;

  Directions({
    this.humanReadableAddress,
    this.locationAddress,
    this.locationId,
    this.locationLatitude,
    this.locationLongitude,



  });

  // Directions.fromSnapshot(DataSnapshot snap) {
  //   humanReadableAddress = (snap.value as dynamic)['humanReadableAddress'];
  //   locationAddress = (snap.value as dynamic)['locationAddress'];
  //   locationId = (snap.value as dynamic)['locationId'];
  //   locationLatitude = (snap.value as dynamic)['locationLatitude'];
  //   locationLongitude = (snap.value as dynamic)['locationLongitude'];
  // }


}
