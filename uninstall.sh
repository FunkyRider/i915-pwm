#!/bin/sh

echo "Uninistalling Intel i915 backlight PWM mod..."

rm /lib/dracut/modules.d/95intel_reg/files/i915-pwm.conf
rm /lib/dracut/modules.d/95intel_reg/module-setup.sh

rmdir /lib/dracut/modules.d/95intel_reg/files
rmdir /lib/dracut/modules.d/95intel_reg

dracut -f

echo "Uninstallation complete."
