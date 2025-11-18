#!/bin/bash
check() {
    return 0
}

depends() {
    return 0
}

install() {
    if [ -x /usr/bin/intel_reg ]; then
        inst_binary /usr/bin/intel_reg
    fi

    if [ -f "$moddir/files/i915-pwm.conf" ]; then
        inst_simple "$moddir/files/i915-pwm.conf" "/etc/modprobe.d/i915-pwm.conf"
    fi

    instmods i915
    return 0
}
