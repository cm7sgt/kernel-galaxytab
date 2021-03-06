export PROJECT_NAME=GT-P1000
export HW_BOARD_REV="03"
export CPU_JOB_NUM=4

export TOOLCHAIN=/opt/toolchains/arm-2009q3/bin/
export TOOLCHAIN_PREFIX=arm-none-linux-gnueabi-
export ARCH=arm

export LD_LIBRARY_PATH=.:${TOOLCHAIN}/../lib

KERNEL_DEFCONFIG()
{
	make ARCH=arm p1_android_rfs_eur_cm7_defconfig
}

KERNEL_MENUCONFIG()
{
	make -j$CPU_JOB_NUM ARCH=arm CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX menuconfig
}

KERNEL_BUILD()
{
	make -j$CPU_JOB_NUM ARCH=arm CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX
}

KERNEL_BUILD_MODULES()
{
	make -j$CPU_JOB_NUM ARCH=arm CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX modules
}

