module ApplicationCable
  class Connection < ActionCable::Connection::Base #Two default modes, connect and disconnect
    identified_by :current_user #At each connection which user is connected to the app

    def connect
      self.current_user = find_verified_user # define current_user property once user sucessfully connected
    end

    def disconnect

    end

    protected

  def find_verified_user
    if verified_user = request.env['warden'].user #contains information about the current_user
      verified_user
    else
      reject_unauthorized_connection
    end
  end # /End of def find_verified_user

  end # /End of class Connection
end # /End of module ApplicationCable
