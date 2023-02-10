hoge:
	echo ${DST}
	echo ${DEMO} > ${DST}/test.txt
	zsh ${WORKDIR}/build_tool.sh ${DST}
