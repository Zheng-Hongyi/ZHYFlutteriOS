# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

flutter_application_path = '../zhy_flutter_module'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')


target 'ZHYFlutteriOS' do
  # Comment the next line if you don't want to use dynamic frameworks
  # use_frameworks!

  # Pods for ZHYFlutteriOS
  install_all_flutter_pods(flutter_application_path)
  pod 'SnapKit'
  
  
  post_install do |installer|
    flutter_post_install(installer) if defined?(flutter_post_install)
  end
  
end




