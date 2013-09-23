class PornograffittiSite

  def initialize()
    @agent = Mechanize.new
    @url = File.join(PORNOGRAFFITTI_URL, 'info')
    @page = @agent.get(@url)
    @collection_name = 'porno_collection'
    @name = 'Pornograffitti'
  end
  attr_reader :name, :url, :collection_name

  def get_news(collection)
    reports = @page.search(".//div[@id='info_l']")
    new_reports = []
    reports.search(".//a").each do |report|
      report_obj = Report.new(report)
      record_count = collection.find('_id' => report_obj.id).count
      next if record_count > 0
      new_reports << report_obj
    end
    new_reports
  end
end
