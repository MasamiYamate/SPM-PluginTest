hoge:
	echo ${DST}
	echo ${SRCROOT} > ${DST}/test.txt
	zsh ${WORKDIR}/build_tool.sh ${DST}
