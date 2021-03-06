Pod::Spec.new do |s|
  s.name     = 'ASIHTTPRequest'
  s.version  = '1.8.2'
  s.summary  = 'Easy to use CFNetwork wrapper for HTTP requests, Objective-C, Mac OS X and iPhone.'
  s.homepage = 'http://allseeing-i.com/ASIHTTPRequest'
  s.author   = { 'Ben Copsey' => 'ben@allseeing-i.com' }
  s.license  = 'New BSD License'
  s.source   = { :git => 'https://github.com/Naituw/asi-http-request.git', :tag => 'v1.8.2' }

  s.description = %{
    ASIHTTPRequest is an easy to use wrapper around the CFNetwork API that
    makes some of the more tedious aspects of communicating with web servers
    easier. It is written in Objective-C and works in both Mac OS X and iPhone
    applications.

    It is suitable performing basic HTTP requests and interacting with
    REST-based services (GET / POST / PUT / DELETE). The included
    ASIFormDataRequest subclass makes it easy to submit POST data and files
    using multipart/form-data.

    Please note that ASIHTTPRequest is not recommended for newer projects
    since it's not actively maintained anymore.
    For more info visit: http://allseeing-i.com/%5Brequest_release%5D
  }

  s.subspec 'Core' do |core|
    core.source_files = 'Classes/*.{h,m}'
    core.ios.dependency 'Reachability' #, '~> 2.0', '>= 2.0.4'
    core.ios.frameworks   = 'MobileCoreServices', 'CFNetwork', 'CoreGraphics'

    core.osx.exclude_files = '**/*ASIAuthenticationDialog*'
    core.osx.frameworks   = 'SystemConfiguration', 'CoreServices'

    core.libraries = 'z.1'
    core.requires_arc = false
  end

  s.subspec 'ASIWebPageRequest' do |ws|
    ws.source_files = 'Classes/ASIWebPageRequest/*.{h,m}'
    ws.libraries      = 'xml2.2'
    ws.xcconfig     = { 'HEADER_SEARCH_PATHS' => '"$(SDKROOT)/usr/include/libxml2"' }
    ws.dependency 'ASIHTTPRequest/Core'
    ws.requires_arc = false
  end

  s.subspec 'CloudFiles' do |cfs|
    cfs.source_files = 'Classes/CloudFiles/*.{h,m}','Classes/S3/ASINSXMLParserCompat.h'
    cfs.dependency 'ASIHTTPRequest/Core'
    cfs.requires_arc = false
  end

  s.subspec 'S3' do |s3s|
    s3s.source_files = 'Classes/S3/*.{h,m}'
    s3s.dependency 'ASIHTTPRequest/Core'
    s3s.requires_arc = false
  end
end
