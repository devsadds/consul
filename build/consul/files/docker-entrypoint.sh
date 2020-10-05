#!/bin/bash

main(){
	echo "Run consul agent -config-file /consul/config/config.json"
	consul agent -config-file /consul/config/config.json
}

main