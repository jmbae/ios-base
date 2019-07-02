platform :ios, '10.0'
use_frameworks!
inhibit_all_warnings!

target 'ios-base' do
  pod 'Alamofire', '~> 4.8.2'
  pod 'Moya', '~> 13.0.1'
  pod 'IQKeyboardManagerSwift', '~> 6.2.1'
  pod 'RSFontSizes', '~> 1.0.2'
  pod 'Firebase', '~> 6.3.0'
  pod 'FirebaseAnalytics', '~> 6.0.2'
  pod 'FirebaseAuth', '~> 6.1.2'
  pod 'Fabric', '~> 1.10.2'
  pod 'Crashlytics', '~> 3.13.2'

  # FB SDK ---
  pod 'FBSDKCoreKit', '~> 5.2.0'
  pod 'FBSDKLoginKit', '~> 5.2.0'
  # ------
end

target 'AcceptanceTests' do
  pod 'KIF', '~> 3.7.8', :configurations => ['Debug']
  pod 'KIF/IdentifierTests', '~> 3.7.3', :configurations => ['Debug']
  pod 'OHHTTPStubs/Swift', '~> 8.0.0', :configurations => ['Debug']
end
