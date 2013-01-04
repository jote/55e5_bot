class PornograffittiFan
  URL = 'http://www.pornograffitti.jp/info/'

  def initialize()
    @agent = Mechanize.new
    @page = @agent.get('http://www.pornograffitti.jp/info/')
  end

  def self.get_news(collection)
    client = self.new
    client.find_new_reports(collection)
  end

  def find_new_reports(collection)
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
