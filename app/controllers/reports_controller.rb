require 'benchmark'

class ReportsController < ApplicationController
    before_action :authenticate_user!, except: [:home]
  def index
    @routers = Router.all.paginate(:page => params[:page], :per_page => 30)
  end

  def home
  end
  
  def csv_reports
    EM.defer do
      @routers = Router.all
      respond_to do |format|
        format.html
        puts "benchmarking",Benchmark.measure {
         format.csv { send_data @routers.to_csv}
       }
    end
      request.env['async.callback'].call response
  end
      throw :async
  end
end
