# == Schema Information
#
# Table name: recommendation_favorites
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  recommendation_id :integer
#  created_at        :datetime
#  updated_at        :datetime
#

require 'spec_helper'

describe RecommendationFavorites do
  pending "add some examples to (or delete) #{__FILE__}"
end
