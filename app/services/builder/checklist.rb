module Builder::Checklist
  PAIN_CAUSE = [
    'Your treatments', 'Medical Conditions', 'Medical Procedures', 'Everyday Pain'
  ]

  DESCRIBE_PAIN = [
    'Beating', 'Burning', 'Cramping', 'Cruel', 'Cutting', 'Drilling', 'Fearful',
    'Horrible', 'Hurting', 'Itching', 'Like Needles', 'Miserable', 'Pinching',
    'Pounding', 'Prickling', 'Pulling', 'Shooting', 'Sickening', 'Squeezing',
    'Stinging', 'Throbbing', 'Tingling', 'Tiring', 'Unbearable', 'Uncomfortable'
  ]

  OTHER_SYMPTOMS = [
    'Nausea', 'Feeling drowsy', 'Numbness/Tingling', 'Vomiting', 'Itching',
    'Lack of appetite', 'Difficulty swallowing', 'Mouth sores', 'Constipation',
    'Changes in skin', 'Diarrhea'
  ]

  MEDICATION = [
   'Acetaminophen (Tylenol)', 'Ibuprofen (Advil)', 'Naproxen', 'Codeine',
   'Morphine (short-acting)', 'Morphine (long-acting)', 'Gabapentin', 'Amitriptyline'
  ]

  OTHER_STRATEGIES = [
    'Deep breathing', 'Relaxation exercises', 'Heat', 'Cold', 'Massage/rubbing',
    'Imagery', 'Distraction (TV, books, music)', 'Talking with friends & family',
    'Rest/sleep', 'Prayer/meditation'
  ]

  class << self

    def pain_cause survey
      question = survey.questions.create(
        question_type: 'checklist',
        content:       'What do you think your pain was <strong>due to</strong> in the last 12 hours?',
        tip:           'You can click multiple answers'
        )
      question.choices.create content: 'None', can_disable: true
      PAIN_CAUSE.each { |content| question.choices.create content: content }
      question.choices.create content: 'Other (please list)', textfield: true
    end

    def describe_pain_grid survey
      question = survey.questions.create(
        question_type: 'checklist-grid',
        content:       'Touch the words that best <strong>describe</strong> how your pain felt since your last report',
        tip:           'You can click multiple answers'
      )
      question.choices.create content: 'None', can_disable: true
      DESCRIBE_PAIN.each { |content| question.choices.create content: content }
      question.choices.create content: 'Other', textfield: true
    end

    def other_symptoms_grid survey
      question = survey.questions.create(
        question_type: 'checklist-grid',
        content:       'What other <strong>symptoms</strong> have you experienced in the last 12 hours?'
      )
      question.choices.create content: 'None', can_disable: true
      OTHER_SYMPTOMS.each { |content| question.choices.create content: content }
      question.choices.create content: 'Other', textfield: true
    end

    def medication_efficacy_slider survey
      question = survey.questions.create(
        question_type: 'checklist-extra',
        content:       'What <strong>medications</strong> have you taken to reduce your pain since your last report?',
        tip:           'Touch the medication and then rate how helpful it was in reducing pain'
      )
      question.choices.create content: 'None', can_disable: true
      MEDICATION.each { |content| question.choices.create content: content }
      question.choices.create content: 'Other', textfield: true
    end

    def other_strategies survey
      question = survey.questions.create(
        question_type: 'checklist',
        content:       'What <strong>other strategies</strong> did you use to reduce pain since your last case?'
      )
      question.choices.create content: 'None', can_disable: true
      OTHER_STRATEGIES.each { |content| question.choices.create content: content }
      question.choices.create content: 'Other', textfield: true
    end

  end

end
