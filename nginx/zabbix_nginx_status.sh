#!/bin/bash
# #check nginx status 
ip=127.0.0.1 
function ping() {
	/sbin/pidof nginx | wc -l 
} 
function active() {
	 /usr/bin/curl http://$ip/nginx_status 2>/dev/null | sed -n '1p' | awk '{print $NF}' 
} 
function accepts() {
	 /usr/bin/curl http://$ip/nginx_status 2>/dev/null | sed -n '3p' | awk '{print $1}' 
} 
function handled() {
	/usr/bin/curl http://$ip/nginx_status 2>/dev/null | sed -n '3p' | awk '{print $2}' 
} 
function requests() {
 	 /usr/bin/curl http://$ip/nginx_status 2>/dev/null | sed -n '3p' | awk '{print $3}' 
} 
function reading() {
 	/usr/bin/curl http://$ip/nginx_status 2>/dev/null | sed -n '4p' | awk '{print $2}' 
} 
function writing() {
 	 /usr/bin/curl http://$ip/nginx_status 2>/dev/null | sed -n '4p' | awk '{print $4}' 
} 
function waiting() { 
	 /usr/bin/curl http://$ip/nginx_status 2>/dev/null | sed -n '4p' | awk '{print $6}' 
} 
$1 
