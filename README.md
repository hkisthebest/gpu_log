# gpu_log
Logs the GPU's Fan Speed, Core Clock, Memory Clock, Fan Speed and Temperature for troubleshooting your mac GPU.
## Use 
```
chmod 755 ./GPU_Log.sh
```
The default place to store the log files would be under`/Users/$USER/logs.
## Filter
``` shell
grep -E -- '\d\d:\d\d:\d\d|Temperature' <log file> | awk 'NF>0{x=$0;getline y;print x FS y}' | awk -F= '{if($2><temp to filter>) {print $0;}}'
```
Where `<log file>` is the file to filter from.
## Note
This script is based on this command line.
``` shell
while sleep 1; do clear;ioreg -l |grep \"PerformanceStatistics\" | cut -d '{' -f 2 | tr '|' ',' | tr -d '}' | tr ',' '\n'|grep 'Temp\|Fan\|Clock'; done
```
