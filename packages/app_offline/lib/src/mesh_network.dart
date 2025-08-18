abstract class MeshNetworkService {
	Future<void> initialize();
	Future<void> advertiseAvailability({required String nodeId});
	Stream<MeshMessage> onMessage();
	Future<void> sendMessage(String nodeId, MeshMessage message);
}

class MeshMessage {
	final String type; // e.g., sos, ack
	final Map<String, dynamic> payload;
	MeshMessage({required this.type, required this.payload});
}