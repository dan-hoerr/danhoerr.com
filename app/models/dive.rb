class Dive < ActiveRecord::Base
  attr_accessible :date,
                  :location,
                  :weather,
                  :equipment,
                  :dive_buddy,
                  :gas,
                  :start_psi,
                  :end_psi,
                  :weight,
                  :max_depth,
                  :charter,
                  :notes

  validates_presence_of :date, :location, :max_depth

end