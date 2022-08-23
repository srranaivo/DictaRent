class LandPeriodesController < ApplicationController
  def index
    @land_periodes = LandPeriode.all
  end

  def show
  end

  def new
    @land_periodes = LandPeriode.new
  end

  def create
    @land_periodes = LandPeriode.new(land_periodes_params)
    @land_periodes.user = current_user
    if @land_periodes.save
      redirect_to land_periodes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

private

def land_periodes_params
  params.require(:land_periodes).permit(:starts_the, :ends_the)
end

#########
# t.datetime "starts_the"
# t.datetime "ends_the"
# t.bigint "land_id"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["land_id"], name: "index_land_periodes_on_land_id"


########





end
