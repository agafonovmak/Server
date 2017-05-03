class Loyalty
  include Mongoid::Document
  include Mongoid::Timestamps

  field :score, type: Integer, default: 0

  def level
    if self.franchise.fifth_level_min_score <= self.score
      5
    else
      if self.franchise.fourth_level_min_score <= self.score
        4
      else
        if self.franchise.third_level_min_score <= self.score
          3
        else
          if self.franchise.second_level_min_score <= self.score
            2
          else
            if self.franchise.first_level_min_score <= self.score
              1
            else
              0
            end
          end
        end
      end
    end
  end

  belongs_to :franchise
  belongs_to :user
end
