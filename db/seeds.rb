[User, Survey, Question, Choice, Submission, Answer].each &:destroy_all

####### Seeds
user = User.create username: 'test user', email: 'test@email.com', password: 'password'

####### Setup Basic Survey
survey = Survey.create title: 'Full Assessment'

# ####### BOOLEAN
# q1 = survey.questions.create(
#   question_type: 'boolean',
#   content: 'Are you in pain right now?'
# )
# q1.choices.create content: 'Yes', value: 'true'
# q1.choices.create content: 'No', value: 'false'


####### SLIDER
q2 = survey.questions.create(
  question_type: 'slider',
  content:       'How much pain do you have right now?',
  tip:           'Touch the mark and slide it to describe your pain. Then click Next.'
)
q2.choices.create
# q2.choices.create value: "1"



# ####### RADIO
# q3 = survey.questions.create(
#   question_type: 'radio',
#   content:       'When you had pain in the last 12 hours, how long did it usually last?',
#   tip:           'Tell us how much it hurts'
# )
# q3.choices.create content: 'Just a few minutes'
# q3.choices.create content: 'About an hour'
# q3.choices.create content: '1-3 hours'
# q3.choices.create content: '4-6 hours'
# q3.choices.create content: '7-9 hours'
# q3.choices.create content: '10-12 hours'


# ####### CHECKLIST
# q4 = survey.questions.create(
#   question_type: 'checklist',
#   content:       'What do you think your pain was due to?',
# )
# q4.choices.create content: 'None', can_disable: true
# q4.choices.create content: 'Your treatments'
# q4.choices.create content: 'Medical Conditions'
# q4.choices.create content: 'Medical Procedures'
# q4.choices.create content: 'Everyday Pain'
# q4.choices.create content: 'Other (please list)', textfield: true


# ####### CHECKLIST GRID
# q5 = survey.questions.create(
#   question_type: 'checklist-grid',
#   content: 'Touch the words that best describe how your pain felt since your last report'
# )

# %w(
#   Beating Burning Cramping Cruel Drilling Fearful Horrible
#   Hurting Itching Miserable Pouding Pulling Shooting Squeezing
#   Throbbing Unbearable Uncomfortable Whining
# ).each { |content| q5.choices.create content: content }

# q5.choices.create content: 'Other', textfield: true


####### CHECKLIST EXTRA
q6 = survey.questions.create(
  question_type: 'checklist-extra',
  content: 'What medications have you taken to reduce your pain since your last report?'
)
q6.choices.create content: 'None', can_disable: true
q6.choices.create content: 'Acetaminophen (Tylenol)'
q6.choices.create content: 'Ibuprofen (Advil)'
q6.choices.create content: 'Naproxen'
q6.choices.create content: 'Codeine'
q6.choices.create content: 'Morphine (short-acting)'
q6.choices.create content: 'Morphine (long-acting)'
q6.choices.create content: 'Gabapentin'
q6.choices.create content: 'Amitriptyline'
q6.choices.create content: 'Other', textfield: true


# ####### BODY MAP
# q7 = survey.questions.create(
#   question_type: 'bodymap',
#   content: 'Where did it hurt since your last report?'
# )
# q7.choices.create content: 'Head'
# q7.choices.create content: 'Torso'
# q7.choices.create content: 'Arms'
# q7.choices.create content: 'Legs'


# ####### TEXTBOX
# last_question = survey.questions.create(
#   question_type: 'textbox',
#   content:       'Tell us anything else about your pain in the last 12 hours'
# )
# last_question.choices.create textfield: true
