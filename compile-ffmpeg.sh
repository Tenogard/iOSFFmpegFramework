#!/bin/sh

# FFmpeg source path
FFMPEG_SOURCE_PATH="./FFmpeg-n2.4.2"
FFMPEG_OUTPUT_PATH=`pwd`"/output/lib"

# iOS SDK version, eg. 7.1 8.0
SDK_VERSION="8.0"
IPHONEOS_VERSION_MIN="6.0"

XCODE_PATH='/Applications/Xcode.app/Contents/Developer/Platforms'
GCC_PATH='/Applications/XCode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang'
GASPREP_DEST_PATH='/usr/local/bin'
PLATOFRM_PATH_SIM='/iPhoneSimulator.platform'
PLATOFRM_PATH_IOS='/iPhoneOS.platform'
SDK_PATH_SIM="/Developer/SDKs/iPhoneSimulator${SDK_VERSION}.sdk"
SDK_PATH_IOS="/Developer/SDKs/iPhoneOS${SDK_VERSION}.sdk"

########### FFMPEG_BUILD_ARGS_COMMON
FFMPEG_ARGS=""
FFMPEG_ARGS="$FFMPEG_ARGS --disable-ffmpeg --disable-ffplay --disable-ffserver --disable-ffprobe --disable-doc --disable-bzlib"
FFMPEG_ARGS="$FFMPEG_ARGS --target-os=darwin"
FFMPEG_ARGS="$FFMPEG_ARGS --enable-cross-compile"
FFMPEG_ARGS="$FFMPEG_ARGS --enable-gpl"
FFMPEG_ARGS="$FFMPEG_ARGS --enable-version3"
FFMPEG_BUILD_ARGS_COMMON=$FFMPEG_ARGS
FFMPEG_BUILD_ARGS_COMMON_DEBUG="--enable-debug --disable-stripping"
FFMPEG_BUILD_ARGS_COMMON_RELEASE="--disable-debug"

########### FFMPEG_BUILD_ARGS_ARMV7
FFMPEG_ARGS=""
FFMPEG_ARGS="$FFMPEG_ARGS --arch=arm"
FFMPEG_ARGS="$FFMPEG_ARGS --cpu=cortex-a8"
FFMPEG_ARGS="$FFMPEG_ARGS --enable-pic"
FFMPEG_ARGS="$FFMPEG_ARGS --extra-cflags='-arch armv7 -miphoneos-version-min=${IPHONEOS_VERSION_MIN}'"
FFMPEG_ARGS="$FFMPEG_ARGS --extra-ldflags='-arch armv7 -miphoneos-version-min=${IPHONEOS_VERSION_MIN}'"
FFMPEG_ARGS="$FFMPEG_ARGS --extra-cflags='-mfpu=neon -mfloat-abi=softfp'"
FFMPEG_ARGS="$FFMPEG_ARGS --enable-neon"
#FFMPEG_ARGS="$FFMPEG_ARGS --disable-neon"
FFMPEG_ARGS="$FFMPEG_ARGS --enable-optimizations"
FFMPEG_ARGS="$FFMPEG_ARGS --disable-armv5te --disable-armv6 --disable-armv6t2"
FFMPEG_ARGS="$FFMPEG_ARGS --enable-small"
FFMPEG_ARGS="$FFMPEG_ARGS --prefix=armv7"
FFMPEG_BUILD_ARGS_ARMV7=$FFMPEG_ARGS

########### FFMPEG_BUILD_ARGS_ARMV7S
FFMPEG_ARGS=""
FFMPEG_ARGS="$FFMPEG_ARGS --arch=arm"
FFMPEG_ARGS="$FFMPEG_ARGS --cpu=cortex-a9"
FFMPEG_ARGS="$FFMPEG_ARGS --enable-pic"
FFMPEG_ARGS="$FFMPEG_ARGS --extra-cflags='-arch armv7s -miphoneos-version-min=${IPHONEOS_VERSION_MIN}'"
FFMPEG_ARGS="$FFMPEG_ARGS --extra-ldflags='-arch armv7s -miphoneos-version-min=${IPHONEOS_VERSION_MIN}'"
FFMPEG_ARGS="$FFMPEG_ARGS --extra-cflags='-mfpu=neon -mfloat-abi=softfp'"
FFMPEG_ARGS="$FFMPEG_ARGS --enable-neon"
#FFMPEG_ARGS="$FFMPEG_ARGS --disable-neon"
FFMPEG_ARGS="$FFMPEG_ARGS --enable-optimizations"
FFMPEG_ARGS="$FFMPEG_ARGS --disable-armv5te --disable-armv6 --disable-armv6t2"
FFMPEG_ARGS="$FFMPEG_ARGS --enable-small"
FFMPEG_ARGS="$FFMPEG_ARGS --prefix=armv7s"
FFMPEG_BUILD_ARGS_ARMV7S=$FFMPEG_ARGS

