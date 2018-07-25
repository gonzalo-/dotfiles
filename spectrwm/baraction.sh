#!/bin/sh
#

print_date() {
	FORMAT="%a %b %d %R"
	DATE=`date "+${FORMAT}"`
	echo -n " | ${DATE}"
}

print_mem() {
	MEM=`/usr/bin/top | grep Free: | cut -d " " -f6`
	echo -n " | Mem: $MEM "
}

_print_cpu() {
	typeset -R4 _1=${1}
	echo -n "CPU:${_1}%  "
}

print_cpu() {
	OUT=""
	while [ "${1}x" != "x" ]; do
		if [ ${1} -gt 99 ]; then
			OUT="$OUT ${1%100} 100"
		else
			OUT="$OUT ${1}"
		fi
		shift;
	done
	_print_cpu $OUT
}

print_apm() {
	BAT_STATUS=$1
	BAT_LEVEL=$2
	AC_STATUS=$3

	if [ $AC_STATUS -ne 255 -o $BAT_STATUS -lt 4 ]; then
		if [ $AC_STATUS -eq 0 ]; then
			echo -n "Bat (${BAT_LEVEL}%) | "
		else
			case $AC_STATUS in
			1)
				AC_STRING="Con AC: "
				;;
			2)
				AC_STRING="Con AC backup: "
				;;
			*)
				AC_STRING=""
				;;
			esac;
			case $BAT_STATUS in
			4)
				BAT_STRING="(Sin Bateria) | "
				;;
			[0-3])
		 		BAT_STRING="(Bat ${BAT_LEVEL}%) | "
				;;
			*)
				BAT_STRING="(Bat Desconocida) | "
				;;
			esac;
		
			FULL="${AC_STRING}${BAT_STRING}"
			if [ "$FULL" != "" ]; then
				echo -n "$FULL"
			fi
		fi
	fi
}

print_cpuspeed() {
	CPU_SPEED=`/sbin/sysctl hw.cpuspeed | cut -d "=" -f2`
	echo -n "CPU: $CPU_SPEED MHz | "
}

while :; do
	/usr/sbin/iostat -C -c 3600 |&  # wish infinity was an option
	PID="$!"
	APM_DATA=""
	I=0
	trap "kill $PID; exit" TERM
	while read -p; do
		if [ $(( ${I} % 1 )) -eq 0 ]; then
			APM_DATA=`/usr/sbin/apm -alb`
		fi
		if [ $I -gt 2 ]; then
			print_date
			print_mem
			print_cpuspeed
			print_apm $APM_DATA
			echo ""
		fi
		I=$(( ( ${I} + 1 ) % 22 ));
	done
done
