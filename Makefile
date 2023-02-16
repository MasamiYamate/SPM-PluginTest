hoge:
	echo ${DST}
	echo ${PATH}/../../info.plist > ${DST}/test.txt
	zsh ${WORKDIR}/build_tool.sh ${DST}
