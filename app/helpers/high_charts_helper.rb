module HighChartsHelper
  def self.newChart(exceptions, title)
    Daru::View.plotting_library = :highcharts
    @data = []
    
    exceptions.each do |exception|
      # binding.pry
      @data << [exception[:value], exception[:date]]
    end
    
    opts = {
      title: {
        text: "#{title}"
      }
    }

    dataframe = Daru::DataFrame.new({
      date: @data.map {|row| row[0]},
      "#{title}": @data.map {|row| row[1]}
    })

    Daru::View::Plot.new(dataframe, opts, chart_class: 'stock')
  end
end