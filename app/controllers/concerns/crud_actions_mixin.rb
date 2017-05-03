module CrudActionsMixin
  extend ActiveSupport::Concern
  include Pundit

  included do
    before_action :set_item, only: [:show, :update, :destroy]
  end

  def index
    authorize(resource_class)
    @items = searcher.search(search_options)
    yield(@items) if block_given?
    respond_with(@items,
                 root: root_name.pluralize,
                 each_serializer: serializer,
                 serializer: paginated? ? PaginationSerializer : nil)
  end

  def show
    authorize(@item)
    yield(@item) if block_given?
    respond_with(@item, serializer: serializer, root: root_name)
  end

  def create
    build_item
    authorize(@item)
    form = get_form
    if form.present?
      if form.validate(permitted_params)
        form.save
      else
        return respond_with(form)
      end
    else
      @item.save
    end
    yield(@item) if block_given?
    respond_with(@item, serializer: serializer, location: false, root: root_name)
  end

  def update
    authorize(@item)
    form = get_form
    if form.present?
      if form.validate(permitted_params)
        form.save
      else
        return respond_with(form)
      end
    else
      @item.update(permitted_params)
    end
    yield(@item) if block_given?
    respond_with(@item, location: false)
  end

  def destroy
    authorize(@item)
    if @item.destroy
      render json: {}
    else
      head 500
    end
  end

  protected
    def namespace
      ''
    end

    def resource_name
      self.class.to_s.gsub("#{namespace}", '').gsub!('Controller', '').singularize.classify
    end

    def resource_class
      resource_name.constantize
    rescue
      raise('Model not found')
    end

    def root_name
      resource_name.underscore
    end

    def set_item
      @item = resource_class.find(params[:id])
    end

    def permitted_params
      if namespace == 'Mobile::'
        attrs = params.permit(policy(@item).permitted_attributes)
      else
        attrs = params.require(root_name).permit(policy(@item).permitted_attributes)
      end
      attrs.each { |key, attr| attrs[key] = attrs[key].eql?('null') ? nil : attr }
    end

    def build_item
      @item = resource_class.new
      @item.assign_attributes(permitted_params)
      @item
    end

    def get_form
      expected_form_name = "#{resource_name}Form"
      expected_form_name.constantize.new(@item)
    rescue
      nil
    end

    def serializer
      expected_serializer_name = "#{namespace}#{resource_name}Serializer"
      serializer = begin
        expected_serializer_name.constantize
      rescue
        nil
      end
      if serializer.nil?
        base_serializer_name = "#{resource_name}Serializer"
        serializer = base_serializer_name.constantize
      end
      serializer
    rescue
      raise('Serializer not found')
    end

    def authorized_scope
      policy_scope(resource_class)
    rescue
      resource_class.all
    end

    def searcher
      expected_searcher_name = "#{resource_name}Searcher"
      expected_searcher_name.constantize.new(authorized_scope)
    rescue
      BaseSearcher.new(authorized_scope)
    end

    def paginated?
      params[:page].present? && params[:per_page].present?
    end

    def search_options
      {
          scope: params[:scope],
          q: params[:q],
          pagination: paginated? ? { page: params[:page], per_page: params[:per_page] } : nil
      }
    end
end