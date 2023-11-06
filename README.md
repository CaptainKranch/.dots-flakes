
<h2 align="center">:snowflake: CaptainKranch's Nix Config :snowflake:</h2>


<p align="center">
	<a href="https://github.com/CaptainKranch/.dots-flakes/stargazers">
		<img alt="Stargazers" src="https://img.shields.io/github/stars/ryan4yin/nix-config?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41"></a>
    <a href="https://nixos.org/">
        <img src="https://img.shields.io/badge/NixOS-23.05-informational.svg?style=for-the-badge&logo=nixos&color=F2CDCD&logoColor=D9E0EE&labelColor=302D41"></a>
    <a href="https://github.com/ryan4yin/nixos-and-flakes-book">
        <img src="https://img.shields.io/static/v1?label=Nix Flakes&message=learning&style=for-the-badge&logo=nixos&color=DDB6F2&logoColor=D9E0EE&labelColor=302D41"></a>
  </a>
</p>

## Preview
<div align="center">
   <p></p>
   <a href="">
      <img src="https://github.com/CaptainKranch/.dots-flakes/blob/main/_img/11-05-2023-193801.png?raw=true">
   </a>
</div>


This repository is home to the nix code that builds my systems.

## Why Nix?

Nix allows for easy-to-manage, collaborative, reproducible deployments. This means that once something is setup and configured once, it works forever. If someone else shares their configuration, anyone can make use of it.

