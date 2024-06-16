class ContactFormsController < ApplicationController
  before_action :retrieve_building, only: [:create]

  def create
    @contact_form = ContactForm.new(form_params)

    if @contact_form.save
      flash.now[:notice] = "Success!"
    else
      flash.now[:alert] = @contact_form.errors.full_messages.to_sentence
    end
    redirect_to building_path(@building)
  end

  private

  def retrieve_building
    @building = Building.find(params[:contact_form][:building_id])
  end

  def form_params
    params.require(:contact_form).permit(:name, :phone, :email, :content, :apartment_id)
  end
end
