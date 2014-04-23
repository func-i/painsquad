# Seeds
user = User.create!(username: "test user", email: "test@email.com", password: "password")

QUESTIONS = {
  boolean: {
    question: "Are you in pain?",
    answers: ["yes", "no"]
  },

  slider: {
    question: "How much pain are you in?",
    answer: 0
  },

  checklist: {
    question: "What do you think your pain was due to?",
    answer: [ "Medical Condition", "Medical Procedure", "Other (please list)" ]
  },

  # bodymap: {
  #   question: "Where did it hurt since your last report?",
  #   answer: {
  #     head: "",
  #     torso: "",
  #     arms: "",
  #     legs: ""
  #   }
  # }

  # slider:           "How much pain are you in?",
  # checklist:        "What do you think your pain was due to?",
  # body_map:         "",
  # radio:            "",
  # checklist_slider: "",
  # textfield:        "Tell us anything else about your pain since your last report"
}

# boolean = Choice.create!()

# QuestionType

survey = Survey.create!(title: "Full Assessment")
