Pod::Spec.new do |s|
# 名称 使用的时候pod search [name]
s.name = "LXCategory"
# 代码库的版本
s.version = "0.1.0"
# 简介
s.summary = "自己收集的一些分类."
# 主页
s.homepage = "https://github.com/linxyang/LXCategory"
# 许可证书类型，要和仓库的LICENSE 的类型一致
s.license = "MIT"
# 作者名称 和 邮箱
s.author = { "linxyang" => "1217789227@qq.com" }
# 作者主页 s.social_media_url ="http://www.jianshu.com/users/205fbf665de0/latest_articles"
# 代码库最低支持的版本
s.platform = :ios, "7.0"
# 代码的Clone 地址 和 tag 版本
s.source = { :git => "https://github.com/linxyang/LXCategory.git", :tag => "0.1.0" }
# 如果使用pod 需要导入哪些资源
s.source_files = "LXCategory/**/*.{m,h}"
# s.resources = "*.bundle"
# 框架是否使用的ARC
s.requires_arc = true
end