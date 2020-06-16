class OptionsController < ApplicationController
  before_action :set_subtype
  before_action :set_option, only: [:show, :edit, :update, :destroy]

  # GET subtypes/1/options
  def index
    @options = @subtype.options
  end

  # GET subtypes/1/options/1
  def show
  end

  # GET subtypes/1/options/new
  def new
    @option = @subtype.options.build
  end

  # GET subtypes/1/options/1/edit
  def edit
  end

  # POST subtypes/1/options
  def create
    @option = @subtype.options.build(option_params)

    if @option.save
      redirect_to([@option.subtype, @option], notice: 'Option was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT subtypes/1/options/1
  def update
    if @option.update_attributes(option_params)
      redirect_to([@option.subtype, @option], notice: 'Option was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE subtypes/1/options/1
  def destroy
    @option.destroy

    redirect_to subtype_options_url(@subtype)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subtype
      @subtype = Subtype.find(params[:subtype_id])
    end

    def set_option
      @option = @subtype.options.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def option_params
      params.require(:option).permit(:name, :subtype_id)
    end
end
