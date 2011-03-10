class AppointmentsController < SecurityEnabledApplicationController
  def index
    @users = User.where("role_id not in (:roles)", :roles => [1,2])
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
