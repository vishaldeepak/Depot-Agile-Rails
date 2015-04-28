class Product < ActiveRecord::Base
	validates :title, :description, :image_url, presence: true # Makes sure that the fields are not empty
	# The aboce could be written as 
	# validates(:title, :description, :image_url,:presence => true)
	validates :price, numericality: {greater_than_or_equal_to: 0.01} #Makes sure that the field is a no
																	 #And greater than 0.01
	validates :title, uniqueness: true; #Makes sure that this field is unique
	validates :image_url, allow_blank: true, format: { #Makes sure we have a valid image file url
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }#allow_blanck is given to avoid multiple error messages

end
