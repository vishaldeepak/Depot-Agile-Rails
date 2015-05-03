class Product < ActiveRecord::Base
	has_many :lint_items

	#This ensures that a product is not deleted if it has references by any line_item
	before_destroy :ensure_not_referenced_by_any_lint_item

	validates :title, :description, :image_url, presence: true # Makes sure that the fields are not empty
	# The aboce could be written as 
	# validates(:title, :description, :image_url,:presence => true)
	validates :price, numericality: {greater_than_or_equal_to: 0.01} #Makes sure that the field is a no
	
	validates :title, length: {minimum: 10, message: "Must give atleast 10 characters, Dear Sir!!"} 
																	 #And greater than 0.01
	validates :title, uniqueness: true; #Makes sure that this field is unique
	validates :image_url, allow_blank: true, format: { #Makes sure we have a valid image file url
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }#allow_blanck is given to avoid multiple error messages


  def self.latest
  	Product.order(:updated_at).last
  end

  private

  #This ensures that a product is not deleted if it has references by any line_item
  def ensure_not_referenced_by_any_lint_item
  	if lint_items.empty?
  		return true
  	else
  		errors.add(:base,'Line items Present')
  		return false
  	end
  end
end
