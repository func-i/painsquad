# Seeds
user = User.create!(username: "test user", email: "test@email.com", password: "password")

QUESTION_TYPES = %w{ boolean body_map slider radio checklist text_field }

# QUESTooI

QUESTION_WITH_TYPES = {
  boolean: "Did you have PAIN in the last 12 hours?",
  slider: "Did you have PAIN in the last 12 hours?",
  checklist: "Did you have pain since your last case?",

  body_map: "How much pain do you have right now?",

  "What was your pain when it was at its worst since your last case?",
  "What do you think your pain was due to?",
  "Where did it hurt since your last case?",

}

CONTENT = [
  "Did you have PAIN in the last 12 hours?",
  "Did you have pain since your last case?",
  "How much pain do you have right now?",
  "What was your pain when it was at its worst since your last case?",
  "What do you think your pain was due to?",
  "Where did it hurt since your last case?",
  "",
  "",
  "",
  ""
]

survey = Survey.create!(title: "Full Assessment")

22.times do |n|
  survey.questions.create!(choice_type: QUESTION_TYPES.sample, content: )
end