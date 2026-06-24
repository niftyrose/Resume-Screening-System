# Resume Screening System

## Overview

Resume Screening System is a full-stack application built using **Flutter** and **FastAPI** that helps recruiters and hiring teams analyze resumes against a job description.

The system allows users to upload a resume, enter a job description, and receive a match score along with hiring recommendations based on skill matching.

---

## Features

* Upload Resume PDF
* Enter Job Description
* Resume and Job Description Comparison
* Skill Matching Analysis
* Match Score Calculation
* Hiring Recommendation
* Flutter Frontend
* FastAPI Backend
* REST API Integration

---

## Tech Stack

### Frontend

* Flutter
* Dart
* Material UI

### Backend

* FastAPI
* Python

### Tools & Technologies

* REST API
* JSON Handling
* HTTP Requests
* Git
* GitHub
* VS Code

---

## Project Structure

```text
Resume-Screening-System
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

## How It Works

1. Upload a resume in PDF format.
2. Enter the job description.
3. The frontend sends data to the FastAPI backend.
4. The backend analyzes resume content and compares it with the job description.
5. A match score and recommendation are generated.
6. Results are displayed in the Flutter application.

---

## Installation

### Clone Repository

```bash
git clone https://github.com/niftyrose/Resume-Screening-System.git
```

### Backend Setup

```bash
cd backend
pip install -r requirements.txt
python -m uvicorn main:app --reload
```

### Frontend Setup

```bash
cd frontend
flutter pub get
flutter run -d chrome
```

---

## Future Enhancements

* AI-Based Resume Analysis
* Skill Extraction using NLP
* Resume Ranking System
* Multiple Resume Comparison
* ATS Compatibility Analysis
* PDF Report Generation

---

## Learning Outcomes

* Flutter Application Development
* FastAPI Backend Development
* REST API Integration
* Client-Server Architecture
* JSON Data Handling
* Git & GitHub Version Control

---

## Author

**Nifty Rose Mathew**

B.Tech Computer Science & Engineering
Marian Engineering College

