docker build -f Dockerfile.api -t video_basedon_python .
sudo docker run --rm -it --name test_video video_basedon_python /bin/bash
uvicorn dev_fileserver.serve:app --reload
sudo docker run --rm -it --name test_fastapi test-fast-app-api /bin/bash
sudo docker run --rm -it -d -P --name test_fastapi test_fastapi_image /bin/bash 
sudo iptables -A INPUT -i eth0 -p tcp --dport 49154 -j ACCEPT
sudo docker run -it -d -P --name test_fastapi test_fastapi_image /bin/bash 
sudo iptables -A INPUT -i eth0 -p tcp --dport 49155 -j ACCEPT
sudo iptables -A INPUT -i eth0 -p tcp --dport 49154 -j DROP
sudo docker run -it -d -p 49155:4557 --name test_fastapi test_fastapi_image /bin/bash 
sudo docker run -it -p 9998:9998 --name test_fastapi test_fastapi_image /bin/bash
 


sudo docker build -f flask_conda.dockerfile -t test_falsk_01 .

sudo docker run -it -p 9998:9998 --name tflask test_falsk_01 /bin/bash


sudo docker run --rm -it -p 9999:9998 --name tflask test_falsk_01 /bin/bash
gunicorn --bind=0.0.0.0:9998 serve:app --reload

sudo iptables -A INPUT -p tcp --dport 9998 -j ACCEPT
sudo iptables -L

sudo iptables -A INPUT -p tcp --dport 9998 -j ACCEPT

sudo iptables -A INPUT -p tcp --dport 8000 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 3000 -j ACCEPT