# UIView-AddLine

项目中使用了其它第三方的Masonry，引用了pod去管理。/n
所以下载下来后要进行一下步骤：/n
1、关闭xcode/n
2、用终端进入该项目所在路径/n
3、pod init/n
4、pod search Masonry/n
5、把pod 'Masonry', '~> 1.0.0'拷贝到Podfile的target下/n
6、pod install/n
7、用ViewLine.xcworkspace打开/n
8、编译 运行/n