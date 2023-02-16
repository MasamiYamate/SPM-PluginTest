WORK=$1
OUTPUT=$2

/bin/rm -rf "$OUTPUT/XCDemo.xcframework"

/usr/bin/xcodebuild archive\
    -project "$WORK/XCDemo/XCDemo.xcodeproj"\
    -scheme "XCDemo"\
    -configuration "Release"\
    -destination "generic/platform=iOS"\
    -archivePath "$WORK/intermediate/XCDemo.framework-iphoneos.xcarchive"\
    SKIP_INSTALL=NO\
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

/usr/bin/xcodebuild archive\
    -project "$WORK/XCDemo/XCDemo.xcodeproj"\
    -scheme "XCDemo"\
    -configuration "Release"\
    -destination "generic/platform=iOS Simulator"\
    -archivePath "$WORK/intermediate/XCDemo.framework-iphonesimulator.xcarchive"\
    SKIP_INSTALL=NO\
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

rm -rf XCDemo.xcframework
/usr/bin/xcodebuild -create-xcframework\
    -framework "$WORK/intermediate/XCDemo.framework-iphoneos.xcarchive/Products/Library/Frameworks/XCDemo.framework"\
    -framework "$WORK/intermediate/XCDemo.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/XCDemo.framework"\
    -output "$WORK/XCDemo.xcframework"
