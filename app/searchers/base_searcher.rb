class BaseSearcher
  def initialize(scope)
    @scope = scope
  end
  def search(option)
    scope = option[:scope]
    scoped_collection = if scope.present? && @scope.respond_to?(scope)
                          @scope.send(scope)
                        else
                          @scope.all
                        end
    filtered_collection = scoped_collection.search(option[:q]).result
    page_number    = option[:pagination].present? ? option[:pagination][:page] : 1
    per_page_count = option[:pagination].present? ? option[:pagination][:per_page] : 10
    filtered_collection.page(page_number).per(per_page_count)
  end
end