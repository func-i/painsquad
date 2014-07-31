namespace :survey do

  desc "Creates 'Full Assessment' Survey"
  task :full => [:environment] do
    Builder::SurveyBuilder.new(identifier: 'full').build
  end

  desc "Creates 'Truncated Assessment' Survey"
  task :truncated => [:environment] do
    Builder::SurveyBuilder.new(identifier: 'truncated').build
  end

  desc "rake callback to clear existing survey"
  task :clear_all => :environment do
    [Survey, Question, Choice, Submission, Answer].each &:destroy_all
  end

  desc 'Test Survey'
  task :test => [:environment] do
    Rake::Task['survey:clear_all'].invoke
    Builder::SurveyBuilder.new(identifier: 'test').build
  end


  task :all => [:environment, :clear_all, :full, :truncated] do
  end

  task :mock_results => [:environment] do
    SubmissionSeedGenerator.build
  end

end
