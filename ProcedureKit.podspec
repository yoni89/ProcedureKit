Pod::Spec.new do |s|
  s.name              = "ProcedureKitNew"
  s.version           = "6.0.0"
  s.summary           = "Advanced Operations in Swift."
  s.homepage          = "https://github.com/yoni89/ProcedureKit.git"
  s.license           = 'MIT'
  s.authors           = { "ProcedureKit Core Contributors fox xcode2" => "yonik@gini-apps.com" }
  s.source            = { :git => "https://github.com/yoni89/ProcedureKit.git", :tag => s.version.to_s }
  s.module_name       = 'ProcedureKitNew'

  s.ios.deployment_target = '13.0'
  s.watchos.deployment_target = '3.0'
  s.tvos.deployment_target = '9.2'
  s.osx.deployment_target = '10.11'
  
  # Ensure the correct version of Swift is used
  s.swift_version = '5.9'

  # Default spec is 'Standard'
  s.default_subspec = 'Standard'

  # Default core framework suitable for an iOS, watchOS, tvOS or macOS application
  s.subspec 'Standard' do |ss|
    ss.source_files = ['Sources/ProcedureKit']
    ss.exclude_files = [
      'Sources/TestingProcedureKit',
      'Sources/ProcedureKitMobile',
      'Sources/ProcedureKitMac',
      'Sources/ProcedureKitTV',
      'Sources/ProcedureKitNetwork',
      'Sources/ProcedureKitCloud',
      'Sources/ProcedureKitLocation'
    ]
  end

  # ProcedureKitNetwork
  s.subspec 'Network' do |ss|
  	ss.dependency 'ProcedureKit/Standard'
  	ss.source_files = ['Sources/ProcedureKitNetwork']
  end

  # ProcedureKitCoreData
  s.subspec 'CoreData' do |ss|
  	ss.dependency 'ProcedureKit/Standard'
  	ss.frameworks = 'CoreData'
  	ss.source_files = ['Sources/ProcedureKitCoreData']
  end

  # ProcedureKitLocation
  s.subspec 'Location' do |ss|
  	ss.dependency 'ProcedureKit/Standard'
  	ss.frameworks = 'CoreLocation', 'MapKit'
  	ss.source_files = ['Sources/ProcedureKitLocation']
  end

  # All cross-platform ProcedureKit
  s.subspec 'All' do |ss|
  	ss.dependency 'ProcedureKit/Network'
  	ss.dependency 'ProcedureKit/Location'
  	ss.dependency 'ProcedureKit/CoreData'  	
  	ss.dependency 'ProcedureKit/Cloud'
  end

  # ProcedureKitMobile
  s.subspec 'Mobile' do |ss|
    ss.platforms = { :ios => "13.0" }
  	ss.dependency 'ProcedureKit/Standard'
  	ss.source_files = ['Sources/ProcedureKitMobile']
  end
  
end
