#
#  Be sure to run `pod spec lint WBSUtils.podspec" to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "WBSUtils"
  s.version      = "0.2.2"
  s.summary      = "iOS 第三方库优化 改bug工具库合集"
  s.description  = <<-DESC
  					iOS OC框架下年久失修库完善版，目前包含：YYImage, YYCache, YYWebImage, YBImageBrowser WebViewJavascriptBridge等。
                   DESC
  s.homepage     = "https://github.com/webersongao"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "卫博生" => "gao@btbk.org" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/webersongao/WBSUtils.git", :tag => "#{s.version}" }

  s.requires_arc = true
  s.default_subspec = "Core"

# 2021-2-20  Core

  s.subspec "Core" do |core|
    core.source_files   = "WBSUtils/Core/**/*.{h,m}"
  end

# 2021-2-20  https://github.com/QiuYeHong90/YYImage

  s.subspec "YYImage" do |yyimg|
    yyimg.source_files = "WBSUtils/YYImage-master/YYImage/*.{h,m}"
    yyimg.public_header_files = "WBSUtils/YYImage-master/YYImage/*.{h}"
    yyimg.libraries = "z"
    yyimg.frameworks = "UIKit", "CoreFoundation", "QuartzCore", "AssetsLibrary", "ImageIO", "Accelerate", "MobileCoreServices"
  end


  s.subspec "YYCache" do |yycache|
    yycache.source_files = 'WBSUtils/YYCache-master/YYCache/*.{h,m}'
    yycache.public_header_files = 'WBSUtils/YYCache-master/YYCache/*.{h}'
    yycache.libraries = 'sqlite3'
    yycache.frameworks = 'UIKit', 'CoreFoundation', 'QuartzCore' 
  end

  s.subspec "YYWebImage" do |yywebimg|
    yywebimg.source_files = 'WBSUtils/YYWebImage-master/YYWebImage/*.{h,m}', 'WBSUtils/YYWebImage-master/YYWebImage/Categories/*.{h,m}'
    yywebimg.public_header_files = 'WBSUtils/YYWebImage-master/YYWebImage/*.{h}', 'WBSUtils/YYWebImage-master/YYWebImage/Categories/*.{h}'
    yywebimg.private_header_files = 'WBSUtils/YYWebImage-master/YYWebImage/Categories/_*.{h}'
    yywebimg.dependency 'WBSUtils/YYImage'
    yywebimg.dependency 'WBSUtils/YYCache'
    yywebimg.frameworks = 'UIKit', 'CoreFoundation', 'QuartzCore', 'AssetsLibrary', 'ImageIO', 'Accelerate', 'MobileCoreServices'
  end

  # s.subspec "YYImage_WebP" do |webp|
  #   webp.dependency "WBSUtils/YYImage"
  #   webp.ios.vendored_frameworks = "WBSUtils/YYImage-master/Vendor/WebP.framework"
  # end

  # s.subspec "YYImage_libwebp" do |libwebp|
  #   libwebp.dependency "WBSUtils/YYImage"
  #   libwebp.dependency "libwebp"
  #   libwebp.xcconfig = { 
  #     "USER_HEADER_SEARCH_PATHS" => "$(inherited) $(SRCROOT)/libwebp/src"
  #   }
  # end"

# 2021-2-20  YBImageBrowser

  s.subspec "YBImageBrowser" do |ybbrowser|
    ybbrowser.source_files   = "WBSUtils/YBImageBrowser-master/YBImageBrowser/**/*.{h,m}"
    ybbrowser.resources      = "WBSUtils/YBImageBrowser-master/YBImageBrowser/YBImageBrowser.bundle"
    ybbrowser.dependency "WBSUtils/YYImage"
    ybbrowser.dependency "SDWebImage", ">= 5.0.0"
  end


  s.subspec "WebViewJsBridge" do |wkjsbridge|
    wkjsbridge.source_files   = "WBSUtils/WebViewJavascriptBridge/WebViewJavascriptBridge/*.{h,m}"
  end


# 示例模板：
  #   s.subspec "NOSD" do |core|
  #   core.source_files   = "YBImageBrowser/**/*.{h,m}"
  #   core.exclude_files  = "YBImageBrowser/WebImageMediator/YBIBDefaultWebImageMediator.{h,m}"
  #   core.resources      = "YBImageBrowser/YBImageBrowser.bundle"
  #   core.dependency "YYImage"
  # end

end

