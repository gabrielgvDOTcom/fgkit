Pod::Spec.new do |spec|
	spec.name = "FGKit"
	spec.version = "1.0.0"
	spec.summary = "FGKit"
	spec.homepage = "https://github.com/gabrielgvDOTcom/fgkit.git"
	spec.license = { :type => "MIT", :file => "LICENSE.txt" }
	spec.authors = { "Gabriel Gárate Vivanco" => "hola@gabrielgv.com" }
	spec.social_media_url = "https://twitter.com/gabrielgv"
	spec.swift_version = "5.0"

	spec.platform = :ios, "11.0"
	spec.requires_arc = true
	spec.source = { git: "https://github.com/gabrielgvDOTcom/fgkit.git", tag: spec.version, submodules: true }
	spec.resources = 'FGKit/**/*.{strings,xcassets,xib,storyboard}' 
	spec.source_files = "FGKit/**/*.{h,swift}"
	spec.static_framework = true
end