#!/bin/bash

# Reversed order of components with Audio at the top
components=(
    "Audio"
    "AEE"
    "Bluetooth"
    "Batterysecret"
    "Fuelgauge"
    "Display"
    "TEE"
    "NVRAM"
    "Keymaster"
    "USB"
    "ConsumerIr"
    "Connectivity"
    "Media"
    "Wi-Fi"
    "Tether"
    "MMS"
    "Perf"
    "Gatekeeper"
    "Thermal"
    "GNSS"
    "Neural Network"
    "Secure Element"
    "Vibrator"
    "Public Libraries"
    "DRM"
    "HotwordEnrollment"
    "Radio"
    "Camera"
    "Sensor"
    "Fingerprint"
)

# Loop through components and run bash command
for component in "${components[@]}"; do
    echo "Processing: $component"
    bash vext.sh "$component"
done

echo "All components processed!"
