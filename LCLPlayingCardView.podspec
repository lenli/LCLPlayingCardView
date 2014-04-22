
Pod::Spec.new do |s|
  s.name         = "LCLPlayingCardView"
  s.version      = "1.0.1"
  s.summary      = "LCLPlayingCardView is a simple, but beautiful playing card implemented as a UIView."
  s.description  = <<-DESC
                   LCLPlayingCardView is a simple, but beautiful playing card implemented as a UIView.
                   
                   Lightweight: No images for the cards -- 100% code.
                   Flexible: Since it’s code, you can tweak anything about the cards to fit your needs.
                   Realistic Feel: The included customizations make the cards feel more real

  s.homepage     = "https://github.com/lenli/LCLPlayingCardView"
  s.screenshots  = "https://github.com/lenli/LCLPlayingCardView/raw/master/LCLPlayingCardViewScreenshot.png"
  s.license      = :type => "MIT"
  s.author             = { "Len Li" => "leonard.li@gmail.com" }
  s.social_media_url   = "http://twitter.com/lenli"
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/lenli/LCLPlayingCardView.git", :tag => "0.0.1" }
  s.source_files  = "LCLPlayingCardView*.{h,m}"
end
