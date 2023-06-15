export XNOTIFY_FIFO="$HOME/.cache/xnotify$DISPLAY.fifo"
if ! [[ -p "$XNOTIFY_FIFO" ]] || ! pgrep -x "xnotify" > /dev/null ; then
	rm -f $XNOTIFY_FIFO
	mkfifo $XNOTIFY_FIFO
	nohup bash -c 'xnotify 0 <>$XNOTIFY_FIFO' >/dev/null 2>&1 &
fi
printf "$1" > $XNOTIFY_FIFO
