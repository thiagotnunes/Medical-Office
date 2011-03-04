class AppointmentsController < SecurityEnabledApplicationController
  def index
    user_ids = User.where("role_id not in (:roles)", :roles => [1,2]).map { |u| u.id }
    puts user_ids
    @user_calendars = UserCalendar.where("user_id in (:users)", :users => user_ids)
  end

  def show
  end

  def create
  end

  def new
  end

  def destroy
  end
end
