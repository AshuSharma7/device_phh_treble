Device Tree for Treble devices

**Steps to compile:**

After Applying patch:

call "bash device/phh/treble/dt_generate.sh" to generate config files

"lunch dot_variant"

"WITHOUT_CHECK_API=true -jx systemimage"
