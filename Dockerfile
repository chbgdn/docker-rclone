FROM rclone/rclone:latest

LABEL maintainer="chbgdn"

ENV SYNC_SRC=
ENV SYNC_DEST=
ENV SYNC_OPTS=-v
ENV SYNC_OPTS_EVAL=
ENV SYNC_ONCE=
ENV RCLONE_CMD=sync
ENV RCLONE_DIR_CMD=ls
ENV RCLONE_DIR_CMD_DEPTH=-1
ENV RCLONE_DIR_CHECK_SKIP=
ENV RCLONE_OPTS="--config /config/rclone.conf"
ENV OUTPUT_LOG=
ENV ROTATE_LOG=
ENV CRON=
ENV CRON_ABORT=
ENV FORCE_SYNC=
ENV CHECK_URL=
ENV FAIL_URL=
ENV HC_LOG=
ENV TZ=
ENV UID=
ENV GID=

RUN deluser --remove-home rclone

COPY entrypoint.sh /
COPY sync.sh /
COPY sync-abort.sh /

VOLUME ["/config"]
VOLUME ["/logs"]

ENTRYPOINT ["/entrypoint.sh"]

CMD [""]
