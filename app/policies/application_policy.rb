class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
    setup_super_policies
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope
    def initialize(user, scope)
      @user = user
      @scope = scope
      setup_super_scope
    end
    def resolve
      scope
    end
    private
    def setup_super_scope
      class_eval do
        alias_method :old_resolve, :resolve
        def resolve
          if user_see_everything?
            scope
          else
            send(:old_resolve)
          end
        end
      end
    end
    def user_see_everything?
      user.try(:has_role?, :fitclubs_administrator)
    end
  end
  private
  # класс policy не должен иметь публичных методов, оканчивающихся на вопросительный знак, кроме методов, соответствующих
  # действиям контроллера
  def setup_super_policies
    methods = (self.public_methods - Object.new.public_methods).select { |m| m =~ /\?$/ }
    self.class_eval do
      methods.each do |m|
        alias :"old_#{m}" :"#{m}"
        define_method(m) do
          if user_can_everything?
            true
          else
            send(:"old_#{m}")
          end
        end
      end
    end
  end
  def user_can_everything?
    user.try(:has_role?, :fitclubs_administrator)
  end
end