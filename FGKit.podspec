Pod::Spec.new do |spec|
	spec.name = "FGKit"
	spec.version = "1.0.0"
	spec.summary = "FGKit"
	spec.homepage = "https://github.com/gabrielgvDOTcom/fgkit"
	spec.license = { :type => "MIT", :file => "LICENSE.txt" }
	spec.authors = { "weeKG" => "hola@weekg.cl" }
	spec.social_media_url = "https://twitter.com/weekg"
	spec.swift_version = "5.0"

	spec.platform = :ios, "10.0"
	spec.requires_arc = true
	spec.source = { git: "https://github.com/gabrielgvDOTcom/fgkit", tag: spec.version, submodules: true }
	spec.resources = 'FGKit/**/*.{xcassets,xib,storyboard}' 
	spec.source_files = "FGKit/**/*.{h,swift}"
	spec.static_framework = true

	spec.dependency "ObjectMapper"
	spec.dependency "Alamofire", "4.8.2"
	spec.dependency "Kingfisher", "5.4.0"
end