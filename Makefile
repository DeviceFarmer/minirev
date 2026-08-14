.PHONY: default clean prebuilt

NDKBUILT := \
  libs/arm64-v8a/minirev \
  libs/arm64-v8a/minirev-nopie \
  libs/armeabi-v7a/minirev \
  libs/armeabi-v7a/minirev-nopie \
  libs/x86/minirev \
  libs/x86/minirev-nopie \
  libs/x86_64/minirev \
  libs/x86_64/minirev-nopie \

default: prebuilt

clean:
	ndk-build clean
	rm -rf prebuilt

$(NDKBUILT):
	ndk-build

# It may feel a bit redundant to list everything here. However it also
# acts as a safeguard to make sure that we really are including everything
# that is supposed to be there.
prebuilt: \
  prebuilt/arm64-v8a/bin/minirev \
  prebuilt/arm64-v8a/bin/minirev-nopie \
  prebuilt/armeabi-v7a/bin/minirev \
  prebuilt/armeabi-v7a/bin/minirev-nopie \
  prebuilt/x86/bin/minirev \
  prebuilt/x86/bin/minirev-nopie \
  prebuilt/x86_64/bin/minirev \
  prebuilt/x86_64/bin/minirev-nopie \

prebuilt/%/bin/minirev: libs/%/minirev
	mkdir -p $(@D)
	cp $^ $@

prebuilt/%/bin/minirev-nopie: libs/%/minirev-nopie
	mkdir -p $(@D)
	cp $^ $@
