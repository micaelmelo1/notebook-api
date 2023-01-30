# frozen_string_literal: true

# class Address
class Address < ApplicationRecord
  belongs_to :contact
end
