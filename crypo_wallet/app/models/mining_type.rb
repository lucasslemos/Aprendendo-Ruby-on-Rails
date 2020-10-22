class MiningType < ApplicationRecord
    has_many :coins

    def to_s
        description
    end
end
 