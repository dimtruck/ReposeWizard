require './Steps.rb'

class Step
  attr_accessor :step

  def initialize(step)
    @step = step
  end

  def render
    step = case @step
           when '1' then StepOne.new
           when '2' then StepTwo.new
           when '3' then StepThree.new
           when '4' then StepFour.new
           when '5' then StepFive.new
           else StepError.new
           end
    step.render
  end
end
