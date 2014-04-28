[User, Survey, Question, Choice, Submission, Answer].each &:destroy_all

# Seeds
user = User.create username: "test user", email: "test@email.com", password: "password"

# Setup Basic Survey
survey = Survey.create title: "Full Assessment"

# BOOLEAN
q1 = survey.questions.create(
  question_type: "boolean",
  content: "Are you in pain right now?"
)
q1.choices.create content: "Yes"
q1.choices.create content: "No"


# SLIDER
q2 = survey.questions.create(
  question_type: 'slider',
  content: 'Rate your pain on a scale of 1 to 10',
  tip: "Touch the slider yo"
)
q2.choices.create value: 0


# RADIO
q3 = survey.questions.create(
  question_type: "radio",
  content: "When you had pain in the last 12 hours, how long did it usually last?",
  tip: "Tell us how much it hurts"
)
q3.choices.create content: "Just a few minutes"
q3.choices.create content: "About an hour"
q3.choices.create content: "1-3 hours"
q3.choices.create content: "4-6 hours"
q3.choices.create content: "7-9 hours"
q3.choices.create content: "10-12 hours"


# CHECKLIST
q4 = survey.questions.create(
  question_type: "checklist",
  content: "What do you think your pain was due to?",
)
q4.choices.create content: "None"
q4.choices.create content: "Your treatments"
q4.choices.create content: "Medical Conditions"
q4.choices.create content: "Medical Procedures"
q4.choices.create content: "Everyday Pain"
q4.choices.create content: "Other", textfield: true
