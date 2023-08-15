BACKUP_PATH=/root/container_backup/
mkdir -p $BACKUP_PATH
rm -rf $BACKUP_PATH
podman images |  sed '1d' | awk '{print $1 " " $2 " " $3}' |  tr -c "a-z A-Z0-9_.\n-" "%" | while read REPOSITORY TAG IMAGE_ID
do
  echo "--"
  REPO_PATH=$REPOSITORY\%$TAG
  REPO_TAR=$REPO_PATH\_$IMAGE_ID.tar
  mkdir -p $BACKUP_PATH/$REPO_PATH
  echo "podman save -o $BACKUP_PATH$REPO_PATH/$REPO_TAR $IMAGE_ID"
  podman save -o $BACKUP_PATH$REPO_PATH/$REPO_TAR $IMAGE_ID

  for v in $(podman volume ls --format "{{.Name}}")
  do
   containers="$(podman ps -a --filter volume=$v --format '{{.Image}}' |  tr -c "a-z A-Z0-9.\n-" "%" )"

   if [ $containers == $REPO_PATH ]; then

     container_name="$(podman ps -a --filter volume=$v --format '{{.Names}}')"
     VOLUME_PATH="$(podman volume inspect mariadb-data --format  '{{.Mountpoint}}')"
     echo "volume $v path : $VOLUME_PATH"
     echo "tar cvfz  $BACKUP_PATH$REPO_PATH/$v.tgz  $VOLUME_PATH"
     tar cvfz  $BACKUP_PATH$REPO_PATH/volume-$v.tgz  $VOLUME_PATH
     echo "podman inspect  -f 'docker run --name {{.Name}} -v {{join .HostConfig.Binds \" \"}} -p {{.HostConfig.PortBindings}} {{.Config.Image}} {{join .Config.Cmd \" \"}}' $container_name"
     container_cmd=$(podman inspect  -f 'docker run --name {{.Name}} -v {{join .HostConfig.Binds " "}} -p {{.HostConfig.PortBindings}} {{.Config.Image}} {{join .Config.Cmd " "}}' $container_name)
     echo $container_cmd > $BACKUP_PATH$REPO_PATH/run.sh

   fi

  done

done
