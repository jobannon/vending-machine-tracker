class Machine < ApplicationRecord
  validates_presence_of :location

  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  belongs_to :owner

  def average_snack_cost 
    self.snacks.average(:price)
  end

  def kind_of_snack_count
    snacks.select(:kind).count
  end
  
end
