#!/bin/bash

#===========================================================================================================
# thanks:
# https://github.com/gd0772/AutoBuild-OpenWrt
# https://github.com/gd0772/patch/blob/main/gd772.sh
#==========================================================================================================
TIME() {
[[ -z "$1" ]] && {
	echo -ne " "
} || {
     case $1 in
	r) export Color="\e[31;1m";;
	g) export Color="\e[32;1m";;
	b) export Color="\e[34;1m";;
	y) export Color="\e[33;1m";;
	z) export Color="\e[35;1m";;
	l) export Color="\e[36;1m";;
      esac
	[[ $# -lt 2 ]] && echo -e "\e[36m\e[0m ${1}" || {
		echo -e "\e[36m\e[0m ${Color}${2}\e[0m"
	 }
      }
}

#====================================================================================================
# Pull_third_party_package:
#--------------------------------------------------------------------------------------------------
# 第三方插件最好先拉进仓库https://github.com/ghaner/OpenwrtPackage-Updater,再由之作为唯一的feed,除有条件的软件外不在此处单独添加第三方插件.
# 需要拉取的third_party_package
#    自定义编译需要
#         openwrt源码中没有
#         比openwrt源码更优（需要编辑\OpenWrt-Compiler\cus_script\Delete_original_code.sh及在OpenWrt-Compiler\.github\workflows\OpenWrt Compiler.yml- name:  Load Custom Configuration打开命令 ）
#    自己不需要但口碑较好
# 拉取仓库源代码命令格式（每部分间隔一个空格）：拉取命令 -命令参数  Package-url
# 步骤
#1.编辑Package-url
#1.1浏览器打开源代码makefile文件所在的文件夹（不要打开makefile文件）。
#1.2复制makefile文件所在的文件夹的浏览器地址栏内的地址
#1.3替换makefile文件不在仓库根目录时的地址：用trunk替换tree/master;用branch/branch-name替换tree/branch
#2.拉取命令：makefile在仓库根目录下的用git clone命令，其他目录用svn co或svn export命令。参考https://github.com/danshui-git/shuoming/blob/master/ming.md
#例：
# git clone -b branch-name Package-url  分支克隆
# git clone --depth=n Package-url       深度克隆 n：最近n次提交的代码
# svn co Package-url
#--------------------------------------------------------------------------------------------------
#echo
#TIME y "添加 Package-name"
# git clone -b branch-name Package-url  
# git clone --depth=n Package-url       
# svn co Package-url
#============================================================================================
echo
TIME y ".github\Pull_third_party_package.sh开始添加 third-party package:"
echo
TIME y "添加 adguardhome"
svn co https://github.com/kenzok8/openwrt-packages/trunk/adguardhome
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome
echo
TIME y "添加 filebrowser"
svn export https://github.com/ghaner/OpenWrt-Packages/trunk/filebrowser
svn export https://github.com/ghaner/OpenWrt-Packages/trunk/luci-app-filebrowser  
echo
TIME y "添加 fileassistant"	
svn export https://github.com/ghaner/OpenWrt-Packages/trunk/luci-app-fileassistant
#echo
#TIME y "添加 ikoolproxy"	
#git clone https://github.com/ilxp/luci-app-ikoolproxy
echo
TIME y "添加 openclash"		
svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash
echo
TIME y "添加 timedreboot"		
git clone https://github.com/kongfl888/luci-app-timedreboot
echo
TIME y "添加 luci-theme-argon"		
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon	
		
        #git_clone https://github.com/sirpdboy/luci-app-advanced
        #git_clone https://github.com/sirpdboy/luci-app-autotimeset
        #git_clone https://github.com/NateLol/luci-app-beardropper
 
 
        #git_clone https://github.com/sirpdboy/luci-app-netdata
        #git_clone https://github.com/rufengsuixing/luci-app-onliner
 
        
        #git_clone https://github.com/zzsj0928/luci-app-pushbot
        #git_clone https://github.com/esirplayground/luci-app-poweroff
        #git_clone https://github.com/DevOpenWRT-Router/luci-app-rebootschedule
        #git_clone https://github.com/pymumu/openwrt-smartdns
        #git_clone https://github.com/walkingsky/luci-wifidog luci-app-wifidog
  
 
        #git_clone https://github.com/openwrt-develop/luci-theme-atmaterial
        #git_clone https://github.com/sirpdboy/luci-theme-btmod
        #git_clone https://github.com/netitgo/luci-theme-jj
        #git_clone https://github.com/thinktip/luci-theme-neobird
        #git_clone https://github.com/sirpdboy/luci-theme-opentopd
 

 
        #svn export https://github.com/doushang/luci-app-shortcutmenu/trunk/luci-app-shortcutmenu
        #svn export https://github.com/sirpdboy/netspeedtest/trunk/luci-app-netspeedtest
        #svn export https://github.com/messense/aliyundrive-webdav/trunk/openwrt aliyundrive-webdav && mvdir aliyundrive-webdav
        #svn export https://github.com/messense/aliyundrive-fuse/trunk/openwrt && mvdir openwrt
        #svn export https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest/trunk/applications/luci-app-cloudflarespeedtest
 
        #svn export https://github.com/Tencent-Cloud-Plugins/tencentcloud-openwrt-plugin-ddns/trunk/tencentcloud_ddns luci-app-tencentddns
        #svn export https://github.com/Tencent-Cloud-Plugins/tencentcloud-openwrt-plugin-cos/trunk/tencentcloud_cos luci-app-tencentcloud-cos
    
        #git_branch_clone master https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic
 
  
        #git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
        #git clone --depth=1 -b lede https://github.com/pymumu/luci-app-smartdns
        #git_clone https://github.com/281677160/luci-app-autoupdate
        #svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-unblockmusic
        #svn export https://github.com/coolsnowwolf/packages/trunk/multimedia/UnblockNeteaseMusic-Go
        #svn export https://github.com/coolsnowwolf/packages/trunk/multimedia/UnblockNeteaseMusic
