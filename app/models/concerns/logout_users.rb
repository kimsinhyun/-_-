
module LogoutUsers
  def self.logout_users
    redis = Redis.new

    redis.keys.each do |key|
      if key.include?("proj1:session:")
        redis.del(key)
      end
    end
  end
end
