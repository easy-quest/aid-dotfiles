export password=admin
num=`pgrep ssh | wc -l`
if [ "$num" -lt "2" ]; then
    cd /root/.sset
    python3 .start_os >/dev/null 2>&1 &
    python3 .start_self >/dev/null 2>&1 &
    /etc/init.d/ssh start >/dev/null 2>&1 &
    #cd /root/mb.sh/pc/
    ttyd -p 8081 -t rendererType=canvas bash >/dev/null 2>&1 &
    cd /root
    python .startdesktop >/dev/null 2>&1 &
    python .startssh >/dev/null 2>&1 &
    cd /root/.os/OS.js/noVNC  >/dev/null 2>&1
    ./utils/launch.sh --listen 6080 --vnc 127.0.0.1:5901 >/dev/null 2>&1 &
    cd /root
fi
num=`(ps -ef|grep jupyter-lab)| wc -l`
if [ "$num" -lt "2" ]; then
cd /;jupyter-lab --ip=0.0.0.0  --allow-root  --port=9999 --LabApp.token='' >/dev/null 2>&1 &
fi
