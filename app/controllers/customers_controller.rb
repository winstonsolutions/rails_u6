class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def alphabetized
    @customers = Customer.order(:full_name)
  end

  def missing_email
    @customers = Customer.missing_email
  end
end