VERSION=	1.0
BUNDLE=		MOV2GIF.app
PKGINFO=	$(BUNDLE)/Contents/PkgInfo
INFO_PLIST=	$(BUNDLE)/Contents/Info.plist
ICON=		$(BUNDLE)/Contents/Resources/applet.icns
MAIN=		$(BUNDLE)/Contents/Resources/Scripts/main.scpt
MOV2GIF_SH=	$(BUNDLE)/Contents/Resources/mov2gif.sh

all: $(PKGINFO) $(MAIN) $(MOV2GIF_SH) $(INFO_PLIST)

install: all ffmpeg
	rsync -av --delete $(BUNDLE) /Applications/

clean:
	rm -rf $(BUNDLE)

$(PKGINFO):
	make template info-plist icon main

template:
	echo | osacompile -o $(BUNDLE)

info-plist:
	VERSION=$(VERSION) ./update_plist.sh $(INFO_PLIST)

icon:
	install -c -m 644 applet.icns $(ICON)

main:
	osacompile -o $(MAIN) main.applescript

$(INFO_PLIST): update_plist.sh
	make info-plist

$(ICON): applet.icon
	make icon

$(MAIN): main.applescript
	make main

$(MOV2GIF_SH): mov2gif.sh
	install -c -m 755 mov2gif.sh $(MOV2GIF_SH)

ffmpeg:
	@PATH=/usr/local/bin:/opt/local/bin /bin/sh -c 'type ffmpeg' || { \
	  echo "Please install ffmpeg from Homebrew or MacPorts." >&2; \
	  false; \
	}
