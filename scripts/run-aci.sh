#!/bin/bash
set -e

#
# This script runs an instance of scrumonline in Azure Container Instances
# If not running in the dev container, ensure that `az` is installed
#

RG_NAME=${RG_NAME:-scrumonline}
LOCATION=${LOCATION:-westeurope}
ACI_NAME=${ACI_NAME:-scrumonline-demo}

rg_exists=$(az group show --name "$RG_NAME" >/dev/null 2>&1; echo $?)
if [[ $rg_exists == "0" ]];then
	echo "Resource group $RG_NAME exists"
else
	echo "Creating resource group $RG_NAME..."
	az group create --name "$RG_NAME" --location "$LOCATION"
	echo
fi


echo "Starting container instance..."
az container create \
	--resource-group "$RG_NAME" \
	--name "$ACI_NAME" \
	--image ghcr.io/stuartleeks/scrumonline/scrumonline \
	--environment-variables HOST="http://$ACI_NAME.$LOCATION.azurecontainer.io" \
	--dns-name-label "$ACI_NAME" \
	--ports 80