#echo
#TIME y "添加 ikoolproxy"
#git clone https://github.com/1wrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
#echo
#TIME y "添加 SSR Plus+"
#git clone https://github.com/fw876/helloworld package/gd772/ssrplus
#echo
#TIME y "添加 小猫咪"
#svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/gd772/luci-app-openclash
#echo
#TIME y "添加 Pass wall"
#git clone https://github.com/xiaorouji/openwrt-passwall package/gd772/passwall
#echo
#TIME y "添加 Hello World"
#git clone https://github.com/jerrykuku/luci-app-vssr package/gd772/luci-app-vssr
#echo
#TIME y "添加 京东签到"
#git clone https://github.com/jerrykuku/luci-app-jd-dailybonus package/gd772/luci-app-jd-dailybonus
#echo
#TIME y "添加 SmartDNS"
#git clone https://github.com/pymumu/luci-app-smartdns.git -b lede ./package/gd772/luci-app-smartdns
#git clone https://github.com/pymumu/openwrt-smartdns.git ./feeds/packages/net/smartdns
#echo
#TIME y "添加 KPR去广告"
#git clone https://github.com/project-lede/luci-app-godproxy package/gd772/luci-app-godproxy
#echo
#TIME y "添加 微信推送"
#git clone https://github.com/tty228/luci-app-serverchan.git ./package/gd772/luci-app-serverchan
#echo
#TIME y "汉化 实时监控"
#rm -rf ./package/lean/luci-app-netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata ./package/lean/luci-app-netdata
#rm -rf ./feeds/packages/admin/netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/netdata ./feeds/packages/admin/netdata
#echo
#TIME y "添加 Dockerman"
#rm -rf package/gd772/luci-app-dockerman && svn co https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman package/gd772/luci-app-dockerman
#echo
#TIME y "添加 应用过滤"
#git clone https://github.com/destan19/OpenAppFilter package/gd772/OpenAppFilter
#echo
#TIME y "添加 网络测速"
#git clone https://github.com/sirpdboy/NetSpeedTest package/NetSpeedTest

TIME y "添加 third-party package 结束"
#----------------------------------------------------------------------------------------------------------
