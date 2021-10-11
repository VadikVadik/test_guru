class BadgeIssuingService

  attr_accessor :issued

  def initialize(user, test_passage)
    @user = user
    @test_passage = test_passage
    @issued = []
    @first_try_badge = Badge.find_by(criteria: "FirstTry")
    @level_badge = Badge.find_by(criteria: @test_passage.test.level.to_s)
    @category_badge = Badge.find_by(criteria: Category.find(@test_passage.test.category_id).title)
  end

  def issue
    if merit_first_try_badge?
      @user.badges.push(@first_try_badge)
      @issued << @first_try_badge
    end
    if merit_level_badge?
      @user.badges.push(@level_badge)
      @issued << @level_badge
    end
    if merit_category_badge?
      @user.badges.push(@category_badge)
      @issued << @category_badge
    end
  end

  private

  def merit_first_try_badge?
    @user.test_passages.where(test_id: @test_passage.test.id).count == 1 && @test_passage.success
  end

  def merit_level_badge?
    level = @test_passage.test.level
    tests_by_level = Test.all.where(level: level).pluck(:title)
    passed_tests = Test.joins("JOIN test_passages ON test_passages.test_id = tests.id
                               AND test_passages.user_id = #{@user.id}
                               AND test_passages.success = true").where(level: level).pluck(:title)

    result = tests_by_level - passed_tests
    result.empty? && @user.badges.where(criteria: level.to_s).empty?

  end

  def merit_category_badge?
    current_category = Category.find(@test_passage.test.category_id)
    tests_by_category = Test.all.where(category_id: current_category.id).pluck(:title)
    passed_tests = Test.joins("JOIN test_passages ON test_passages.test_id = tests.id
                               AND test_passages.user_id = #{@user.id}
                               AND test_passages.success = true").where(category_id: current_category.id).pluck(:title)

    result = tests_by_category - passed_tests
    result.empty? && @user.badges.where(criteria: current_category.title).empty?

  end

end