########### FFMPEG_BUILD_ARGS_ARM64
FFMPEG_ARGS=""
FFMPEG_ARGS="$FFMPEG_ARGS --arch=arm64"
#FFMPEG_ARGS="$FFMPEG_ARGS --cpu=cortex-a9"
FFMPEG_ARGS="$FFMPEG_ARGS --enable-pic"
FFMPEG_ARGS="$FFMPEG_ARGS --extra-cflags='-arch arm64 -miphoneos-version-min=${IPHONEOS_VERSION_MIN}'"
FFMPEG_ARGS="$FFMPEG_ARGS --extra-ldflags='-arch arm64 -miphoneos-version-min=${IPHONEOS_VERSION_MIN}'"
FFMPEG_ARGS="$FFMPEG_ARGS --extra-cflags='-mfpu=neon -mfloat-abi=softfp'"
FFMPEG_ARGS="$FFMPEG_ARGS --enable-neon"
#FFMPEG_ARGS="$FFMPEG_ARGS --disable-neon"
FFMPEG_ARGS="$FFMPEG_ARGS --enable-optimizations"
FFMPEG_ARGS="$FFMPEG_ARGS --disable-armv5te --disable-armv6 --disable-armv6t2"
FFMPEG_ARGS="$FFMPEG_ARGS --enable-small"
FFMPEG_ARGS="$FFMPEG_ARGS --prefix=arm64"
FFMPEG_BUILD_ARGS_ARM64=$FFMPEG_ARGS

########### FFMPEG_BUILD_ARGS_SIMX86
FFMPEG_ARGS=""
FFMPEG_ARGS="$FFMPEG_ARGS --assert-level=2"
FFMPEG_ARGS="$FFMPEG_ARGS --disable-mmx"
FFMPEG_ARGS="$FFMPEG_ARGS --arch=i386"
FFMPEG_ARGS="$FFMPEG_ARGS --cpu=i386"
FFMPEG_ARGS="$FFMPEG_ARGS --extra-ldflags='-arch i386 -miphoneos-version-min=${IPHONEOS_VERSION_MIN}'"
FFMPEG_ARGS="$FFMPEG_ARGS --extra-cflags='-arch i386 -miphoneos-version-min=${IPHONEOS_VERSION_MIN}'"
FFMPEG_ARGS="$FFMPEG_ARGS --disable-asm"
FFMPEG_ARGS="$FFMPEG_ARGS --prefix=i386"
FFMPEG_BUILD_ARGS_SIMX86=$FFMPEG_ARGS

########### FFMPEG_BUILD_ARGS_SIMX86_64
FFMPEG_ARGS=""
FFMPEG_ARGS="$FFMPEG_ARGS --assert-level=2"
FFMPEG_ARGS="$FFMPEG_ARGS --disable-mmx"
FFMPEG_ARGS="$FFMPEG_ARGS --arch=x86_64"
FFMPEG_ARGS="$FFMPEG_ARGS --cpu=x86_64"
FFMPEG_ARGS="$FFMPEG_ARGS --extra-ldflags='-arch x86_64 -miphoneos-version-min=${IPHONEOS_VERSION_MIN}'"
FFMPEG_ARGS="$FFMPEG_ARGS --extra-cflags='-arch x86_64 -miphoneos-version-min=${IPHONEOS_VERSION_MIN}'"
FFMPEG_ARGS="$FFMPEG_ARGS --disable-asm"
FFMPEG_ARGS="$FFMPEG_ARGS --prefix=x86_64"
FFMPEG_BUILD_ARGS_SIMX86_64=$FFMPEG_ARGS

########### FFMPEG_BUILD_ARGS_GCC_SIM
FFMPEG_ARGS=""
FFMPEG_ARGS="$FFMPEG_ARGS --cc=${GCC_PATH}"
FFMPEG_ARGS="$FFMPEG_ARGS --as='${GASPREP_DEST_PATH}/gas-preprocessor.pl ${GCC_PATH}'"
FFMPEG_ARGS="$FFMPEG_ARGS --sysroot=${XCODE_PATH}${PLATOFRM_PATH_SIM}${SDK_PATH_SIM}"
FFMPEG_BUILD_ARGS_GCC_SIM=$FFMPEG_ARGS
#echo $FFMPEG_BUILD_ARGS_GCC_SIM

