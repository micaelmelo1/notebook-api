# frozen_string_literal: true

namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    puts 'Resetando o Banco de dados'
    `rails db:drop db:create db:migrate`

    puts 'Cadastrando os tipos de contato...'

    kinds = %w[Amigo Comecial Trabalho Casa]

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts 'Tipos de contato cadastrados com sucesso!!'

    puts 'Cadastrando os contatos...'

    50.times do |_i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday,
        kind: Kind.all.sample
      )
    end

    puts 'Contatos cadastrados com sucesso!!'

    puts 'Cadastrando os telefones...'

    contacts = Contact.all

    contacts.each do |contact|
      Random.rand(5).times do |_i|
        phone = Phone.create!(number: Faker::PhoneNumber.phone_number)
        contact.phones << phone
        contact.save
      end
    end

    puts 'Telefones cadastrados com sucesso!!'

    puts 'Cadastrando os endereços...'

    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end

    puts 'Endereços cadastrados com sucesso!!'
  end
end
