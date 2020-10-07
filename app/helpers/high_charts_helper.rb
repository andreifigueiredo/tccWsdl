module HighChartsHelper
  def self.newChart(exceptions, title)
    Daru::View.plotting_library = :highcharts
    @data = []
    
    exceptions.each do |exception|
      @data.push([exception[:date], exception[:value] ])
    end
    
    opts = {
      title: {
        text: "#{title}"
      }
    }
    dataframe = Daru::DataFrame.new({
      date: @data.map {|row| row[0]},
      value: @data.map {|row| row[1]}
    })

    Daru::View::Plot.new(dataframe, opts, chart_class: 'stock')
  end
end