########### FFMPEG_BUILD_ARGS_GCC_IOS
FFMPEG_ARGS=""
FFMPEG_ARGS="$FFMPEG_ARGS --cc=${GCC_PATH}"
FFMPEG_ARGS="$FFMPEG_ARGS --as='${GASPREP_DEST_PATH}/gas-preprocessor.pl ${GCC_PATH}'"
FFMPEG_ARGS="$FFMPEG_ARGS --sysroot=${XCODE_PATH}${PLATOFRM_PATH_IOS}${SDK_PATH_IOS}"
FFMPEG_BUILD_ARGS_GCC_IOS=$FFMPEG_ARGS
#echo $FFMPEG_BUILD_ARGS_GCC_IOS

########### FFmpeg libraries
FFMPEG_LIBS="libavcodec libavformat libavutil libswscale libswresample"	
	
########### Functions

# Create a FFmpeg compile script file for a specified arch. eg. `archCompileScrit armv7 armv7.sh /tmp/ffmpeg/lib Release`
function archCompileScrit()
{
    if [ "$#" -lt 3 ] ; then
		echo "Usage: archCompileScrit arch scriptfile outputdir [Debug|Release]"
		return 1          
	fi
	arch=$1
	script=$2
	outdir=$3
	FFMPEG_BUILD_ARGS_GCC=""
	FFMPEG_BUILD_ARGS_PLATOFRM=""
	FFMPEG_BUILD_ARGS_EXTERNAL=$FFMPEG_BUILD_ARGS_COMMON_RELEASE
	case $4 in
		"release" | "Release" | "RELEASE" )
		FFMPEG_BUILD_ARGS_EXTERNAL=$FFMPEG_BUILD_ARGS_COMMON_RELEASE;;
		"debug" | "Debug" | "DEBUG" )
		FFMPEG_BUILD_ARGS_EXTERNAL=$FFMPEG_BUILD_ARGS_COMMON_DEBUG;;		
	esac
	
	case $arch in
		"x86" | "i386" )
			FFMPEG_BUILD_ARGS_GCC="${FFMPEG_BUILD_ARGS_GCC_SIM}"
			FFMPEG_BUILD_ARGS_PLATOFRM="${FFMPEG_BUILD_ARGS_SIMX86}"
			echo "Create FFmpeg compile script for sim i386";;
		"x86_64" | "amd64" | "x64" )
			FFMPEG_BUILD_ARGS_GCC="${FFMPEG_BUILD_ARGS_GCC_SIM}"
			FFMPEG_BUILD_ARGS_PLATOFRM="${FFMPEG_BUILD_ARGS_SIMX86_64}"
			echo "Create FFmpeg compile script for sim x86_64";;
		"armv7" )
			FFMPEG_BUILD_ARGS_GCC="${FFMPEG_BUILD_ARGS_GCC_IOS}"
			FFMPEG_BUILD_ARGS_PLATOFRM="${FFMPEG_BUILD_ARGS_ARMV7}"
			echo "Create FFmpeg compile script for armv7";;
		"armv7s" )
			FFMPEG_BUILD_ARGS_GCC="${FFMPEG_BUILD_ARGS_GCC_IOS}"
			FFMPEG_BUILD_ARGS_PLATOFRM="${FFMPEG_BUILD_ARGS_ARMV7S}"
			echo "Create FFmpeg compile script for armv7s";;
		"arm64" )
			FFMPEG_BUILD_ARGS_GCC="${FFMPEG_BUILD_ARGS_GCC_IOS}"
			FFMPEG_BUILD_ARGS_PLATOFRM="${FFMPEG_BUILD_ARGS_ARM64}"
			echo "Create FFmpeg compile script for arm64";;
		* )
		echo "Create FFmpeg compile script failed: Unknown arch: ${arch}"
		return 1;;
	esac

	# Create script file
	echo "#!/bin/sh"  > $script
	
	echo "###### FFmpeg compile script for ${arch}" >> $script
	echo "# " >> $script
	echo " " >> $script
	
	# Variables
	echo "SRCDIR=\`pwd\`" >> $script
	echo "SDKVERSION=\"${SDK_VERSION}\"" >> $script
	
	# configure 	
	echo "# configure" >> $script
	echo "./configure ${FFMPEG_BUILD_ARGS_GCC} \\" >> $script
	echo "${FFMPEG_BUILD_ARGS_PLATOFRM} \\" >> $script
	echo "${FFMPEG_BUILD_ARGS_COMMON} ${FFMPEG_BUILD_ARGS_EXTERNAL}" >> $script
	
	# Addition defines for ffmpeg
	echo "echo \"#define PLATFORM_IOS\" >> config.h" >> $script

	# make 
	echo "make clean" >> $script
	echo "make" >> $script
	
	# copy install
	echo "mkdir -p $outdir" >> $script
	echo "cp -f ./libavcodec/libavcodec.a $outdir/libavcodec.a" >> $script
	echo "cp -f ./libavformat/libavformat.a $outdir/libavformat.a" >> $script
	echo "cp -f ./libavutil/libavutil.a $outdir/libavutil.a" >> $script
	echo "cp -f ./libswscale/libswscale.a $outdir/libswscale.a" >> $script
	echo "cp -f ./libswresample/libswresample.a $outdir/libswresample.a" >> $script	
	
	# clean
	echo "make clean" >> $script
}

