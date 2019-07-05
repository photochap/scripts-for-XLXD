#!/bin/bash

dt=$(date '+%Y%m%d_%H%M%S');
logwatch > /var/www/logwatch/$dt"_logwatch.html"
