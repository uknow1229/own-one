class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  primary_class?
end
