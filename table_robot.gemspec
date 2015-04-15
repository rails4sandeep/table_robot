# coding: utf-8

Gem::Specification.new do |s|
  s.name        = 'table_robot'
  s.version     = '0.0.0'
  s.date        = '2015-04-13'
  s.summary     = "A robot that moves on a table without falling down"
  s.description = "A gem based solution to the table bot robot code challenge"
  s.authors     = ["Sandeep Kumar"]
  s.email       = ["v-sandeepkumar@nbnco.com.au"]
  s.files       = Dir["lib/*.*"]
  s.homepage    = 'http://rubygems.org/'
  s.license       = 'MIT'
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"
end