#!/usr/bin/env bash
source <(curl -s https://raw.githubusercontent.com/tv4you2016/ProxmoxVE/main/misc/build.func)
# Copyright (c) 2021-2025 tteck
# Author: tteck (tteckster)
# License: MIT | https://github.com/tv4you2016/ProxmoxVE/raw/main/LICENSE
# Source: https://github.com/Forceu/Gokapi

APP="Gokapi"
var_tags="file;sharing"
var_cpu="1"
var_ram="512"
var_disk="4"
var_os="debian"
var_version="12"
var_unprivileged="1"

header_info "$APP"
variables
color
catch_errors

function update_script() {
   header_info
   check_container_storage
   check_container_resources
   if [[ ! -d /opt/gokapi ]]; then
      msg_error "No ${APP} Installation Found!"
      exit
   fi
   msg_error "Currently we don't provide an update function for this ${APP}."
   exit
}

start
build_container
description

msg_ok "Completed Successfully!\n"
echo -e "${CREATING}${GN}${APP} setup has been successfully initialized!${CL}"
echo -e "${INFO}${YW} Access it using the following URL:${CL}"
echo -e "${TAB}${GATEWAY}${BGN}http://${IP}:53842/setup${CL}"