**Want to know Nix in detail? Looking for a beginner-friendly tutorial or best practices? Check out [NixOS & Nix Flakes Book - 🛠️ ❤️ An unofficial & opinionated :book: for beginners](https://github.com/ryan4yin/nixos-and-flakes-book)!**

> If you're using macOS, you can also check out [ryan4yin/nix-darwin-kickstarter](https://github.com/ryan4yin/nix-darwin-kickstarter) for a quick start.

## Components
|                 |                                             PC                                              |
| :-------------: | :-------------------------------------------------------------------------------------------: |
|       OS        |                                  [NixOS](https://nixos.org/)                                  |
| WM / Compositor |                       [dwm](https://dwm.suckless.org/)                       |
|    Terminal     |                      [kitty](https://github.com/kovidgoyal/kitty)                      |
|     Editor      |                      [Neovim](https://github.com/neovim/neovim)  |
|  File Manager   |                          [Pcmanfm](https://github.com/lxde/pcmanfm)                           |


## :snowflake: <samp>Information</samp>
NixOS is a unique Linux distribution that employs an advanced package management system called Nix. With Nix, users can install and update software packages in isolated environments, enabling them to securely install multiple versions of software simultaneously.

In NixOS, dotfiles are akin to dotfiles found in other Unix-based operating systems, but they differ in that they use Nix expressions to organize system and application configurations. Nix expressions are configuration files that are written in Nix syntax, which can be used to define, install, and configure software packages, services, and other system components in NixOS.

By utilizing Nix expressions to organize dotfiles, NixOS provides an efficient and reliable way to manage configurations, allowing for easy reproducibility, version control, and consistent setups across multiple machines. Additionally, this approach provides a modular system that enables users to share, reuse, and modify their configurations easily.

For new users, it's important to note that the learning curve for NixOS can be steep, as it requires a different approach to package management and system configuration compared to other Linux distributions. However, with the benefits it offers, many users find it worth the effort to learn.

Typically, NixOS dotfiles consist of a collection of Nix expressions and scripts used to configure the system and applications.

There are several advantages to using NixOS as an operating system:

   1. Reproducibility: Every package and dependency in NixOS is installed in an isolated environment, ensuring the right version is installed for the user's needs. Additionally, installations can be easily reproduced on other machines.

   2. Consistent configuration: NixOS stores the operating system configuration in a centralized Nix configuration file, ensuring consistent setup on other machines.

   3. Rollback: NixOS keeps a copy of every configuration change, making it easy to rollback to the previous configuration if a problem occurs.

   4. Modularity: The Nix package manager and flake feature allow users to organize and prepare configurations as reusable packages or modules, making it easy to install new applications or change system configurations.

   5. Easy application management: Applications and dependencies are installed in isolated environments, making it easy to install and remove applications without disrupting other system components.

   6. Active community: The NixOS community is friendly and active, providing support and solutions for troubleshooting.

In summary, NixOS is a highly modular and consistent operating system that offers users complete control over their system configuration. It's an excellent choice for users who want to ensure reproducibility, consistency, and easy management of their software installations, but it does require a learning curve. However, many users find it worth the effort due to its benefits.

<br>
<br>

## :wrench: <samp>Installation</samp>

I highly recommend creating your own configurations based on these dotfiles. Use this repository as a reference to customize your setup according to your preferences and requirements. Please note that these dotfiles were created for my specific hardware configuration, so use them at your own risk.

But anyway… let's move on to the installation process!

1. Download minimal iso

2. Boot into the installer.

3. Switch to root user: `sudo su -`

4. Partitioning

   We create a 512MB EFI boot partition (`/dev/sda3`), 2GB swap partition on (`/dev/sda2`) and the rest will be our filesystem (`/dev/sda1`). `replace sda* with your disk name - use lsblk`

   Format disk as gpt

   ```bash
   $ parted /dev/sda -- mklabel gpt
   ```

   Make the above mentioned partitions:

   ```bash
   $ parted /dev/sda -- mkpart primary 512MiB -2GiB
   $ parted /dev/sda -- mkpart primary linux-swap -2GiB 100%
   $ parted /dev/sda -- mkpart ESP fat32 1MiB 512MiB
   $ parted /dev/sda -- set 3 esp on
   ```

   Assing the partitions the respective types. (`/dev/sda1 type = btrfs label = root`), (`/dev/sda2 type = swap label = swap`), (`/dev/sda3 type = efiboot label = boot`). Labelling will later help in hardware-config.nix

   ```bash
   $ mkfs.btrfs -L root /dev/sda1 -f
   $ mkswap -L swap /dev/sda2
   $ mkfs.fat -F 32 -n boot /dev/sda3
   ```

   Mount partitions

   ```bash
   $ mount -t btrfs -o compress=zstd,noatime,ssd,space_cache=v2 /dev/sda1 /mnt
   $ mkdir -p /mnt/boot
   $ mount /dev/disk/by-label/boot /mnt/boot
   $ swapon /dev/sda2
   ```

5. Enable git

   ```bash
   $ nix-env -iA nixos.git
   ```

6. Clone the repo

   ```bash
   $ cd
   $ git clone https://github.com/CaptainKranch/.dotfiles.git
   $ cd dotfiles
   $ cp NicheOS/* /etc/nixos/
   $ nixos-rebuild switch
   ```

8. Post install

   - After install check / match hardware-configuration.nix. Make sure or edit the disk/by-uuid to disk/by-label/ like it is in this repo for reproductable build.
   - passwd danielgm(`your username, must edit it in the repo for using your own name`)

<br>
<br>

## :bulb: <samp>Acknowledgements</samp>

<table align="right">
  <tr>
    <th align="center">
      <sup><sub>:warning: WARNING :warning:</sub></sup>
    </th>
  </tr>
  <tr>
    <td align="center">
        <sup><sub><samp>It worked perfectly on my machine, but I can't guarantee it will work on your machine</samp></sub></sup>
    </td>
  </tr>
  <tr>
    <td align="center">
      <a href="https://nixos.wiki/wiki/Overview_of_the_NixOS_Linux_distribution">
        <sup><sub><samp>Powered by NixOS/Linux x86_64</samp></sub></sup>
      </a>
    </td>
  </tr>
</table>

**Thanks to all these amazing people**

- [rxyhn](https://github.com/rxyhn)
- [sioodmy](https://github.com/sioodmy/dotfiles)
- [ryan4yin](https://github.com/ryan4yin)

</div>
