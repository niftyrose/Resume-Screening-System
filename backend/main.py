from fastapi import FastAPI, UploadFile, File, Form
import PyPDF2
from fastapi.middleware.cors import CORSMiddleware
app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Master Skill Database
skill_database = [
    # Programming Languages
    "Python",
    "Java",
    "C",
    "C++",
    "Dart",
    "JavaScript",

    # Frontend
    "HTML",
    "CSS",
    "React",
    "Flutter",

    # Backend
    "FastAPI",
    "Django",
    "Flask",
    "Node.js",

    # Databases
    "SQL",
    "MySQL",
    "PostgreSQL",
    "MongoDB",

    # Cloud
    "AWS",
    "Azure",
    "GCP",

    # Tools
    "Git",
    "GitHub",
    "Docker",
    "Kubernetes",

    # Mobile
    "Firebase",

    # Data Science / AI
    "Machine Learning",
    "Deep Learning",
    "TensorFlow",
    "PyTorch",
    "Pandas",
    "NumPy",
    "Data Analysis",

    # Other
    "REST API",
    "Power BI",
    "Excel"
]


@app.get("/")
def home():
    return {
        "message": "Resume Screening System API is running!"
    }


@app.post("/analyze")
async def analyze_resume(
    resume: UploadFile = File(...),
    job_description: str = Form(...)
):

    # Read PDF Resume
    pdf_reader = PyPDF2.PdfReader(resume.file)

    resume_text = ""

    for page in pdf_reader.pages:
        text = page.extract_text()

        if text:
            resume_text += text

    # Extract Required Skills from Job Description
    required_skills = []

    for skill in skill_database:
        if skill.lower() in job_description.lower():
            required_skills.append(skill)

    # Find Matching Skills
    matched_skills = []

    for skill in required_skills:
        if skill.lower() in resume_text.lower():
            matched_skills.append(skill)

    # Find Missing Skills
    missing_skills = []

    for skill in required_skills:
        if skill not in matched_skills:
            missing_skills.append(skill)

    # Calculate Match Score
    score = 0

    if len(required_skills) > 0:
        score = (
            len(matched_skills)
            / len(required_skills)
        ) * 100

    score = round(score, 2)

    # Recommendation
    if score >= 80:
        recommendation = "Strong Match"
    elif score >= 60:
        recommendation = "Good Match"
    elif score >= 40:
        recommendation = "Average Match"
    else:
        recommendation = "Weak Match"

    # Skill Gap Analysis
    if len(missing_skills) > 0:
        suggestion = (
            "Candidate should improve: "
            + ", ".join(missing_skills)
        )
    else:
        suggestion = (
            "Candidate satisfies all required skills."
        )

    # Resume Preview
    resume_preview = resume_text[:500]

    return {
        "required_skills": required_skills,
        "matched_skills": matched_skills,
        "missing_skills": missing_skills,
        "match_score": score,
        "recommendation": recommendation,
        "suggestion": suggestion,
        "resume_preview": resume_preview
    }