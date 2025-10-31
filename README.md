![image](https://github.com/user-attachments/assets/20d15eab-3700-4d73-80b9-d086ee1b86c3)


# DeMoN II


The DeMoN II is hobby cartridge that was developed as a collaboration between three geeks who have a very healthy obsession with the Amiga, and skilled in both software and hardware development alike. It can be described as an Action Replay on steroids.
It is the successor of the original DeMoN cartridge that can be found [here](https://github.com/gerbilbyte/DeMoN/).

![image](https://github.com/user-attachments/assets/001942ef-dd48-4f5c-beaa-1a473ea1d723)

This project will give a brief introduction, how it came to be, its features and plans so that you can build your own.

## Contents

[A Brief History](https://github.com/gerbilbyte/DeMoN2/blob/main/README.md#a-brief-history) (the boring bit. In fact, skip over this bit).

[DeMoN II features](https://github.com/gerbilbyte/DeMoN2/blob/main/README.md#features)

[Compatibility](https://github.com/gerbilbyte/DeMoN2/blob/main/README.md#compatibility)

[DeMoN II User Manual](https://github.com/gerbilbyte/DeMoN2/blob/main/README.md#demon-ii-user-manual)

[Build Your Own](https://github.com/gerbilbyte/DeMoN2/blob/main/README.md#build-your-own-demon-ii-cartridge)

* [Firmware](https://github.com/gerbilbyte/DeMoN2/blob/main/README.md#firmware) 
* [Flashing](https://github.com/gerbilbyte/DeMoN2/blob/main/README.md#flashing) 
* [Cartridge Case](https://github.com/gerbilbyte/DeMoN2/blob/main/README.md#cartridge-case)
* [License](https://github.com/gerbilbyte/DeMoN2/blob/main/README.md#license)
   
[Related Projects](https://github.com/gerbilbyte/DeMoN2/blob/main/README.md#related-projects)



## A Brief History - Part Two

For a brief history on the DeMoN cart please see the '[Brief History](https://github.com/gerbilbyte/DeMoN/blob/main/README.md#a-brief-history)' blurb on the original DeMoN cart repo.

Since the release of the original DeMoN, a few changes were made which made the cartridge a more superior piece of kit.
Firstly, the idea of adding a USB port to allow serial transfer of data came into fruition. This was planned and the idea became a reality.
No longer does an Amiga user need to use fiddly serial ports to talk between their Amiga and their PC.
Secondly, the five GALs were replaced by a single CLPD. This allowed for better features involving more complex PCB layouts.

The majority, if fact ALL of the work done on this version can be creditted to [na103](https://github.com/na103) and [REbEL](https://github.com/dmcoles) as they did all the work. Excellent work guys! 

## Features

So what is so special about the DeMoN II cartridge, and how does it compare against an original Action Replay 3 and the original DeMoN cartridge?
In a nutshell:

| FEATURE | Action Replay 3 | DeMoN Cartridge | DeMoN II Cartridge
|---------|----------|----------|----------|
| ROM size | 256kb | 256kb | 256kb |
| ROM type | Static | Flashable | Flashable |
| RAM size | 40kb | 1mb | 1mb |
| Number of Tools | Loads | Even more! | MORE!!! |
| Ramdisk? | No | Optional | Optional |
| Detection | Always hidden | Can be visible | Can be visible |
| Ability toggle? | Always On | Optional | Optional |
| USB-C port | No | No | Yes |
| Amiga <--> PC File Transfer Ability? | No | Yes | Yes |

Other features of the DeMoN II cartridge:

* **Backwards Compatibility** - The DeMoN firmware has also been designed to work with the original Action Replay 3 hardware and it is also supported in WinUAE. 
* **DeMoN Detection** - The user has the option whether the DeMoN can be "seen" by the Amiga, peripherals etc. **IMPORTANT! Don't toggle this jumper whilst powered on!**
* **DeMoN Ability** - DeMoN has the option to be "On" or "Off". **IMPORTANT! Don't toggle this jumper whilst powered on!**
* **Keyboard Layouts** - New keyboard layouts to cater for the United Kingdom and Italian language have been added. 
* **Serial Communication** - The DeMoN allows serial communications, but this is currently a Work In Progress. Tests have successfully sent and received files between Amiga and PC. 
* **Extra Tools** - The DeMoN cartridge contains all the commands from the Action Replay 3 cartridge and the Aktion Replay 4 software. Further to this, several bugs have been fixed. Too many to list here, but a few DeMoN specific commands that have been added are:
  * flash: Used to upgrade firmware.
  * r: This is the ramdisk. It can be accessed using R: as the drive in any of the file tools within the DeMoN console.
  * savecfg: Save your current config to the cartridge.
  * resetcfg: Set config to default.
  * axfer: Sets up the Amiga to use AmigaXfer without the need of a floppy.
  * rfy, sfy: Send and receive files via Y-Modem (currently a Work In Progress). 
  * ...plus many, many more!
  #tk#

See the [manual](https://github.com/dmcoles/ActionReplay5/blob/main/Action%20Replay%205%20Manual.pdf) for a full list of commands available.


## Compatibility

DeMoN II cart is only compatible with A500 and A500+ computers.

Tested and works with chipsets:
 * 68010
 * TF536 (68030)

It has been tested on the following kickstarts:
 * 1.3
 * 2.04
 * 2.05
 * 3.0
 * 3.1
 * 3.x
 * 3.1.4
 * 3.2.x

It is also compatible with any memory expansions and disk controllers.

Tested and works with:
 * 8MB GottaGoFastRam
 * GVP Impact A2000-HC+8 Series II

We are currently working on expanding this, so watch this space!



## DeMoN II User Manual

A user manual for the DeMoN/Action Replay 5 has been written and can be found on REbEL's [Action Replay 5](https://github.com/dmcoles/ActionReplay5) repo.
A direct link to the manual can be found [here](https://github.com/dmcoles/ActionReplay5/blob/main/Action%20Replay%205%20Manual.pdf).



## Build Your Own DeMoN II Cartridge

If you want to build your own then you will need the following:
* Soldering Iron
* Solder
* Tweezers
* ESD wrist strap
* A flat surface to solder on (such as a soldering mat on a desk, NOT the arm of a sofa or your partner's back)
* Other soldering related tools and devices, you know the drill.

In this project you can find the KiCad files that are used to build the PCBs for the project, along with the [Bill of Materials](https://github.com/gerbilbyte/DeMoN2/tree/main/Kicad) (BOM) required for each build.
To make things even easier, Gerber files have also been included that you can use to send directly to your favourite freindly, or unfriendly, PCB manufacturer.


![image](https://github.com/user-attachments/assets/1ab1fce4-e291-4f5c-9552-6078dac785b3)

Follow this link to build the [DeMoN II](https://github.com/gerbilbyte/DeMoN2/tree/main/Kicad/DeMoN_2.0_PLCC)

I actually don't need to write any more about how to build one, the rest is quite straight forward.


### Firmware.

Once built, your cartridge will now need firmware.

#### CLPD
The CLPD will also need to be programmed, and this can be done using a seperate programmer such as an ATF Programmer (Details of the AFT that we used can be found at the bottom of this repo).
The CLPD can be programmed with the [DeMoN.jed](https://github.com/gerbilbyte/DeMoN2/blob/main/Quartus/output_files/DeMoN.jed) file that can be found in the folder [here](https://github.com/gerbilbyte/DeMoN2/blob/main/Quartus/output_files).

#### DeMoN II ROM
This repo does not contain firmware, but it does contain a patch file that can be used to patch the original Action Replay III (version 3.17) ROM.
Tools are included with instructions in this repo on how to patch an Action Replay III ROM file.

Due to changes in hardware, the DeMoN II firmware will not work with the original DeMoN or Action Replay 3/5 cart. From versions 5.2.0 onwards, DeMoN II firmware will be packaged in the same release archive as the Action Replay 5 firmware found on REbEL's GitHub repo which can be found [here](https://github.com/dmcoles/ActionReplay5).


### Flashing.

#### **Flashing using a chip programmer**

All tools required for flashing can be found in the FirmwareTools folder of this repo.
To prepare the firmware for the flash chips the following steps can be taken:
* Prepare the firmware by using the patchfile and the AR3 image to obtain the firmware:

   ```python3 DeMoNpatcher.py <AR3rom file> <DeMoNpatch file>```

* Split the file to be used for programming the chips. The obtained files are self descriptive:

   ```python3 firmwareSplitter.py <input_file>```

* Power-cycle the Amiga.
And that's it! Enjoy the cartridge! :)


#### **Flashing using the stand-alone flash tool**

All tools required for stand-alone flashing - along with detailed instruction on how to use it - can be found in the Standalone Flash Tool folder of this repo.
But in a nutshell, the process is as follows:
* Set JP1 on the DeMoN to pins 2-3 to make the DeMoN memory visible to the Amiga.
* Set JP2 on the DeMoN to pins 2-3 to functionally deactivate the DeMoN.
* Prepare an Amiga floppy disk that includes a standard bootblock (without starup-sequence), the ar5flasher tool and also the firmware
* Load disk and enter the following command, following any futher on screen instructions:

   ```ar5flasher firmware.rom```

* Power-cycle the Amiga.
And that's it! Enjoy the cartridge! :)


#### **Flashing using the FLASH tool on DeMoN**
All that is needed for this method is the firmware on a floppy disk.
* Set JP1 on the DeMoN to pins 2-3 to make the DeMoN memory visible to the Amiga.
* Copy the firmware onto a floppy, and insert it into the drive.
* Press DeMoN freeze button.
* At the console type in the following command, following any futher on screen instructions:

   ```flash firmware.rom```

   The flashing and verifying will take place. After verifying, the screen will change colour to match one of the following conditions:
  
   Red = Failed flash. An error has happened causing the checksums of the firmware file and the on-board firmware to differ.

   Green = Successful flash!
* Power-cycle the Amiga.
And that's it! Enjoy the cartridge! :)


### Cartridge Case.
The case:

![image](https://github.com/user-attachments/assets/d45c8bf2-c362-421a-aed6-7b5a509b44b4)


A case dedicated to DeMoN has been created and can be found [here](https://www.printables.com/model/1307217-amiga-demon-action-replay-5-case). STEP and STL files for this can be found in this repo [here](https://github.com/gerbilbyte/DeMoN/tree/main/3Dcase).


### License

This work is licensed under a Creative Commons Attribution 4.0 International License. See [https://creativecommons.org/licenses/by/4.0/](https://creativecommons.org/licenses/by/4.0/).


## Related Projects.

**REbEL**, the author of the DeMoN firmware has an open project (Action Replay 5) that can be found [here](https://github.com/dmcoles/ActionReplay5). This repo contains firmware that can be used in WinUAE as well as DeMoN. These will be up-to-date and more stable, including source code. His main github page can be found [here](https://github.com/dmcoles).

**na103**, who reverse engineered the Action Replay 3, has posted his project here. This repo contains several versions of the Action Replay 3 for different ROM footprints. His main github page can be found [here](https://github.com/na103).

**Fongo**, the creator of the Action Replay Replica and DeMoN Cases. His Printables page can be found [here](https://www.printables.com/@fongo2k_2502418).

The ATF150x programmer needed to program the CPLD can be found [here](https://github.com/roscopeco/atfprog-hardware).
