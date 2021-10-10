class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :issued_badges, dependent: :destroy
  has_many :badges, through: :issued_badges
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :email, presence: { message: "must be given please" },
                    uniqueness: true,
                    format: { with: /\w+[@]{1}\w+[\.]{1}\w+/, message: "must contain an @ and a dot" }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def passed_tests_by_level (level)
    self.tests.where(level: level)
  end

  def admin?
    self.type == "Admin"
  end

  def hand_first_try_badge(test_passage)
    if merit_first_try_badge?(test_passage)
      badge = Badge.find(1)
      badges.push(badge)
    end
    return badge
  end

  def hand_level_badge(test_passage)
    if merit_level_badge?(test_passage)
      badge = Badge.find_by(criteria: test_passage.test.level.to_s)
      badges.push(badge)
    end
    return badge
  end

  def hand_category_badge(test_passage)
    if merit_category_badge?(test_passage)
      badge = Badge.find_by(criteria: Category.find(test_passage.test.category_id).title)
      badges.push(badge)
    end
    return badge
  end

  private

  def merit_first_try_badge?(test_passage)
    test_passages.where(test_id: test_passage.test.id).count == 1 && test_passage.success?
  end

  def merit_level_badge?(test_passage)
    level = test_passage.test.level
    tests_by_level = Test.all.where(level: level).pluck(:title)
    passed_tests = []

    test_passages.each do |test|
      if test.success? && test.test.level == level
        passed_tests << test.test.title
      end
    end

    result = tests_by_level - passed_tests
    result.empty? && badges.where(criteria: level.to_s).empty?

  end

  def merit_category_badge?(test_passage)
    current_category = Category.find(test_passage.test.category_id)
    tests_by_category = Test.all.where(category_id: current_category.id).pluck(:title)
    passed_tests = []

    test_passages.each do |test|
      if test.success? && test.test.category_id == current_category.id
        passed_tests << test.test.title
      end
    end

    result = tests_by_category - passed_tests
    result.empty? && badges.where(criteria: current_category.title).empty?

  end

end
