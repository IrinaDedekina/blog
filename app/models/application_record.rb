class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def created_at
    attributes['created_at'].strftime("%d-%m-%Y %H:%M")
  end
end
