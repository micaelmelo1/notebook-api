# frozen_string_literal: true

# class AddressSerializer
class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :city
end
