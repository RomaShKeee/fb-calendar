class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def self.find_or_build_by hash
    result = all.where(hash)
    result.present? ? result.first : none.create(hash)
  end
end
