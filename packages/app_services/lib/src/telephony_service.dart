abstract class TelephonyService {
	Future<bool> sendSms({required String phoneNumber, required String message});
}