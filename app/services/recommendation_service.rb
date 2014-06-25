class RecommendationService

  DIST = {
    'mild'     => [ 'psychological', 'physical', 'pharmacological' ],
    'moderate' => [ 'pharmacological', 'pharmacological', 'psychological', 'physical' ]
  }

  def initialize(user)
    @user          = user
    @pain_severity = @user.last_pain_report
    @favorites     = @user.favorites.pluck(:recommendation_id)
  end

  def get_recommendations
    DIST[@pain_severity].inject([]) do |result, element|
      result << weighted_sample(Recommendation.send(element))
    end
  end

  protected

  def weighted_sample(items)
    duplicate_array = []
    items.each do |item|
      if @favorites.include? item.id
        2.times { duplicate_array << item }
      else
        duplicate_array << item
      end
    end
    duplicate_array.sample
  end

end
