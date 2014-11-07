module Builder::Questions::Checklist
  PAIN_CAUSE = [
    'Chemo, Surgey, etc', 'Your Cancer', 'Other Medical Conditions', 'Medical Procedures', 'Everyday Pain'
  ]

  DESCRIBE_PAIN = [
    'Beating', 'Burning', 'Cramping', 'Cruel', 'Cutting', 'Drilling', 'Fearful',
    'Horrible', 'Hurting', 'Itching', 'Needles', 'Miserable', 'Pinching',
    'Pounding', 'Prickling', 'Pulling', 'Shooting', 'Sickening', 'Squeezing',
    'Stinging', 'Throbbing', 'Tingling', 'Tiring', 'Unbearable', 'Uncomfortable'
  ]

  OTHER_SYMPTOMS = [
    "Changes in skin", "Constipation", "Diarrhea", "Difficulty swallowing", 
    "Drowsiness", "Itching", "Lack of appetite", "Mouth sores", 
    "Nausea", "Numbness", "Tingling", "Vomiting"
  ] 

  MEDICATION = [
   'Acetaminophen (Tylenol)', 'Ibuprofen (Advil)', 'Naproxen', 'Codeine',
   'Morphine (short-acting)', 'Morphine (long-acting)', 'Gabapentin', 'Amitriptyline'
  ]

  OTHER_STRATEGIES = [
    'Deep breathing', 'Relaxation exercises', 'Heat', 'Cold', 'Massage/rubbing',
    'Imagery', 'Distraction', 'Talking with friends & family',
    'Rest/sleep', 'Prayer/meditation'
  ]

  class << self

    def pain_cause survey
      question = survey.questions.create!(
        question_type: 'checklist',
        content:       'What do you think your pain was <strong>due to</strong>?',
        tip:           'You can click multiple answers',
        tag:           'pain_cause',
        name:          'pain cause'
        )      
      PAIN_CAUSE.each { |content| question.choices.create! content: content }
      question.choices.create! content: 'Other (please list)', textfield: true
    end

    def describe_pain_grid survey
      question = survey.questions.create!(
        question_type: 'checklist-grid',
        content:       'Touch the words that best <strong>describe</strong> how your pain felt since your last case',
        tip:           'You can click multiple answers',
        name:          'describe pain'
      )
      DESCRIBE_PAIN.each { |content| question.choices.create! content: content }
      question.choices.create! content: 'Other', textfield: true
    end

    def other_symptoms_grid survey
      question = survey.questions.create!(
        question_type: 'checklist-grid',
        content:       'What other <strong>symptoms</strong> have you experienced in the last 12 hours?',
        name:          'other symptoms'
      )
      
      question.choices.create! content: 'None', can_disable: true
      OTHER_SYMPTOMS.each { |content| question.choices.create! content: content }
      question.choices.create! content: 'Other', textfield: true
    end

    def medication_efficacy_slider survey
      question = survey.questions.create!(
        question_type: 'checklist-extra',
        content:       'What <strong>medications</strong> have you taken to reduce your pain since your last case?',
        tip:           'Touch the medication and then rate how helpful it was in reducing pain',
        tag:           'medications',
        name:          'medication efficacy'
      )
      question.choices.create! content: 'None', can_disable: true
      MEDICATION.each { |content| question.choices.create! content: content }
      question.choices.create! content: 'Other', textfield: true
    end

    def other_strategies survey
      question = survey.questions.create!(
        question_type: 'checklist-extra',
        content:       'What <strong>other strategies</strong> did you use to reduce pain since your last case?',
        tip:           'Touch the strategy and then rate how helpful it was in reducing pain',
        name:          'other strategies'
      )
      question.choices.create! content: 'None', can_disable: true
      OTHER_STRATEGIES.each { |content| question.choices.create! content: content }
      question.choices.create! content: 'Other', textfield: true
    end

  end

end