# Build FFmpeg for the specified arch. eg. `buildArch armv7 Release /tmp/ffmpeg/lib/Release`
function buildArch()
{
    if [ "$#" -lt 3 ] ; then
		echo "Usage: buildArch arch Debug|Release outputdir"
		return 1          
	fi
	
	buildtype="Release"
	case $2 in
		"release" | "Release" | "RELEASE" )
			buildtype="Release";;
		"debug" | "Debug" | "DEBUG" )
			buildtype="Debug";;
	esac
		
	arch=$1
	outputdir=$3
	buildscript="$FFMPEG_SOURCE_PATH/ios-${arch}.sh"	

	if [ -e "$buildscript" ]; then
		rm "$buildscript"
	fi	
	archCompileScrit $arch $buildscript $outputdir/$arch $buildtype
	if [ ! -e "$buildscript" ]; then
		echo "Build failed: Cannot create build script file for arch '${arch}'"
	fi	
	chmod +x $buildscript
	
	arch=$1
	CD_LAST=`pwd`
	
	cd "$FFMPEG_SOURCE_PATH"
	
    if [ -e config.h ]; then
      rm config.h
    fi

    if [ -e config.mak ]; then
      rm config.mak
    fi
		
	./ios-${arch}.sh
	
	cd $CD_LAST
}

function mergeArchLibs()
{
    if [ "$#" -lt 2 ] ; then
		echo "Usage: mergeArchLibs libdir arch1 arch2 [...]"
		return 1          
	fi
	outputdir=$1
	archs=""
	shift
	until [ $# -eq 0 ]
	do
		archs="$archs $1"
		shift
	done
		
	#xcrun -sdk iphoneos lipo -create $archlibs -output $outputdir/libavcodec.a
	
	for alib in $FFMPEG_LIBS; do
		archlibs=""
		for arch in $archs; do
			archlibs="$archlibs $outputdir/$arch/$alib.a"
		done
		echo "xcrun -sdk iphoneos lipo -create $archlibs -output $outputdir/$alib.a"
		xcrun -sdk iphoneos lipo -create $archlibs -output $outputdir/$alib.a
	done
	
	for alib in $FFMPEG_LIBS; do
		echo "$alib"
		lipo -info $outputdir/$alib.a
	done
}

function buildLibFFmpegDebug()
{
	archs=""
    if [ "$#" -lt 1 ] ; then
		echo "Usage: mergeArchLibs arch1 arch2 [...]"
		return 1          
	fi
	until [ $# -eq 0 ]
	do
		archs="$archs $1"
		shift
	done
	
	for target in $TARGET_ARCHS; do
		echo "Build for $target"
		buildArch $target Debug $FFMPEG_OUTPUT_PATH/Debug
	done

	mergeArchLibs $FFMPEG_OUTPUT_PATH/Debug $TARGET_ARCHS
}

function buildLibFFmpeg()
{
	archs=""
    if [ "$#" -lt 1 ] ; then
		echo "Usage: mergeArchLibs arch1 arch2 [...]"
		return 1          
	fi
	until [ $# -eq 0 ]
	do
		archs="$archs $1"
		shift
	done
	
	for target in $archs; do
		echo "Build for $target"
		buildArch $target Release $FFMPEG_OUTPUT_PATH/Release
	done

	mergeArchLibs $FFMPEG_OUTPUT_PATH/Release $TARGET_ARCHS
}

########### Build FFmpeg
# "armv7 armv7s i386 x86_64 arm64"
# `buildLibFFmpeg "armv7 armv7s i386 x86_64 arm64"`
# `buildLibFFmpegDebug "armv7 armv7s i386 x86_64 arm64"`

TARGET_ARCHS="armv7 armv7s arm64 i386 x86_64"

OPT_DEBUG=no

# 
until [ $# -eq 0 ]
do
	case $1 in
		"--enable-debug" )
			OPT_DEBUG=yes
		;;
	esac	
	shift
done

echo ""
echo "output: $FFMPEG_OUTPUT_PATH"
echo "sdk: iOS $SDK_VERSION -sdk iphoneos$SDK_VERSION"
echo "debug: $OPT_DEBUG"
echo ""

if [ "$OPT_DEBUG" == "no" ]; then
	buildLibFFmpeg $TARGET_ARCHS
else
	buildLibFFmpegDebug $TARGET_ARCHS
fi
