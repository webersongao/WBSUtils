#
#  Be sure to run `pod spec lint WBSUtils.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "WBSUtils"

  s.version      = "0.1"

  s.summary      = "iOS 第三方库优化 改bug工具库合集"

  s.description  = <<-DESC
  					iOS OC框架下年久失修库完善版，目前包含：YYImage YBImageBrowser 等。
                   DESC

  s.homepage     = "https://github.com/webersongao"

  s.license      = "MIT"

  s.author       = { "卫博生" => "weberson@163.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/webersongao/WBSUtils.git", :tag => "#{s.version}" }

  s.requires_arc = true

  s.default_subspec = "Core"

  s.subspec "Core" do |core|
    core.source_files   = "WBSUtils/Core/**/*.{h,m}"
  end
  s.subspec "YYImage" do |core|
    core.source_files   = "YBImageBrowser/**/*.{h,m}"
    core.exclude_files  = "YBImageBrowser/WebImageMediator/YBIBDefaultWebImageMediator.{h,m}"
    core.resources      = "YBImageBrowser/YBImageBrowser.bundle"
    core.dependency 'YYImage'
  end
# 2021-2-19  YBImageBrowser
  s.subspec "YBImageBrowser" do |ybbrowser|
    ybbrowser.source_files   = "WBSUtils/YBImageBrowser-master/YBImageBrowser/**/*.{h,m}"
    ybbrowser.exclude_files  = "WBSUtils/YBImageBrowser-masterYBImageBrowser/WebImageMediator/YBIBDefaultWebImageMediator.{h,m}"
    ybbrowser.resources      = "WBSUtils/YBImageBrowser-masterYBImageBrowser/YBImageBrowser.bundle"
    ybbrowser.dependency 'WBSUtils/YYImage'
  end


# 示例模板：
  #   s.subspec "NOSD" do |core|
  #   core.source_files   = "YBImageBrowser/**/*.{h,m}"
  #   core.exclude_files  = "YBImageBrowser/WebImageMediator/YBIBDefaultWebImageMediator.{h,m}"
  #   core.resources      = "YBImageBrowser/YBImageBrowser.bundle"
  #   core.dependency 'YYImage'
  # end

end

