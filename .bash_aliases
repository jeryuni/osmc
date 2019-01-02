function gwget() {
	CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$1" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')
	wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O $2
	rm -rf /tmp/cookies.txt
}

function apt() {
	echo
	echo "### 패키지 저장소 업데이트 시작 ###"
	echo
	sudo apt-get -y update
	echo
	echo "### 패키지 저장소 업데이트 완료 ###"
	echo
	echo
	echo "### 패키지 업그레이드 시작 ###"
	echo
	sudo apt-get -y dist-upgrade
	echo
	echo "### 패키지 업그레이드 완료 ###"
	echo
	echo
	echo "### 패키지 저장소 청소 시작 ###"
	echo
	sudo apt-get -y clean
	sudo apt-get -y autoremove
	echo
	echo "### 패키지 저장소 청소 완료 ###"
	echo
}
