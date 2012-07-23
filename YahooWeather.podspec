Pod::Spec.new do |s|
  s.name         = "YahooWeather.podspec"
  s.version      = "0.0.1"
  s.summary      = "Provides a Yahoo weather forecast (with basic UI) for a given zip code."
  s.homepage     = "https://github.com/stevenpsmith/YahooWeatherService"
  s.license      = 'MIT (example)'
  s.author       = { "stevenpsmith" => "ssmith@chariotsolutions.com" }
  s.source       = { :git => "git://github.com/stevenpsmith/YahooWeatherService.git" }
  s.platform     = :ios, '5.1'
  s.source_files = 'YahooWeather/API/**/*.{h,m}', 'YahooWeather/Model/**/*.{h,m}', 'YahooWeather/ViewController/**/*.{h,m}'
  s.resources = "'YahooWeather/ViewController/**/*.{xib}'"
  s.requires_arc = true
  s.dependency 'AFNetworking'
end
