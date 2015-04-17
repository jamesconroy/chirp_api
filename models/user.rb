class User < ActiveRecord::Base
  has_many(:chirps)

  def to_s
    self.name
  end

end
