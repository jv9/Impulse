platform :ios, "9.0"

use_frameworks!

pod 'Reveal-iOS-SDK', :configurations => ['Debug']
pod 'Spring', :git => 'https://github.com/MengTo/Spring.git', :branch => 'swift2'
pod "Timepiece", :git => 'git@github.com:naoty/Timepiece.git'

target :ImpulseExtension, :exclusive => true do
    pod "Timepiece", :git => 'git@github.com:naoty/Timepiece.git'
end

target :'Impulse WatchKit Extension', :exclusive => true do
    platform :watchos, '2.0'
    pod "Timepiece", :git => 'git@github.com:naoty/Timepiece.git'
end
