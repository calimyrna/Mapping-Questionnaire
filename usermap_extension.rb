# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class UsermapExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/usermap"
  
define_routes do |map|
  map.resources :usermaps
end
  
  def activate
    # admin.tabs.add "Usermap", "/admin/usermap", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Usermap"
  end
  
end
