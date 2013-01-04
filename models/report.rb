class Report
  def initialize(report)
    @id = report.attributes["href"].value.gsub('?id=', '').to_i
    @content = report.children[2].text
    date_tag = report.children[0].children.text.split('-')
    @date = date_tag[0]
    @tag = date_tag[1]
  end
  attr_reader :id, :content, :date, :tag
end
