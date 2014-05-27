QUESTIONS = %i(boolean slider radio checklist checklist_grid checklist_extra bodymap textbox)

namespace :survey do
  # Official Surveys
  desc "Creates 'Full Assessment' Survey"
  task :full => [:environment] do
    Survey.where(identifier: 'full').destroy_all
    SurveyBuilder.new(identifier: 'full').build
  end

  desc "Creates 'Truncated Assessment' Survey"
  task :truncated => [:environment] do
    Survey.where(identifier: 'truncated').destroy_all
    SurveyBuilder.new(identifier: 'truncated').build
  end

  desc "rake callback to clear existing survey"
  task :clear_all => :environment do
    [Survey, Question, Choice, Submission, Answer].each &:destroy_all
  end

  # # Test Surveys
  # desc "Creates survey with all questions"
  # task :all => [:clear_all, :environment] do
  #   survey = Survey.create title: 'all'
  #   QUESTIONS.each { |q| send(q, survey) }
  # end

  # # individual question generators
  # QUESTIONS.each do |question|
  #   desc "Creates Survey only containing: #{question}"
  #   task question => [:clear_all, :environment] do
  #     survey = Survey.create title: question.to_s
  #     send(question, survey)
  #   end
  # end

end
