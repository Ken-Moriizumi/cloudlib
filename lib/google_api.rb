module GoogleApi
require 'httpclient'
   def get_book_by_isbn(isbn)
      client = HTTPClient.new
      query = {'q' => "sibn:#{isbn}", 'hl' => 'ja'}
      res = client.get('https://www.googleapis.com/books/v1/volumes?', 
                        :query => query, 
                        :follow_redirect => true)
      items = JSON.parse(res.body)
      return nil if items["totalItems"] == 0
      items["items"].each do |item|
         return item if item["volumeInfo"]["industryIdentifiers"].include?({ "type" => "ISBN_13", "identifier" => "#{isbn}" })
      end
      nil
   end
end
