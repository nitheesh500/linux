Linux booting is literally a road trip 😎🚗

🚗 Car Journey Analogy + Linux Reality

### 🔌 POST = Car Dashboard CheckUp 🩺\
- Like your car lights checking everything before driving 🚗\
- 👉 Verifies CPU, RAM, Storage, Devices

### 👨‍✈️ BIOS = Driver Choosing Which Road to Start\
- Driver decides from where to begin the journey\
- 👉 Selects the bootable disk

📍 MBR = Starting Point Signboard
- Before driving, you first reach the starting road point
- 👉 Points to Bootloader & hands control

### 🚦 GRUB = Navigation Guide
- Navigation asks:

	- ➡️ Which route?
	- ➡️ Which destination?

- 👉 Shows OS menu → Loads selected OS
- 👉 Loads Kernel + initramfs into memory

### 🧠 Kernel = Engine On
- Engine starts and the car becomes alive
- 👉 Kernel controls CPU, RAM, devices & system operations

### 🧰 initramfs = Mechanic Helping Before Driving
- Before you fully start driving, a mechanic ensures:
	- ✔️ Wheels OK
	- ✔️ Fuel connected
	- ✔️ Systems ready

- 👉 Helps Kernel load drivers
- 👉 Helps Kernel find real OS
- 👉 Helps mount Root Filesystem /

### 🏠 RootFS = Reaching the Real City
- Now you actually reach the city where life exists 🏙️
- 👉 Real Linux filesystem becomes active
- 👉 Actual OS files available

### 👑 systemd = City Manager
- Now the city starts functioning:
	- ✔️ Traffic lights
	- ✔️ Electricity
	- ✔️ Services
	- ✔️ Security

- 👉 Starts services
- 👉 Networking
- 👉 Login programs
- 👉 GUI / CLI environments

### 👤 Login = You Start Driving
- Finally, YOU take the wheel
- 👉 You log in
- 👉 System ready 🎉


# In Detail


## 1.🔌 POST (Power-On Self-Test) 

Runs as soon as you power on the computer — like a car’s dashboard check 🚗. It verifies:
🧠 CPU = Engine • ⛽ RAM = Fuel System • 🛞 Storage = Wheels • 🎮 Graphics/Keyboard = Controls

✔️ If everything is fine → it informs BIOS/UEFI to continue the boot process toward MBR → Bootloader (GRUB)

❌ If something fails → the system stops and shows errors or beep sounds 🚨


## 2. BIOS → Finds the Disk That Has the OS  

 1️⃣ Initialize Hardware like CPU, RAM, STORAGE(HDD,SSD)  
 2️⃣ Run POST (Power-On Self-Test)  
 3️⃣ Find Bootable Device  

👉 “From which device should I start the computer?”

It looks in order:
	SSD
	HDD
	USB
	Network

Once it finds the device that has OS, it says:
👉 “Okay, I will start from this disk.”

On that selected disk, BIOS goes to:
 📍 Sector 0 (first 512 bytes)
This place is called MBR (Master Boot Record)

Now BIOS hands control to the MBR.

## 3.📍 MBR / GPT → Finds Bootloader

Its main job is to call (start) the Bootloader 

⚙️ What does MBR contain?

That 512 bytes is divided like this:

	| Part             | Size       | Meaning         |
	|------------------|------------|-----------------|
	| Bootloader Code  | 446 bytes  | Tiny program    |
	| Partition Table  | 64 bytes   | Info about partitions |
	| Boot Signature   | 2 bytes    | Must be 0x55AA  |

- MBR runs its tiny boot code.
- That code finds the bootloader.
- Then it starts the bootloader.


It does NOT load OS.
It ONLY helps to reach bootloader.

👉 MBR hands control to the Bootloader(GRUB)

## 3️⃣🚦  GRUB (Bootloader) → Loads OS

GRUB checks its config file to know:

- What OS entries are available
- Which one is default
- Timeout settings

✔️ Shows OS menu (if multiple OS exist)
- If system has:
  - ✔️ Only 1 OS → GRUB normally loads it directly
  - ✔️ More than 1 OS → GRUB shows menu like:

	1. Linux
	2. Windows
	3. Recovery Mode

The user can manually choose which OS to load.

✔️ If the user does not select anything:

	- GRUB waits for configured timeout (for example, 5–10 seconds)
	- After the timeout, GRUB automatically loads the default OS defined in its configuration

✔️ GRUB then loads the Kernel (the core of the OS)
✔️ Kernel starts and takes control of the system

📌 So GRUB = the real decision maker & OS starter

Bootloader does 2 things:

- 1️⃣ Loads Kernel into memory
- 2️⃣ Loads initrd image into memory

❓ At this moment

We have TWO things sitting in RAM:
✔ Kernel
✔ initrd image

But NOTHING is running yet.


## 4️⃣ 🧠 Kernel — The Real Brain of the Operating System


Kernel is the core of the Operating System.
After GRUB loads the Kernel into RAM and gives control:

Immediately Kernel:

- Takes control of CPU

- Takes control of RAM

- Prepares memory management

- Starts device handling

- Gets ready to run Linux programs

So now your Linux OS is actually “alive”, but not usable yet.

❌ But the Kernel Alone Cannot Do Everything

The Kernel needs initrd because it cannot directly access your hard disk, SSD, LVM, or encrypted partitions without help.

So the Kernel still needs temporary help to setup :

- 🔌 Drivers (for hardware communication)
- 💾 Storage access (to read disk data)
- 📁 Filesystem support (to understand file structure)


And that temporary helper is initrd(Initial RAM Disk - older) / initramfs(Initial RAM Filesystem - new method)

## 5️⃣ 🧰 Initramfs — The Temporary Helper Before Real OS Starts

⚙️ What does Initramfs do?

- 1️⃣ Provides Drivers  
   - It gives Kernel the drivers needed to access  
    - 💽 Disk   
    	- ⚡💽 SSD  
    	- 🚀💽 NVMe  
	- 🎛️ Storage Controllers  
	- 📂 Filesystems
- 2️⃣ Detects and Prepares Storage    
    - ✔️ Which disk has the OS  
	- ✔️ Which partition has / root filesystem 

- 3️⃣ only helps Kernel mount the MAIN Root Filesystem /
But your Linux system has many more filesystems that are NOT mounted yet.  
 
	 
🚀 After its job is done, It hands control back to Kernel  

## 6️⃣ RootFS

1️⃣ Kernel mounts the REAL Root Filesystem (RootFS)\
(So now the real Linux OS files are available)

2️⃣ Kernel then looks for the init program in RootFS  

Kernel tries to find one of these (in this order):
```
/sbin/init
/usr/sbin/init
/bin/init
/systemd
```

3️⃣ Kernel EXECUTES init nothing but systemd
This becomes:  
- 🆔 PID = 1 (first user-space process)
- On modern Linux /sbin/init = systemd

## 7️⃣ 🏗️ What systemd Does Next?	

1️⃣ Initializes Core Userspace Environment  
- Takes control as PID 1

2️⃣ Mounts Remaining Filesystems

- Even though Kernel + initramfs mounted /, other filesystems still need to be mounted.

  - systemd mounts:
	- /proc
	- /sys
	- /dev
	- /run  

3️⃣ Starts System Services (Daemons)  

systemd starts essential services in correct order based on dependencies:

Examples:

- Networking services
- Logging services (journald / rsyslog)
- Storage services
- Display manager (for GUI)
- SSH
- Background system daemons