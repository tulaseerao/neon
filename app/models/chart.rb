class Chart
  
  def self.graph
    LazyHighCharts::HighChart.new('graph') do |f|
    f.title({ text: "Combination chart"})
    f.options[:xAxis][:categories] = ['Apple', 'Windows', 'Andriod', 'Chrome', 'Others']
    f.labels(items: [html: "Total fruit consumption", style: {left: "40px", top: "8px", color: "black"} ])      
    f.series(type: 'column',name: 'Dave Geesey',data: [3, 2, 1, 3, 4])
    f.series(type: 'column',name: 'Kimberly Perry',data: [2, 3, 5, 7, 6])
    f.series(type: 'column', name: 'Harrell',data: [4, 3, 3, 9, 0])
    f.series(type: 'spline',name: 'Average', data: [3, 2.67, 3, 6.33, 3.33])
    f.series(type: 'pie',name: 'Total consumption', 
      data: [
        {name:  'Dave Geesey', y:  13, color:  'red'}, 
        {name:  'Harrell', y:  23, color:  'green'},
        {name:  'Kimberly Perry', y:  19,color:  'blue'}
      ],
      center:  [100, 80], size:  100, showInLegend:  false)
    end
  end
  
  def self.graph2
    timeline = Timeline.all.map { |tl|
      [tl.date_of_service,tl.qty]
    }
    LazyHighCharts::HighChart.new('graph') do |f|
    f.title({ text: "Computer Timelines"})
    f.options[:xAxis][:categories] = Timeline.all.map {|tl| tl.date_of_service }
    f.options[:yAxis][:categories] = Timeline.all.map {|tl| tl.qty }
    f.labels(items: [html: "Computer Timelines", style: {left: "40px", top: "8px", color: "black"} ])      
    # f.series(type: 'column',name: 'Dave Geesey',data: [3, 2, 1, 3, 4])
    # f.series(type: 'column',name: 'Kimberly Perry',data: [2, 3, 5, 7, 6])
    # f.series(type: 'column', name: 'Harrell',data: [4, 3, 3, 9, 0])
    series = {
               type:  'column',
               name:  'Computer Timelines',
               data:  timeline
      }
      f.series(series)
    end
  end
  def self.pie
    
    timeline = Timeline.all.map { |tl|
      [tl.device,tl.qty]
    }
    
    LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({defaultSeriesType: "pie" , margin:  [50, 200, 60, 170]} )
      series = {
               type:  'pie',
               name:  'Computer Timelines',
               data:  timeline
      }
      f.series(series)
      f.options[:title][:text] = "Computer Timelines"
      f.legend(layout:  'vertical',style:  {left:  'auto', bottom:  'auto',right:  '50px',top:  '100px'}) 
      f.plot_options(pie: {
        allowPointSelect: true, 
        cursor: "pointer" , 
        dataLabels: {
          enabled: true,
          color: "black",
          style: {
            font: "13px Trebuchet MS, Verdana, sans-serif"
          }
        }
      })
  end
  end
  
  def self.bar
    LazyHighCharts::HighChart.new('column') do |f|
    f.series(name: 'John',data:  [3, 20, 3, 5, 4, 10, 12 ])
    f.series(name: 'Jane',data: [1, 3, 4, 3, 3, 5, 4,-46] )   
    f.title({ text: "Total Devices"})

    ###  Options for Bar
    ### f.options[:chart][:defaultSeriesType] = "bar"
    ### f.plot_options({series: {stacking: "normal"}}) 

    ## or options for column
    f.options[:chart][:defaultSeriesType] = "column"
    f.plot_options({column: {stacking: "percent"}})
  end
  end
  
end