DIRECTORY=$(dirname "${BASH_SOURCE[0]}")

cd $DIRECTORY

rm -rf ./../Sources
 
xcrun xcodebuild archive \
 -scheme SwiftNotoEmoji \
 -configuration Release \
 -destination 'generic/platform=iOS Simulator' \
 -archivePath './build/SwiftNotoEmoji.framework-iphonesimulator.xcarchive' \
 SKIP_INSTALL=NO \
 BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcrun xcodebuild archive \
 -scheme SwiftNotoEmoji \
 -configuration Release \
 -destination 'generic/platform=iOS' \
 -archivePath './build/SwiftNotoEmoji.framework-iphoneos.xcarchive' \
 SKIP_INSTALL=NO \
 BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcrun xcodebuild -create-xcframework \
 -framework './build/SwiftNotoEmoji.framework-iphoneos.xcarchive/Products/Library/Frameworks/SwiftNotoEmoji.framework' \
 -framework './build/SwiftNotoEmoji.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/SwiftNotoEmoji.framework' \
 -output './../Sources/SwiftNotoEmoji.xcframework'

rm -rf ./build

cd -
