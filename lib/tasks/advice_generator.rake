namespace :advice do

  # Official Surveys
  desc "Creates 'Full Assessment' Survey"
  task :all => [:environment] do
    Recommendation.destroy_all
    Favorite.destroy_all
    Builder::RecommendationBuilder.generate
  end

end
