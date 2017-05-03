class Ember::PermissionsController < ApplicationController
  include Pundit

  before_action :authenticate_user_from_token
  self.responder = ApplicationResponder
  respond_to  :json
  attr_reader :current_user

  def authenticate_user_from_token
    authenticated = authenticate_with_http_token do |user_token, options|
      id = options[:id].presence
      user = User.find id

      if user && Devise.secure_compare(user.authentication_token, user_token)
        @current_user = user
      else
        return false
      end
    end
    authenticated.nil? ? false : authenticated
  end

  def show
    id_hash = JSON.parse params.require(:id)
    set_resource id_hash
    permission = {
        permission: {
            id: params.require(:id),
            authorized: authorized?(id_hash['action'])
        }
    }
    respond_with permission
  end

  private

  def authorized?(action)
    policy = get_policy
    policy.nil? ? true : policy.send("#{action}?")
  end

  def get_policy
    policy_class = PolicyFinder.new(@resource).policy
    policy_class.new(current_user, @resource) if policy_class.present?
  end

  def set_resource(hash)
    subject_type = hash['subject_type']
    subject_id   = hash['subject_id']
    @resource = if subject_id.present?
                  subject_type.constantize.find subject_id
                else
                  subject_type.constantize
                end
  end
end