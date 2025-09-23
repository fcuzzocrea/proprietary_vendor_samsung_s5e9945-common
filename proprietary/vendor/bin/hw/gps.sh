#! /vendor/bin/sh

SILENT_LOGGING_9900=/data/vendor/gps/silentGnssLogging
SILENT_LOGGING_ISSUETRACKER=/data/vendor/gps/silentGnssLoggingIssueTracker

MODEL=`getprop ro.product.odm.name`
CONFIGFILE=/vendor/etc/gnss/gps.cfg
DAEMONFILE=/vendor/bin/hw/gpsd_K43
FIRMWAREFILE=/vendor/firmware/gnss/firmware_signed_$MODEL.bin

if [ -d "$SILENT_LOGGING_ISSUETRACKER" ] ; then
	CONFIGFILE=/vendor/etc/gnss/gps.issuetracker.cfg
fi

if [ -d "$SILENT_LOGGING_9900" ] ; then 
	CONFIGFILE=/vendor/etc/gnss/gps.debug.cfg
fi

exec $DAEMONFILE -c $CONFIGFILE -b $FIRMWAREFILE
