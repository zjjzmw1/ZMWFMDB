Pod::Spec.new do |s|

s.name             = "ZMWFMDB"

s.version          = "1.0.0"

s.summary          = "基于FMDB的数据库相关操作(事务、增删改查、单例、子线程)"

s.description      = <<-DESC
 "基于FMDB的数据库相关操作(事务、增删改查、单例、子线程)"
DESC

s.homepage         = "https://github.com/zjjzmw1/ZMWFMDB"
s.license          = "MIT"
s.author           = { "张明炜" => "zjjzmw1@163.com" }

s.source           = { :git => "https://github.com/zjjzmw1/ZMWFMDB.git", :tag => s.version.to_s }
s.platform     = :ios, "7.0"

s.requires_arc = true

s.source_files = "Classes/*"

s.frameworks = "Foundation", "CoreGraphics", "UIKit"

end