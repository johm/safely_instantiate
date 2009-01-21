# Include hook code here
ActionController::Base.class_eval do
  include SafelyInstantiate
end
