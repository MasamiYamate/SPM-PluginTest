OUTPUT=$1

/bin/rm -rf "$OUTPUT/XCDemo.xcframework"

/usr/bin/xcodebuild archive\
    -project "XCDemo/XCDemo.xcodeproj"\
    -scheme "XCDemo"\
    -configuration "Release"\
    -destination "generic/platform=iOS"\
    -archivePath "intermediate/XCDemo.framework-iphoneos.xcarchive"\
    SKIP_INSTALL=NO\
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

/usr/bin/xcodebuild archive\
    -project "XCDemo/XCDemo.xcodeproj"\
    -scheme "XCDemo"\
    -configuration "Release"\
    -destination "generic/platform=iOS Simulator"\
    -archivePath "intermediate/XCDemo.framework-iphonesimulator.xcarchive"\
    SKIP_INSTALL=NO\
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

/usr/bin/xcodebuild -create-xcframework\
    -framework "intermediate/XCDemo.framework-iphoneos.xcarchive/Products/Library/Frameworks/XCDemo.framework"\
    -framework "intermediate/XCDemo.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/XCDemo.framework"\
    -output "$OUTPUT/XCDemo.xcframework"
