class ConStaffsController < ApplicationController
  skip_before_action :admin, only: [:index]
  before_action :set_con_staff, only: [:show, :edit, :update, :destroy]

  # GET /con_staffs
  # GET /con_staffs.json
  def index
    @con_staffs = ConStaff.all
    @con_info = Array.new

    @con_staffs.length.times { |i|
      @con_info[i] = {
        id: @con_staffs[i][:id],
        name: @con_staffs[i][:name],
        title: @con_staffs[i][:title],
        phone: @con_staffs[i][:phone],
        email: @con_staffs[i][:email],
        event_id: @con_staffs[i][:event_id],
        event_code: Event.where(id: @con_staffs[i][:event_id])[0][:event_code]
      }
    }
  end

  # GET /con_staffs/1
  # GET /con_staffs/1.json
  def show
  end

  # GET /con_staffs/new
  def new
    @con_staff = ConStaff.new
  end

  # GET /con_staffs/1/edit
  def edit
  end

  # POST /con_staffs
  # POST /con_staffs.json
  def create
    @con_staff = ConStaff.new(con_staff_params)

    respond_to do |format|
      if @con_staff.save
        format.html { redirect_to con_staffs_path, notice: 'Con staff was successfully created.' }
        format.json { render :show, status: :created, location: @con_staff }
      else
        format.html { render :new }
        format.json { render json: @con_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /con_staffs/1
  # PATCH/PUT /con_staffs/1.json
  def update
    respond_to do |format|
      if @con_staff.update(con_staff_params)
        format.html { redirect_to con_staffs_path, notice: 'Con staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @con_staff }
      else
        format.html { render :edit }
        format.json { render json: @con_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /con_staffs/1
  # DELETE /con_staffs/1.json
  def destroy
    ConStaff.find(params[:id]).destroy
    flash[:notice] = "Con staff has been deleted."
    redirect_to con_staffs_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_con_staff
      @con_staff = ConStaff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def con_staff_params
      params.require(:con_staff).permit(:name, :title, :phone, :email, :event_id)
    end
end