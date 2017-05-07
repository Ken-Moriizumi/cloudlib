module AmazonApi
require 'amazon/ecs'
require 'json'
require 'rexml/document'
require 'active_support/core_ext'

   Amazon::Ecs.options = {
         associate_tag:     'moricon-22',
         AWS_access_key_id: 'AKIAILFY72FKJ377LXZA',
         AWS_secret_key:  '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' 
   }
   def get_book_by_isbn(isbn)
      #Amazon::Ecs.debug = true
      
      retry_counter = 0
      begin 
          res = Amazon::Ecs.item_search(
            isbn,
            search_index:  'Books',
            response_group: 'Medium, Images',
            country:  'jp'
          )
      rescue
          retry_counter += 1
          retry if retry_counter <= 5
      end
      res.items.each do |item|
          return set_item(item,isbn)
      end
      nil
   end
private
   def set_item(item,isbn)
      {
          "volumeInfo" => {
                             "title"     => item.get('ItemAttributes/Title'),
                             "isbn"      => isbn,
                             "asin"     => item.get('ASIN'),
                             "authors"   => set_item_author(item),
                             "publisher" => item.get('ItemAttributes/Manufacturer'),
                             "imageLinks" => {
                                                "smallThumbnail" => item.get('SmallImage/URL')}
                          }
      }
   end

   def set_item_author(item_attributes)
      authors = Array.new
      cnt = 1
      loop do
        author =  item_attributes.get("ItemAttributes/Author[#{cnt}]")
        cnt += 1
        break if author.nil? 
        authors.push author
      end
       puts "authors=#{authors}"
       authors
   end
end




