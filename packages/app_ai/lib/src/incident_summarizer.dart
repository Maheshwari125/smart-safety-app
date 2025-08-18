abstract class IncidentSummarizer {
	Future<String> summarize(String incidentNotes, {String? locale});
	Future<String> translate(String text, {required String targetLocale});
}