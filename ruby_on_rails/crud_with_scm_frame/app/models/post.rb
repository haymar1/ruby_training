class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 255 }

  def self.to_csv
    attributes = %w{title description public_flag user_id}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |post|
        csv << post.attributes.values_at(*attributes)
      end
    end
  end

  def self.import(file)
    csv = CSV.foreach(file.path, headers: true)
    csv.each do |row|
      Post.create!(row.to_hash)
    end
  end
end
