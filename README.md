
# i915-pwm
Certain models of laptop with LCD display has a very low frequency PWM based brightness control, which can have perceivable flicker that increases eye strain. Some models with Intel iGPU (From Sandy Bridge to later series) has the ability to control the backlight PWM frequency in the driver.

This Linux script adjusts (increases) backlight PWM frequency on Intel iGPU laptops. It adds a script to set LCD backlight PWM frequency to 1.2 KHz on kernel image. The setting gets applied before the i915 display driver is loaded so it is persistent across sleep / resume cycle and brightness scaling in desktop environment (Gnome, KDE tested) is still correct with new frequency.

### Environment
The script is made specifically for Fedora Linux (tested on 42, 43) and depends on those packages:
> dracut
> igt-gpu-tools

Make sure the dependent packages are installed before proceeding. Dracut is installed by default in Fedora. To install igt-gpu-tools (intel-gpu-tools), run as super user:
> sudo dnf -y install igt-gpu-tools

To make sure that your laptop backlight PWM can be adjusted, run as super user:

> sudo intel_reg read 0xc8254

If it runs without error and gives a reading of the register, i.e.:
> (0x000c8254): 0x032e00cc

Then you can proceed to installation step.

### Installation
To install, run as super user:
> sudo ./install.sh

After installation complete prompt, reboot system. The new backlight PWM frequency will be applied at boot time.

To uninstall, run as super user:
> sudo ./uninstall.sh

After uninstallation complete prompt, reboot system. The backlight frequency will be restored to factory default.

### Modification
You can modify the i915-pwm.conf to alter target PWM frequency. The value in the script: 0x032e0146 means setting PWM frequency register to 0x032e (1200Hz) and duty cycle to 0x0146 (40%). The duty cycle doesn't really matter as when Desktop Environment gets initialized it will be overridden. The frequency setting has to be referenced from internet forums. You can manually call intel_reg write 0xc8254 {new_value} to test the setting before applying it to the script. After modifying i915-pwm.conf, run install.sh again and reboot to apply the new settings to your system.

### Tested setups
* Lenovo Yoga 730-13IKB: i7-8550U, HD620, Fedora Linux 43 KDE Edition
* Lenovo MiiX 520-12IKB: i5-8250U, HD620, Fedora Linux 43 Workstation

More tested setups can be added on the list by user submission.
