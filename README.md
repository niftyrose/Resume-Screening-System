# 📄 Resume Screening System

A full-stack **Resume Screening System** built using **Flutter** and **FastAPI** that helps recruiters and hiring teams analyze resumes against job descriptions.

The application allows users to upload a resume, enter a job description, and receive a skill-based comparison with a matching score and hiring recommendation.

---

# ✨ Features

* 📄 Upload Resume PDF
* 💼 Enter Job Description
* 🔍 Resume & Job Description Comparison
* 🧠 Skill Matching Analysis
* 📊 Match Score Generation
* ✅ Hiring Recommendation
* ⚡ FastAPI REST API Backend
* 📱 Flutter Frontend
* 🔄 JSON Data Handling

---

# 🛠 Tech Stack

## Frontend

* Flutter
* Dart
* Material Design

## Backend

* Python
* FastAPI

## Tools & Technologies

* REST API
* JSON Handling
* HTTP Requests
* Git
* GitHub
* VS Code

---

# 📂 Project Structure

```text
Resume-Screening-System
│
├── assets
│   └── screenshots
│       ├── home.png
│       ├── upload_resume.png
│       ├── job_description.png
│       └── result.png
│
├── backend
│   ├── main.py
│   ├── requirements.txt
│
├── frontend
│   ├── lib
│   │   └── main.dart
│   ├── pubspec.yaml
│
└── README.md
```

---

# 🚀 How It Works

1. Upload a resume in PDF format.
2. Enter the desired job description.
3. The Flutter frontend sends the data to the FastAPI backend.
4. The backend extracts and compares skills from the resume with the job description.
5. A match score and hiring recommendation are generated.
6. The results are displayed in the Flutter application.

---

# 📸 Screenshots

## 🏠 Home Screen

![Home Screen](assets/screenshots/home.png)

---

## 📄 Upload Resume

![Upload Resume](assets/screenshots/upload_resume.png)

---

## 💼 Job Description

![Job Description](assets/screenshots/job_description.png)

---

## 📊 Screening Result

![Result](assets/screenshots/result.png)

---

# ⚙ Installation

## Clone Repository

```bash
git clone https://github.com/niftyrose/Resume-Screening-System.git
```

---

## Backend Setup

```bash
cd backend
pip install -r requirements.txt
python -m uvicorn main:app --reload
```

Backend runs on:

```text
http://127.0.0.1:8000
```

---

## Frontend Setup

```bash
cd frontend
flutter pub get
flutter run -d chrome
```

---

# 🌟 Future Enhancements

* AI-powered Resume Analysis
* NLP-based Skill Extraction
* ATS Compatibility Score
* Resume Ranking System
* Multiple Resume Comparison
* PDF Report Generation
* Resume Improvement Suggestions
* Company-specific Job Matching

---

# 📚 Learning Outcomes

* Flutter Application Development
* FastAPI Backend Development
* REST API Integration
* Client-Server Architecture
* JSON Data Handling
* PDF Processing
* Git & GitHub Version Control
* Frontend & Backend Communication

---

# 👩‍💻 Author

**Nifty Rose Mathew**

🎓 B.Tech Computer Science & Engineering

🏫 Marian Engineering College

---

⭐ If you found this project useful, consider giving it a star!
