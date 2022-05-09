#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_ali_onekeylogin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_ali_onekeylogin'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter project.'
  s.description      = <<-DESC
A new Flutter project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.vendored_frameworks = 'libs/ATAuthSDK.framework', 'libs/YTXMonitor.framework', 'libs/YTXOperators.framework'
  s.static_framework = false

    # 解决移动crash
  s.xcconfig = {
      'OTHER_LDFLAGS' => '-ObjC',
      'ENABLE_BITCODE' => 'NO'
    }
    
    # 加载静态资源
  s.resources = ['Assets/*']
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
