import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const ResumeScreeningApp());
}

class ResumeScreeningApp extends StatelessWidget {
  const ResumeScreeningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resume Screening System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController jobDescriptionController =
      TextEditingController();

  PlatformFile? selectedFile;

  String selectedFileName = "No Resume Selected";

  bool isLoading = false;

  double matchScore = 0;

  String recommendation = "-";

  List<dynamic> matchedSkills = [];

  List<dynamic> missingSkills = [];

  Future<void> pickResume() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      withData: true,
    );

    if (result != null) {
      setState(() {
        selectedFile = result.files.first;
        selectedFileName = result.files.first.name;
      });
    }
  }

  Future<void> analyzeResume() async {
    if (selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a PDF resume"),
        ),
      );
      return;
    }

    if (jobDescriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a job description"),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse("http://127.0.0.1:8000/analyze"),
      );

      request.fields["job_description"] =
          jobDescriptionController.text;

      request.files.add(
        http.MultipartFile.fromBytes(
          "resume",
          selectedFile!.bytes!,
          filename: selectedFile!.name,
        ),
      );

      var response = await request.send();

      var responseBody =
          await response.stream.bytesToString();

      var data = jsonDecode(responseBody);

      setState(() {
        matchScore =
            (data["match_score"] ?? 0).toDouble();

        recommendation =
            data["recommendation"] ?? "-";

        matchedSkills =
            data["matched_skills"] ?? [];

        missingSkills =
            data["missing_skills"] ?? [];
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Resume Screening System",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: pickResume,
                child: const Text(
                  "Upload Resume PDF",
                ),
              ),

              const SizedBox(height: 10),

              Text(
                selectedFileName,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: jobDescriptionController,
                maxLines: 8,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Job Description",
                  hintText:
                      "Paste Job Description Here",
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed:
                    isLoading ? null : analyzeResume,
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        "Analyze Resume",
                      ),
              ),

              const SizedBox(height: 30),

              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Result",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Match Score: $matchScore%",
                      ),

                      Text(
                        "Recommendation: $recommendation",
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Matched Skills",
                        style: TextStyle(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      ...matchedSkills.map(
                        (skill) => Text(
                          "✓ $skill",
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Missing Skills",
                        style: TextStyle(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      ...missingSkills.map(
                        (skill) => Text(
                          "✗ $skill",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}