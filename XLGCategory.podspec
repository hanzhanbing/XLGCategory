Pod::Spec.new do |s|
  s.name         = 'XLGCategory'
  s.version      = '1.0.9'
  s.ios.deployment_target = '7.0'
  s.license  =  { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = 'An example of XLGCategory Function'
  s.homepage     = 'https://github.com/hanzhanbing/XLGCategory'
  s.author             = { 'hanzhanbing' => '1655661337@qq.com' }
  s.social_media_url   = 'http://weibo.com/3879141691'
  s.source       = { :git => 'https://github.com/hanzhanbing/XLGCategory.git', :tag => s.version }
  s.requires_arc = true

  s.public_header_files = 'XLGCategory/XLGCategory.h'
  s.source_files = 'XLGCategory/XLGCategory.h'

  s.subspec 'NSCategory' do |ns|
    ns.source_files = 'XLGCategory/NSCategory/*.{h,m}'
    ns.public_header_files = 'XLGCategory/NSCategory/*.h'
  end

  s.subspec 'UICategory' do |ui|
    ui.source_files = 'XLGCategory/UICategory/*.{h,m}'
    ui.public_header_files = 'XLGCategory/UICategory/*.h'
  end
end
