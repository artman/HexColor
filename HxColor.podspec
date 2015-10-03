Pod::Spec.new do |s|
  s.name = 'HxColor'
  s.version = '2.0.0'
  s.license = 'MIT'
  s.summary = 'HexColor is a simple extension that lets you initialize UIColors the way they were meant to be initialized: With hex integer values.'
  s.homepage = 'https://github.com/artman/HexColor'
  s.social_media_url = 'http://twitter.com/artman'
  s.authors = { 'Tuomas Artman' => 'tuomas@artman.fi' }
  s.source = { :git => 'https://github.com/artman/HexColor.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  
  s.source_files = 'HexColor/*.swift'

  s.requires_arc = true
end
