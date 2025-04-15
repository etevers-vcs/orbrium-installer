#!/bin/bash


while true; do
read -p "SELECT [yes or no]: " _YKEY
case $_YKEY in
	YES | Yes | Y | yes | y)
		echo ""
		echo "YES"
		echo ""
		exit 0
		;;
	NO | No | N | no | n)
		echo ""
		echo "NO"
		echo ""
		exit 0
		;;
esac
done
