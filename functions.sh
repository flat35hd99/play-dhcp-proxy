#!/bin/bash

## Define a function that create one VM with name given
## The first argument is name of virtual machine
function create_vm {
    local vm_name=$1

    # This command creates:
    # - RAM: 2GB
    # - CPU: 2cores
    # - HDD: 40GB
    # with kickstart file that is accessable from the VM created 
    sudo virt-install \
        --name $vm_name \
        --virt-type kvm \
        --ram 2048 \
        --vcpus 2 \
        --arch x86_64 \
        --os-variant detect=on \
        --boot hd \
        --disk size=40 \
        --network network=swataru-dhcp-net \
        --graphics vnc \
        --serial pty \
        --console pty \
        --location AlmaLinux-9.1-x86_64-minimal.iso \
        --extra-args "inst.ks=https://rd.taru.work/ksdev" \
        --noautoconsole \
        --wait=-1
}

function create_vm_using_pxe {
    local vm_name=$1

    # This command creates:
    # - RAM: 2GB
    # - CPU: 2cores
    # - HDD: 40GB
    # with kickstart file that is accessable from the VM created 
    sudo virt-install \
        --name $vm_name \
        --virt-type kvm \
        --ram 2048 \
        --vcpus 2 \
        --arch x86_64 \
        --os-variant detect=on \
        --disk size=40 \
        --network network=swataru-dhcp-net \
        --pxe \
        --hvm \
        --graphics vnc \
        --serial pty \
        --console pty \
        --noautoconsole \
        --wait=-1
}

