class Animal < ApplicationRecord
  #associations
  belongs_to :zoo

  #validations
  validates :name, presence: true

end
