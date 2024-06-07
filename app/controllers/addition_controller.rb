class AdditionController < ApplicationController
  def show_addition_form
    render({ :template => "addition_templates/add_form" })
  end

  def add_these
    @first_number = params.fetch("first_number").to_f
    @second_number = params.fetch("second_number").to_f

    @result = @first_number + @second_number


    render({ :template => "addition_template/add_results" })
  end
end
