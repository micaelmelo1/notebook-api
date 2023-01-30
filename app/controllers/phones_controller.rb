# frozen_string_literal: true

# class PhonesController
class PhonesController < ApplicationController
  before_action :set_contact

  # DELETE /contacts/1/phones
  def destroy
    phone = Phone.find(phone_params[:id])
    phone.destroy
  end

  # POST /contacts/1/phone/1
  def create
    @contact.phones << Phones.new(phone_params)

    if @contact.save
      render json: @contact.phones, status: :created, location: contact_phone_path(@contact)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH /contacts/1/phones
  def update
    phone = Phone.find(phone_params[:id])

    if phone.update(phone_params)
      render json: @contact.phones
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # GET /contacts/1/phones/1
  def show
    render json: @contact.phones
  end

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end

  def phone_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
