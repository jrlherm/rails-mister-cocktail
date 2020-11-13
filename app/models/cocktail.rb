class Cocktail < ApplicationRecord
  has_many :doses, :dependent => :destroy
  has_many :ingredients, through: :doses
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true
end


 def set_song
    @song = Song.find(params[:song_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
