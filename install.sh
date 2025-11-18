#!/bin/sh

echo "Installing Intel i915 backlight PWM mod..."

mkdir /lib/dracut/modules.d/95intel_reg
mkdir /lib/dracut/modules.d/95intel_reg/files

cp module-setup.sh /lib/dracut/modules.d/95intel_reg/
chmod +x /lib/dracut/modules.d/95intel_reg/module-setup.sh
cp i915-pwm.conf /lib/dracut/modules.d/95intel_reg/files/

dracut -f

echo "Installation complete."
