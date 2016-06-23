Pod::Spec.new do |s|
    s.name = 'VIImageWorker'
    s.version = '0.1'
    s.license = 'MIT'
    s.summary = 'VIImageWorker 是处理图片行为的封装，比较适合用在为图片添加多种处理时使用'
    s.homepage = 'https://github.com/vitoziv/VIImageWorker'
    s.author = { 'Vito' => 'vvitozhang@gmail.com' }
    s.source = { :git => 'https://github.com/vitoziv/VIImageWorker.git', :tag => s.version.to_s }
    s.platform = :ios
    s.source_files = 'VIImageWorker/*.{h,m}', 'VIImageWorker/**/*.{h,m}'
    s.requires_arc = true
end

