module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def guest_user
      guest = Guestuser.new
      guest.id = guest.object_id
      guest.name = "Guest USer"
      guest.first_name = "Guest"
      guest.last_name = "User"
      guest.email = "guest@user.com"
      guest
    end

    def connect
      self.current_user = find_verified_user || guest_user
      logger.add_tags 'ActionCable1', current_user.email
      logger.add_tags 'ActionCable2', current_user.id
    end

    protected

    def find_verified_user
      if verified_user = env['warden'].user
        verified_user
      end
    end
  end
end
