class ApplicationPolicy
  attr_reader :user, :record

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    record_owned_by_user? || user_is?('admin')
  end

  def scope
    record.class
  end

  def record_owned_by_user?
    return false if record.user.nil?
    return false unless user.present?
    record.user == user
  end

  def user_is?(*roles)
    user.present? && roles.any? { |role| user.send(:"#{role}?") }
  end

end
