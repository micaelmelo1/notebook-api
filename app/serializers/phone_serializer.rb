# frozen_string_literal: true

# class PhoneSerializer
class PhoneSerializer < ActiveModel::Serializer
  attributes :id, :number
end
