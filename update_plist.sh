#!/bin/sh

while read -r command; do
    /usr/libexec/PlistBuddy -c "$command" "$@"
done <<EOF
Delete :CFBundleShortVersionString
Add    :CFBundleShortVersionString string ${VERSION}
Delete :CFBundleDocumentTypes
Add    :CFBundleDocumentTypes array
Add    :CFBundleDocumentTypes:0:CFBundleTypeExtensions array
Add    :CFBundleDocumentTypes:0:CFBundleTypeExtensions:0 string mov
Add    :CFBundleDocumentTypes:0:CFBundleTypeExtensions:1 string mp4
Add    :CFBundleDocumentTypes:0:CFBundleTypeMIMETypes array
Add    :CFBundleDocumentTypes:0:CFBundleTypeMIMETypes:0 string video/quicktime
Add    :CFBundleDocumentTypes:0:CFBundleTypeMIMETypes:1 string video/mp4
Add    :CFBundleDocumentTypes:0:CFBundleTypeName string Movie content
Add    :CFBundleDocumentTypes:0:CFBundleTypeRole string Editor
EOF
