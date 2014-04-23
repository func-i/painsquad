[User, Survey, Question, Choice, Submission, Answer].each &:destroy_all

# Seeds
user = User.create username: "test user", email: "test@email.com", password: "password"

# Setup Basic Survey
survey = Survey.create title: "Full Assessment"

q1 = survey.questions.create choice_type: "boolean", title: "Are you in pain right now?"
q1.choices.create value: "Yes"
q1.choices.create value: "No"


q2 = survey.questions.create choice_type: "radio", title: "When you had pain in the last 12 hours, how long did it usually last?"
q2.choices.create value: "Just a few minutes"
q2.choices.create value: "About an hour"
q2.choices.create value: "1-3 hours"
q2.choices.create value: "4-6 hours"
q2.choices.create value: "7-9 hours"
q2.choices.create value: "10-12 hours"


q3 = survey.questions.create choice_type: "checklist", title: "What do you think your pain was due to?"
q3.choices.create value: "None"
q3.choices.create value: "Your treatments"
q3.choices.create value: "Medical Conditions"
q3.choices.create value: "Medical Procedures"
q3.choices.create value: "Everyday Pain"
q3.choices.create value: "Other", textfield: true


# Setup Basic Submission
submission = Submission.create survey: survey

survey.questions.each do |question|
  submission.answers.create choice: question.choices.sample
end
