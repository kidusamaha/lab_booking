require_relative 'errors'

class Booking
  attr_reader :user, :resource, :status, :created_at

  def initialize(user:, resource:)
    @user = user
    @resource = resource
    @created_at = Time.now
    
    if resource.available?
      @status = "active"
      resource.assign_booking(self)
    else
      # What should happen here?
      raise BookingError, "Resource is already booked"
    end
  end

  def cancel
    @status = "cancelled"
    resource.clear_booking
  end
end