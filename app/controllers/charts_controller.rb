class ChartsController < ApplicationController
   def graph
    @chart = Chart.graph
  end

  def pie
    @pie = Chart.pie
  end

  def bar
    @bar = Chart.bar
  end
end
