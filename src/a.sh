#!/bin/bash
set -Ceu
#-----------------------------------------------------------------------------
# Bashの連想配列（宣言・操作）。
# 作成日時: 2019-04-07T06:25:52+0900
#-----------------------------------------------------------------------------
Run() {
	Reference
	DestructiveOperation
}
Reference() {
	#declare -A Human=([Name]=Andy [Age]=20)
	declare -Ar Human=([Name]=Andy [Age]=20)

	echo "KeyCount: ${#Human[@]}"
	echo "Keys: ${!Human[@]}"
	for  key in ${!Human[@]}; do echo "${Human[$key]}"; done;
}
DestructiveOperation() {
	declare -A Human=([Name]=Andy [Age]=20)

	# 要素を追加する
	Human[Address]=Japan
	for  key in ${!Human[@]}; do echo -n "$key: ${Human[$key]}, "; done;
	echo ''

	# 要素に代入する
	Human[Age]=99
	for  key in ${!Human[@]}; do echo -n "$key: ${Human[$key]}, "; done;
	echo ''

	# 指定要素を削除する
	unset Human[Address]
	for  key in ${!Human[@]}; do echo -n "$key: ${Human[$key]}, "; done;
	echo ''

	# 全削除（定義ごと）
	unset Human
	[[ -v Human ]] && echo 'Humanは定義済み。' || echo 'Humanは未定義。'
}
Run

