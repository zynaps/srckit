#!/bin/sh

REPO_DIRS=`find ~/Sources/zynaps -type d -depth 1 ! -name obsolete | sort`

for REPO_DIR in ${REPO_DIRS}; do
  REPO_NAME=`echo ${REPO_DIR} | cut -d / -f 6`

  TMPFILE=`mktemp -p /tmp`

  git -C ${REPO_DIR} --no-pager -c color.ui=always unpushed > ${TMPFILE} 2>&1

  if [ -s ${TMPFILE} ]; then
     echo "\033[1;33m--- ${REPO_NAME}\033[0m" && cat ${TMPFILE} && echo
  fi

  rm -f ${TMPFILE}
done
