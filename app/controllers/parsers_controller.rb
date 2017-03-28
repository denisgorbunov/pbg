class ParsersController < ApplicationController

  def initialize(notice)
    @notice = notice.to_s
    @id = ""
  end

  def goszakupki
    require 'nokogiri'
    require 'open-uri'
    if @notice.length == 19
      url = "http://www.zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=#{@notice}"
      page = Nokogiri::HTML(open(url,
                                 "User-Agent" => "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322)",
                                 "Referer" => "http://www.google.com/bot.html"))
      data = page.css('div.noticeTabBoxWrapper td').text

    else
      url = "http://zakupki.gov.ru/epz/order/quicksearch/search_eis.html?searchString=#{@notice}"
      doc = Nokogiri::HTML(open(url,
                                "User-Agent" => "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322)",
                                "Referer" => "http://www.google.com/bot.html"))
      links = doc.css('td.descriptTenderTd a').map { |link| link['href'] }
    end

  end
end
