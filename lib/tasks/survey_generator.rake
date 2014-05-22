QUESTIONS = %i(boolean slider radio checklist checklist_grid checklist_extra bodymap textbox)

namespace :survey do
  # Official Surveys
  desc "Creates 'Full Assessment' Survey"
  task :full => [:clear_all, :environment] do
    # survey = Survey.create title: 'Full Assessment'
    puts 'TODO'
  end

  desc "Creates 'Truncated Assessment' Survey"
  task :truncated => [:clear_all, :environment] do
    # survey = Survey.create title: 'Truncated Assessment'
    puts "TODO"
  end

  desc "rake callback to clear existing survey"
  task :clear_all => :environment do
    [Survey, Question, Choice, Submission, Answer].each &:destroy_all
  end

  # Test Surveys
  desc "Creates survey with all questions"
  task :all => [:clear_all, :environment] do
    survey = Survey.create title: 'all'
    QUESTIONS.each { |q| send(q, survey) }
  end

  # individual question generators
  QUESTIONS.each do |question|
    desc "Creates Survey only containing: #{question}"
    task question => [:clear_all, :environment] do
      survey = Survey.create title: question.to_s
      send(question, survey)
    end
  end
end

def boolean survey
  question = survey.questions.create(
    question_type: 'boolean',
    content: 'Are you in pain right now?'
  )
  question.choices.create content: 'Yes', value: 'true'
  question.choices.create content: 'No', value: 'false'
end

def slider survey
  question = survey.questions.create(
    question_type: 'slider',
    content:       'How much pain do you have right now?',
    tip:           'Touch the mark and slide it to describe your pain. Then click Next.'
  )
  question.choices.create
end

def radio survey
  question = survey.questions.create(
    question_type: 'radio',
    content:       'When you had pain in the last 12 hours, how long did it usually last?',
    tip:           'Tell us how much it hurts'
  )
  question.choices.create content: 'Just a few minutes'
  question.choices.create content: 'About an hour'
  question.choices.create content: '1-3 hours'
  question.choices.create content: '4-6 hours'
  question.choices.create content: '7-9 hours'
  question.choices.create content: '10-12 hours'
end

def checklist survey
  question = survey.questions.create(
    question_type: 'checklist',
    content:       'What do you think your pain was due to?',
  )
  question.choices.create content: 'None', can_disable: true
  question.choices.create content: 'Your treatments'
  question.choices.create content: 'Medical Conditions'
  question.choices.create content: 'Medical Procedures'
  question.choices.create content: 'Everyday Pain'
  question.choices.create content: 'Other (please list)', textfield: true
end

def checklist_grid survey
  question = survey.questions.create(
    question_type: 'checklist-grid',
    content: 'Touch the words that best describe how your pain felt since your last report'
  )

  %w(
    Beating Burning Cramping Cruel Drilling Fearful Horrible
    Hurting Itching Miserable Pouding Pulling Shooting Squeezing
    Throbbing Unbearable Uncomfortable Whining
  ).each { |content| question.choices.create content: content }

  question.choices.create content: 'Other', textfield: true
end

def checklist_extra survey
  question = survey.questions.create(
    question_type: 'checklist-extra',
    content: 'What medications have you taken to reduce your pain since your last report?'
  )
  question.choices.create content: 'None', can_disable: true
  question.choices.create content: 'Acetaminophen (Tylenol)'
  question.choices.create content: 'Ibuprofen (Advil)'
  question.choices.create content: 'Naproxen'
  question.choices.create content: 'Codeine'
  question.choices.create content: 'Morphine (short-acting)'
  question.choices.create content: 'Morphine (long-acting)'
  question.choices.create content: 'Gabapentin'
  question.choices.create content: 'Amitriptyline'
  question.choices.create content: 'Other', textfield: true
end

def bodymap survey
  question = survey.questions.create(
    question_type: 'bodymap',
    content: 'Where did it hurt since your last report?'
  )
  question.choices.create content: 'Head'
  question.choices.create content: 'Torso'
  question.choices.create content: 'Arms'
  question.choices.create content: 'Legs'
end

def textbox survey
  question = survey.questions.create(
    question_type: 'textbox',
    content:       'Tell us anything else about your pain in the last 12 hours'
  )
  question.choices.create textfield: true
end
