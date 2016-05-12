class Dose < ActiveRecord::Base
  validates :description, presence: true
  validates_presence_of :cocktail
  validates_presence_of :ingredient
  validates_uniqueness_of :cocktail_id, :scope => [:ingredient_id]
  belongs_to :cocktail
  belongs_to :ingredient
end
