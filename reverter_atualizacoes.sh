#!/bin/bash

# Versões anteriores
DRM_VERSION="2.4.121+git2406250500.b7338f~oibaf~j"
MESA_VERSION="24.2~git2406250600.5cb15a~oibaf~j"

# Reverter pacotes libdrm
sudo apt-get install -y libdrm-common=$DRM_VERSION libdrm2:amd64=$DRM_VERSION libdrm2:i386=$DRM_VERSION libdrm-amdgpu1:i386=$DRM_VERSION libdrm-amdgpu1:amd64=$DRM_VERSION libdrm-intel1:amd64=$DRM_VERSION libdrm-intel1:i386=$DRM_VERSION libdrm-nouveau2:amd64=$DRM_VERSION libdrm-radeon1:i386=$DRM_VERSION libdrm-radeon1:amd64=$DRM_VERSION

# Reverter pacotes mesa
sudo apt-get install -y libegl-mesa0:amd64=$MESA_VERSION libgbm1:amd64=$MESA_VERSION libgbm1:i386=$MESA_VERSION libgl1-mesa-dri:i386=$MESA_VERSION libgl1-mesa-dri:amd64=$MESA_VERSION libosmesa6:i386=$MESA_VERSION libosmesa6:amd64=$MESA_VERSION libglx-mesa0:i386=$MESA_VERSION libglx-mesa0:amd64=$MESA_VERSION libglapi-mesa:amd64=$MESA_VERSION libglapi-mesa:i386=$MESA_VERSION libxatracker2:amd64=$MESA_VERSION

# Segurar pacotes para evitar atualizações futuras automáticas
sudo apt-mark hold libdrm-common libdrm2:amd64 libdrm2:i386 libdrm-amdgpu1:i386 libdrm-amdgpu1:amd64 libdrm-intel1:amd64 libdrm-intel1:i386 libdrm-nouveau2:amd64 libdrm-radeon1:i386 libdrm-radeon1:amd64 libegl-mesa0:amd64 libgbm1:amd64 libgbm1:i386 libgl1-mesa-dri:i386 libgl1-mesa-dri:amd64 libosmesa6:i386 libosmesa6:amd64 libglx-mesa0:i386 libglx-mesa0:amd64 libglapi-mesa:amd64 libglapi-mesa:i386 libxatracker2:amd64

echo "Pacotes revertidos e marcados para não serem atualizados automaticamente."
