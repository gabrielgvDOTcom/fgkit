Pod::Spec.new do |spec|
	spec.name = "FGKit"
	spec.version = "1.0.1"
	spec.summary = "FGKit"
	spec.homepage = "https://github.com/gabrielgvDOTcom/fgkit.git"
	spec.license = { :type => "MIT", :file => "LICENSE.txt" }
	spec.authors = { "Gabriel Gárate Vivanco" => "hola@gabrielgv.com" }
	spec.social_media_url = "https://twitter.com/gabrielgv"
	spec.swift_version = "5.0"

	spec.platform = :ios, "11.0"
	spec.requires_arc = true
	spec.source = { git: "https://github.com/gabrielgvDOTcom/fgkit.git", tag: spec.version, submodules: true }
	spec.resources = "FGKit/**/*.{strings,xcassets,xib,storyboard}" 
	spec.source_files = "FGKit/**/*.{h,swift}"
	spec.static_framework = true
	spec.default_subspec = "Core"

	spec.dependency	"Kingfisher"
	spec.dependency	"Alamofire", "~> 4.9.1"

	spec.subspec "Core" do |core|
		# subspec for users who don"t want the third party PayPal 
		# & Stripe bloat
	end
	spec.subspec "SWRevealViewController" do |revealview|
		# revealview.xcconfig	=  { "OTHER_CFLAGS" => "$(inherited) -DKITE_OFFER_PAYPAL" }
    	revealview.dependency	"SWRevealViewController"
	end
end