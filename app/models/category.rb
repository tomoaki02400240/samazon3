class Category < ApplicationRecord
  has_many :products
  scope :major_categories, -> {
    pluck(:major_category_name).uniq
  }
#  scope :request_category, -> (category) {
 #   if category != "none"
  #    find(category)
   # else
    #  ""
    #end
  #}

  scope :request_category, -> (category){
    find(category)
  }
end
