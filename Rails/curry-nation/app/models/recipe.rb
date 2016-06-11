class Recipe < ActiveRecord::Base
  DIFFICULTY=%w(Easy Medium Hard)
  belongs_to :food_type
  belongs_to :food_preference
  belongs_to :cuisine

  def self.search(params)
    search_by_type(params[:search_by_type]).search_by_title(params[:search_string])
  end

  private
    def self.search_by_title search
      unless search.blank?
        where('title LIKE ?', "%#{search}%")
      else
        all
      end
    end

    def self.search_by_type type
      unless type.nil?
        search_key = {}
        search_key[type[:type]] = type[:id]
        where(search_key)
      else
        all
      end
    end

end
