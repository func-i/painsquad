class RecommendationService

  DIST = {
    'mild'     => [ 'pharmacological', 'psychological', 'physical' ],
    'moderate' => [ 'pharmacological', 'psychological', 'physical' ]
  }

  def initialize(user)
    @user          = user
    @pain_severity = @user.last_pain_report
    @favorites     = @user.favorites.pluck(:recommendation_id)
  end

  # fetch recommendation, gives 2X weighting to favorites
  # if recommendation already in array, get another
  def get_recommendations
    result = []
    DIST[@pain_severity].each do |element|
      unique = false
      while !unique
        recommendation = weighted_sample(Recommendation.send(element).suggestable)
        if result.include? recommendation
          recommendation = weighted_sample(Recommendation.send(element).suggestable)
        else
          result << recommendation
          unique = true
        end
      end
    end
    result
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
