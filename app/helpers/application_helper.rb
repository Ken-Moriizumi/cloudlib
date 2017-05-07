module ApplicationHelper
   def create_img_tag(asin)
      begin
         return image_tag("http://images-jp.amazon.com/images/P/#{asin}.09.TZZZZZZZ.jpg")
      rescue
         return "no images"
      end
   end
   
   def create_employees_list_who_rentaled(book)
      list = book.rental_histories.select {|h| h.return_date.nil? }.map do |h|
          h.employee.name 
      end
      list.join(", ")
   end
end
