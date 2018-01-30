
Pod::Spec.new do |s|
  s.name             = "SDTrackTool"
  s.version          = "0.9.1"
  s.summary          = "Track events"
  s.description      = <<-DESC
                       Track events without dirty code
                       DESC
  s.homepage         = "https://github.com/CoderLISIDI/SDTrackTool"
  s.license          = 'MIT'
  s.author           = { "李思迪" => "lisidinetwork@gmail.com" }
  s.source           = { :git => "https://github.com/CoderLISIDI/SDTrackTool.git", :tag => s.version.to_s }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'SDTrackTool/*'
  s.frameworks = 'Foundation', 'UIKit'

end