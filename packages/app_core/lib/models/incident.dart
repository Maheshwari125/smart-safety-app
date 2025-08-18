class Incident {
	final String id;
	final String type; // e.g., sos, medical, fire
	final DateTime createdAt;
	final double? latitude;
	final double? longitude;
	final int priority; // 1 (highest) - 5

	Incident({
		required this.id,
		required this.type,
		DateTime? createdAt,
		this.latitude,
		this.longitude,
		this.priority = 3,
	}) : createdAt = createdAt ?? DateTime.now();
}