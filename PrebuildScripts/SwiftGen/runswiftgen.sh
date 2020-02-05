RSROOT=$SRCROOT/Plantify/Resources

"$PODS_ROOT/SwiftGen/bin/swiftgen" \
xcassets -t swift4 "$RSROOT/Assets.xcassets" \
--output "$RSROOT/Helpers/Assets.swift"

"$PODS_ROOT/SwiftGen/bin/swiftgen" \
strings -t structured-swift4 "$RSROOT/Localizable.strings" \
--output "$RSROOT/Helpers/Strings.swift"

"$PODS_ROOT/SwiftGen/bin/swiftgen" \
fonts -t swift4 "$RSROOT/Fonts" \
--output "$RSROOT/Helpers/Fonts.swift"

"$PODS_ROOT/SwiftGen/bin/swiftgen" \
ib -t scenes-swift4 "Plantify" \
--output "$RSROOT/Helpers/Scenes.swift"

