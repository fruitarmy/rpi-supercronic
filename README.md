# rpi-supercronic [![Build Status](https://travis-ci.org/fruitarmy/rpi-supercronic.svg?branch=master)](https://travis-ci.org/fruitarmy/rpi-supercronic)

This aims to dockerize [supercronic](https://github.com/aptible/supercronic) for the ARM based [Raspberry Pi](https://raspberrypi.org)

>Supercronic is a crontab-compatible job runner, designed specifically to run in containers.

## Usage

`docker run -v /some/crontab/file:/crontab fruitarmy/rpi-supercronic`

where `/some/crontab/file` contains regular cron lines like in [crontab](/crontab)

## Example usage

`docker run fruitarmy/rpi-supercronic`


Example Output:
```sh
time="2017-08-21T09:22:00Z" level=info msg="read crontab: /crontab"
time="2017-08-21T09:23:00Z" level=info msg=starting iteration=0 job.command="echo "Hello, World!"" job.position=0 job.schedule="* * * * *"
time="2017-08-21T09:23:00Z" level=info msg="Hello, World!" channel=stdout iteration=0 job.command="echo "Hello, World!"" job.position=0 job.schedule="* * * * *"
time="2017-08-21T09:23:00Z" level=info msg="job succeeded" iteration=0 job.command="echo "Hello, World!"" job.position=0 job.schedule="* * * * *"
^C
time="2017-08-21T09:23:20Z" level=info msg="received interrupt, shutting down"
time="2017-08-21T09:23:20Z" level=info msg="waiting for jobs to finish"
time="2017-08-21T09:23:20Z" level=info msg=exiting
```