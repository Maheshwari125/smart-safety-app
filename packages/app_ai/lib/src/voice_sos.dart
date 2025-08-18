abstract class VoiceActivationService {
	Future<void> initialize({List<String> wakePhrases = const ['help me']});
	Stream<void> onWake();
	Future<void> dispose();
}

abstract class SpeechService {
	Future<void> startListening({String locale = 'en'});
	Future<void> stopListening();
	Stream<String> onTranscript();
}

abstract class TextToSpeechService {
	Future<void> speak(String text, {String locale = 'en'});
}