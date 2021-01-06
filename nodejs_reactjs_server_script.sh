# (cd server && npm start) &(cd client/reckoginition && npm start)
client_path="/home/user/rekognition/client/reckoginition"
server_path="/home/user/rekognition/server"
case "$1" in
   "start")
    case "$2" in
    "all")
    (kill -9 $(lsof -t -i:8080)) &( kill -9 $(lsof -t -i:3000));
    (cd "$server_path" && npm start) &(cd "$client_path" && npm start)
   clear
     echo " all client and server started successfully"
    ;;
    "client") 
    kill -9 $(lsof -t -i:3000);
    (cd "$client_path" && npm start)
    clear
    echo "client started successfully"
    ;;
    "server")
      kill -9 $(lsof -t -i:8080);
     (cd "$server_path" && npm start)
     echo "server started successfully"
    ;;
    esac
   ;;
   "stop")
    case "$2" in
    "all")
     (kill -9 $(lsof -t -i:8080)) &( kill -9 $(lsof -t -i:3000))
     echo "all"
    ;;
    "client")
     kill -9 $(lsof -t -i:3000)
     echo "client"
    ;;
    "server")
     kill -9 $(lsof -t -i:8080)
     echo "server"
    ;;
    esac
   ;;
  
esac
