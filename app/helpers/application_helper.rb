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
      return "-" if list.size == 0
      list.join(", ")
   end

   def create_nav_bar_of_sign_in
      if user_signed_in?
          link_to "Sing out", destroy_user_session_path, method: :delete
      else
          link_to "Sign in", "/users/sign_in"
      end
   end

   def unless_view(model,model_name)
      return model unless model.nil?
      cls = eval(model_name)
      cls.new
   end
end
