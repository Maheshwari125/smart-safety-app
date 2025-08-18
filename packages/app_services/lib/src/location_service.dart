abstract class LocationService {
	Future<bool> isLocationEnabled();
	Future<bool> requestPermission();
	Stream<LocationPoint> watchLocation();
	Future<LocationPoint?> getLastKnownLocation();
}

class LocationPoint {
	final double latitude;
	final double longitude;
	final double? accuracyMeters;
	final DateTime timestamp;
	LocationPoint({required this.latitude, required this.longitude, this.accuracyMeters, DateTime? timestamp})
		: timestamp = timestamp ?? DateTime.now();
}