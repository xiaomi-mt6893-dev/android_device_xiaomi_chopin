bash extract-files.sh -s $1 ../../../../os_dump && cd ../../../vendor/xiaomi/chopin && git add . && git commit -sm "vendor: Import $1 Blobs" && cd ../../../device/xiaomi/chopin
