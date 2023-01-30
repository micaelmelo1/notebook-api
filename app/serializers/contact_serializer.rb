# frozen_string_literal: true

# class ContactSerializer
class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate, :kind, :address, :phones
end
