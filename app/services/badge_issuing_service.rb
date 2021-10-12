class BadgeIssuingService

  attr_accessor :issued

  def initialize(user, test_passage)
    @user = user
    @test_passage = test_passage
    @issued = []
  end

  def call
   Badge.all.each do |badge|
     if send("#{badge.rule}_award?", badge.value)
       @user.badges << badge
       @issued << badge
     end
   end
  end

  private

  def first_try_award?(value)
    @user.test_passages.where(test_id: @test_passage.test.id).count == 1 && @test_passage.success
  end

  def level_award?(level)
    tests_by_level = Test.all.where(level: level.to_i).pluck(:id)
    return false if tests_by_level.empty?
    passed_tests = Test.joins("JOIN test_passages ON test_passages.test_id = tests.id
                               AND test_passages.user_id = #{@user.id}
                               AND test_passages.success = true").distinct.where(level: level.to_i).pluck(:id)

    result = tests_by_level - passed_tests
    result.empty? && @user.badges.where(rule: "level", value: level).empty?
  end

  def category_award?(cat)
    current_category = Category.find_by(title: cat)
    tests_by_category = Test.all.where(category_id: current_category.id).pluck(:id)
    passed_tests = Test.joins("JOIN test_passages ON test_passages.test_id = tests.id
                               AND test_passages.user_id = #{@user.id}
                               AND test_passages.success = true").distinct.where(category_id: current_category.id).pluck(:id)

    result = tests_by_category - passed_tests
    result.empty? && @user.badges.where(rule: "category", value: cat).empty?
  end

end
