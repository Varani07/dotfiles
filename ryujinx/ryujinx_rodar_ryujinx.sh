#!/bin/bash

cd ryujinx_portable/publish
DXVK_FRAME_RATE=45 firejail --noprofile --net=none prime-run ./Ryujinx
