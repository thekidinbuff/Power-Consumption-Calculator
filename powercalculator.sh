#!/bin/bash
# power_calculator.sh
echo "Power Consumption Calculator"

calculate_power() {
    local voltage=$1
    local current=$2
    local time_hours=${3:-1}
    if ! [[ "$voltage" =~ ^[0-9]+(\.[0-9]+)?$ && "$current" =~ ^[0-9]+(\.[0-9]+)?$ && "$time_hours" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Error: Please enter valid numbers."
        exit 1
    fi
    power_watts=$(echo "$voltage * $current" | bc -l)
    energy_wh=$(echo "$power_watts * $time_hours" | bc -l)
    energy_kwh=$(echo "$energy_wh / 1000" | bc -l)
    printf "\nResults:\n"
    printf "Power: %.2f Watts\n" "$power_watts"
    printf "Energy: %.2f Watt-hours\n" "$energy_wh"
    printf "Energy: %.3f Kilowatt-hours\n" "$energy_kwh"
}

read -p "Enter voltage (V): " voltage
read -p "Enter current (A): " current
read -p "Enter time (hours, default=1): " time_hours
calculate_power "$voltage" "$current" "$time_hours"
