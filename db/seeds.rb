[User, Survey, Question, Choice, Submission, Answer].each &:destroy_all

# Seeds
user = User.create username: "test user", email: "test@email.com", password: "password"

# Setup Basic Survey
survey = Survey.create title: "Full Assessment"

q1 = survey.questions.create(
  question_type: "boolean",
  content: "Are you in pain right now?"
)
q1.choices.create content: "Yes"
q1.choices.create content: "No"


q2 = survey.questions.create(
  question_type: "radio",
  content: "When you had pain in the last 12 hours, how long did it usually last?",
  tip: "Tell us how much it hurts"
)
q2.choices.create content: "Just a few minutes"
q2.choices.create content: "About an hour"
q2.choices.create content: "1-3 hours"
q2.choices.create content: "4-6 hours"
q2.choices.create content: "7-9 hours"
q2.choices.create content: "10-12 hours"


q3 = survey.questions.create(
  question_type: "checklist",
  content: "What do you think your pain was due to?",
)
q3.choices.create content: "None"
q3.choices.create content: "Your treatments"
q3.choices.create content: "Medical Conditions"
q3.choices.create content: "Medical Procedures"
q3.choices.create content: "Everyday Pain"
q3.choices.create content: "Other", textfield: true


# Setup Basic Submission
# submission = Submission.create survey: survey

# survey.questions.each do |question|
#   submission.answers.create choice: question.choices.sample
# end
