abstract class NotificationsService {
	Future<void> initialize();
	Future<void> requestPermission();
	Future<void> showLocalNotification({required String id, required String title, required String body});
	Stream<NotificationTap> onNotificationTap();
}

class NotificationTap {
	final String id;
	final Map<String, String> payload;
	NotificationTap(this.id, this.payload);
}