class TriageInput {
	final String symptomsText;
	final int age;
	final String? sex;
	TriageInput({required this.symptomsText, required this.age, this.sex});
}

class TriageResult {
	final String severity; // e.g., critical, urgent, routine
	final List<String> recommendations;
	TriageResult({required this.severity, required this.recommendations});
}

abstract class TriageAssistantService {
	Future<TriageResult> assess(TriageInput input);
}