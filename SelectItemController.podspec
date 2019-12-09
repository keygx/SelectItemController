Pod::Spec.new do |s|
  s.name = "SelectItemController"
  s.version = "1.7.0"
  s.summary = "SelectItemController is a single selectable dialog. It's easy to use, written in Swift."
  s.homepage = "https://github.com/keygx/SelectItemController"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "keygx" => "y.kagiyama@gmail.com" }
  s.social_media_url = "http://twitter.com/keygx"
  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.source = { :git => "https://github.com/keygx/SelectItemController.git", :tag => "#{s.version}" }
  s.source_files = "SelectItemController/**/*"
  s.requires_arc = true
end
