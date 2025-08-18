enum AppPermission { location, camera, microphone, notifications, bluetooth }

enum PermissionStatus { granted, denied, permanentlyDenied, restricted }

abstract class PermissionsService {
	Future<PermissionStatus> request(AppPermission permission);
	Future<PermissionStatus> check(AppPermission permission);
}