LOG_DIR=${1:-"/var/log"}
ARCHIVE_DIR="/var/log/archive"

if [ ! -d "$LOG_DIR"]; then
	echo "Error: Directory '$LOG_DIR' does not exist."
	exit 1
fi

mkdir -p "$ARCHIVE_DIR"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_$TIMESTAMP.tar.gz"
ARCHIVE_PATH="$ARCHIVE_DIR/$ARCHIVE_NAME"

tar -czf "$ARCHIVE_PATH" -C "$LOG_DIR" .

LOG_FILE="$ARCHIVE_DIR/archive_log.txt"
echo "$(date) - Achived $LOG_DIR to $ARCHIVE_PATH" >> "$LOG_FILE"

echo "Logs successfully archived to: $ARCHIVE_PATH"
