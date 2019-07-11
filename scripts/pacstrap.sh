# Set mirror list

MIRRORLIST_PATH="/etc/pacman.d/mirrorlist"
chroot='arch-chroot /mnt'

function make_jp_mirrorlist(){
    mirror_file=$1
    cat <<'...' >"${mirror_file}"
## Japan
Server = http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/$repo/os/$arch
Server = http://ftp.jaist.ac.jp/pub/Linux/ArchLinux/$repo/os/$arch
...
}

make_jp_mirrorlist "${MIRRORLIST_PATH}"

pacstrap /mnt base base-devel net-tools openssh dhcpcd

make_jp_mirrorlist "/mnt${MIRRORLIST_PATH}"

yay_repo="https://github.com/Jguer/yay"
yay_latest=$(curl -i ${yay_repo}/releases/latest | grep Location | cut -d'v' -f 2 | tr -d '\n\r')
wget ${yay_repo}/releases/download/v${yay_latest}/yay_${yay_latest}_x86_64.tar.gz 
tar xzvf yay_${yay_latest}_x86_64.tar.gz
mv yay_${yay_latest}_x86_64 /mnt/var/tmp
$chroot /var/tmp/yay_${yay_latest}_x86_64/yay -Sy yay-bin

# make boot-loader
if [ -e '/sys/firmware/efi/efivars' ] ; then
    # EFI
    $chroot pacman -S --noconfirm grub dosfstools efibootmgr
    $chroot grub-install \
        --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch_grub \
        --force --recheck /dev/sda
    $chroot grub-mkconfig -o /boot/grub/grub.cfg
    $chroot mkdir -p /boot/EFI/boot
    $chroot cp /boot/EFI/arch_grub/grubx64.efi  /boot/EFI/boot/bootx64.efi
else
    # BIOS
    $chroot pacman -S --noconfirm grub
    $chroot grub-install \
        --force --recheck /dev/sda
    $chroot grub-mkconfig -o /boot/grub/grub.cfg
fi
genfstab -p /mnt >> /mnt/etc/fstab
