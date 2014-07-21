class AlertEachSerializer < ActiveModel::Serializer
  attributes :id, :time, :display_time, :category, :selected

  def selected
    scope.alerts.include? object
  end

end
