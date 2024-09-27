class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update, :destroy, :settings ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

    # GET /profile
  def profile
    @user = current_user # using authentication system
    render :show
  end
  
  # GET /settings
  def settings
    @user = current_user
    # Render the settings page that will offer options to view or edit the profile
    render :settings
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id]) # This allows viewing any user's profile
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/:id/edit
  def edit
    @user = User.find(params[:id])
    
    # Only allow the logged-in user to edit their own profile
    unless @user == current_user
      redirect_to user_path(@user), alert: "You can only edit your own profile."
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :username, :password, :password_confirmation, :birthday)
    end
end
