# Generated by Neurodocker and Reproenv.

FROM debian:bullseye-slim
ENV FSLDIR="/opt/fsl-6.0.6.4" \
    PATH="/opt/fsl-6.0.6.4/bin:$PATH" \
    FSLOUTPUTTYPE="NIFTI_GZ" \
    FSLMULTIFILEQUIT="TRUE" \
    FSLTCLSH="/opt/fsl-6.0.6.4/bin/fsltclsh" \
    FSLWISH="/opt/fsl-6.0.6.4/bin/fslwish" \
    FSLLOCKDIR="" \
    FSLMACHINELIST="" \
    FSLREMOTECALL="" \
    FSLGECUDAQ="cuda.q"
RUN apt-get update -qq \
    && apt-get install -y -q --no-install-recommends \
           bc \
           ca-certificates \
           curl \
           dc \
           file \
           libfontconfig1 \
           libfreetype6 \
           libgl1-mesa-dev \
           libgl1-mesa-dri \
           libglu1-mesa-dev \
           libgomp1 \
           libice6 \
           libopenblas-base \
           libxcursor1 \
           libxft2 \
           libxinerama1 \
           libxrandr2 \
           libxrender1 \
           libxt6 \
           nano \
           python3 \
           sudo \
           wget \
    && rm -rf /var/lib/apt/lists/* \
    && echo "Installing FSL ..." \
    && curl -fsSL https://fsl.fmrib.ox.ac.uk/fsldownloads/fslconda/releases/fslinstaller.py | python3 - -d /opt/fsl-6.0.6.4 -V 6.0.6.4
ENV OS="Linux" \
    PATH="/opt/freesurfer-7.2.0/bin:/opt/freesurfer-7.2.0/fsfast/bin:/opt/freesurfer-7.2.0/tktools:/opt/freesurfer-7.2.0/mni/bin:$PATH" \
    FREESURFER_HOME="/opt/freesurfer-7.2.0" \
    FREESURFER="/opt/freesurfer-7.2.0" \
    SUBJECTS_DIR="/opt/freesurfer-7.2.0/subjects" \
    LOCAL_DIR="/opt/freesurfer-7.2.0/local" \
    FSFAST_HOME="/opt/freesurfer-7.2.0/fsfast" \
    FMRI_ANALYSIS_DIR="/opt/freesurfer-7.2.0/fsfast" \
    FUNCTIONALS_DIR="/opt/freesurfer-7.2.0/sessions" \
    FS_OVERRIDE="0" \
    FIX_VERTEX_AREA="" \
    FSF_OUTPUT_FORMAT="nii.gz# mni env requirements" \
    MINC_BIN_DIR="/opt/freesurfer-7.2.0/mni/bin" \
    MINC_LIB_DIR="/opt/freesurfer-7.2.0/mni/lib" \
    MNI_DIR="/opt/freesurfer-7.2.0/mni" \
    MNI_DATAPATH="/opt/freesurfer-7.2.0/mni/data" \
    MNI_PERL5LIB="/opt/freesurfer-7.2.0/mni/share/perl5" \
    PERL5LIB="/opt/freesurfer-7.2.0/mni/share/perl5"
RUN apt-get update -qq \
    && apt-get install -y -q --no-install-recommends \
           bc \
           ca-certificates \
           curl \
           libgomp1 \
           libxmu6 \
           libxt6 \
           perl \
           tcsh \
    && rm -rf /var/lib/apt/lists/* \
    && echo "Downloading FreeSurfer ..." \
    && mkdir -p /opt/freesurfer-7.2.0 \
    && curl -fL https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/7.2.0/freesurfer-linux-centos6_x86_64-7.2.0.tar.gz \
    | tar -xz -C /opt/freesurfer-7.2.0 --owner root --group root --no-same-owner --strip-components 1 \
         --exclude='average/mult-comp-cor' \
         --exclude='lib/cuda' \
         --exclude='lib/qt' \
         --exclude='subjects/V1_average' \
         --exclude='subjects/bert' \
         --exclude='subjects/cvs_avg35' \
         --exclude='subjects/cvs_avg35_inMNI152' \
         --exclude='subjects/fsaverage3' \
         --exclude='subjects/fsaverage4' \
         --exclude='subjects/fsaverage5' \
         --exclude='subjects/fsaverage6' \
         --exclude='subjects/fsaverage_sym' \
         --exclude='trctrain'
ENV ANTSPATH="/opt/ants-2.4.3/" \
    PATH="/opt/ants-2.4.3:$PATH"
RUN apt-get update -qq \
    && apt-get install -y -q --no-install-recommends \
           ca-certificates \
           curl \
           unzip \
    && rm -rf /var/lib/apt/lists/* \
    && echo "Downloading ANTs ..." \
    && curl -fsSL -o ants.zip https://github.com/ANTsX/ANTs/releases/download/v2.4.3/ants-2.4.3-centos7-X64-gcc.zip \
    && unzip ants.zip -d /opt \
    && mv /opt/ants-2.4.3/bin/* /opt/ants-2.4.3 \
    && rm ants.zip

# Save specification to JSON.
RUN printf '{ \
  "pkg_manager": "apt", \
  "existing_users": [ \
    "root" \
  ], \
  "instructions": [ \
    { \
      "name": "from_", \
      "kwds": { \
        "base_image": "debian:bullseye-slim" \
      } \
    }, \
    { \
      "name": "env", \
      "kwds": { \
        "FSLDIR": "/opt/fsl-6.0.6.4", \
        "PATH": "/opt/fsl-6.0.6.4/bin:$PATH", \
        "FSLOUTPUTTYPE": "NIFTI_GZ", \
        "FSLMULTIFILEQUIT": "TRUE", \
        "FSLTCLSH": "/opt/fsl-6.0.6.4/bin/fsltclsh", \
        "FSLWISH": "/opt/fsl-6.0.6.4/bin/fslwish", \
        "FSLLOCKDIR": "", \
        "FSLMACHINELIST": "", \
        "FSLREMOTECALL": "", \
        "FSLGECUDAQ": "cuda.q" \
      } \
    }, \
    { \
      "name": "run", \
      "kwds": { \
        "command": "apt-get update -qq\\napt-get install -y -q --no-install-recommends \\\\\\n    bc \\\\\\n    ca-certificates \\\\\\n    curl \\\\\\n    dc \\\\\\n    file \\\\\\n    libfontconfig1 \\\\\\n    libfreetype6 \\\\\\n    libgl1-mesa-dev \\\\\\n    libgl1-mesa-dri \\\\\\n    libglu1-mesa-dev \\\\\\n    libgomp1 \\\\\\n    libice6 \\\\\\n    libopenblas-base \\\\\\n    libxcursor1 \\\\\\n    libxft2 \\\\\\n    libxinerama1 \\\\\\n    libxrandr2 \\\\\\n    libxrender1 \\\\\\n    libxt6 \\\\\\n    nano \\\\\\n    python3 \\\\\\n    sudo \\\\\\n    wget\\nrm -rf /var/lib/apt/lists/*\\n\\necho \\"Installing FSL ...\\"\\ncurl -fsSL https://fsl.fmrib.ox.ac.uk/fsldownloads/fslconda/releases/fslinstaller.py | python3 - -d /opt/fsl-6.0.6.4 -V 6.0.6.4" \
      } \
    }, \
    { \
      "name": "env", \
      "kwds": { \
        "OS": "Linux", \
        "PATH": "/opt/freesurfer-7.2.0/bin:/opt/freesurfer-7.2.0/fsfast/bin:/opt/freesurfer-7.2.0/tktools:/opt/freesurfer-7.2.0/mni/bin:$PATH", \
        "FREESURFER_HOME": "/opt/freesurfer-7.2.0", \
        "FREESURFER": "/opt/freesurfer-7.2.0", \
        "SUBJECTS_DIR": "/opt/freesurfer-7.2.0/subjects", \
        "LOCAL_DIR": "/opt/freesurfer-7.2.0/local", \
        "FSFAST_HOME": "/opt/freesurfer-7.2.0/fsfast", \
        "FMRI_ANALYSIS_DIR": "/opt/freesurfer-7.2.0/fsfast", \
        "FUNCTIONALS_DIR": "/opt/freesurfer-7.2.0/sessions", \
        "FS_OVERRIDE": "0", \
        "FIX_VERTEX_AREA": "", \
        "FSF_OUTPUT_FORMAT": "nii.gz# mni env requirements", \
        "MINC_BIN_DIR": "/opt/freesurfer-7.2.0/mni/bin", \
        "MINC_LIB_DIR": "/opt/freesurfer-7.2.0/mni/lib", \
        "MNI_DIR": "/opt/freesurfer-7.2.0/mni", \
        "MNI_DATAPATH": "/opt/freesurfer-7.2.0/mni/data", \
        "MNI_PERL5LIB": "/opt/freesurfer-7.2.0/mni/share/perl5", \
        "PERL5LIB": "/opt/freesurfer-7.2.0/mni/share/perl5" \
      } \
    }, \
    { \
      "name": "run", \
      "kwds": { \
        "command": "apt-get update -qq\\napt-get install -y -q --no-install-recommends \\\\\\n    bc \\\\\\n    ca-certificates \\\\\\n    curl \\\\\\n    libgomp1 \\\\\\n    libxmu6 \\\\\\n    libxt6 \\\\\\n    perl \\\\\\n    tcsh\\nrm -rf /var/lib/apt/lists/*\\necho \\"Downloading FreeSurfer ...\\"\\nmkdir -p /opt/freesurfer-7.2.0\\ncurl -fL https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/7.2.0/freesurfer-linux-centos6_x86_64-7.2.0.tar.gz \\\\\\n| tar -xz -C /opt/freesurfer-7.2.0 --owner root --group root --no-same-owner --strip-components 1 \\\\\\n  --exclude='"'"'average/mult-comp-cor'"'"' \\\\\\n  --exclude='"'"'lib/cuda'"'"' \\\\\\n  --exclude='"'"'lib/qt'"'"' \\\\\\n  --exclude='"'"'subjects/V1_average'"'"' \\\\\\n  --exclude='"'"'subjects/bert'"'"' \\\\\\n  --exclude='"'"'subjects/cvs_avg35'"'"' \\\\\\n  --exclude='"'"'subjects/cvs_avg35_inMNI152'"'"' \\\\\\n  --exclude='"'"'subjects/fsaverage3'"'"' \\\\\\n  --exclude='"'"'subjects/fsaverage4'"'"' \\\\\\n  --exclude='"'"'subjects/fsaverage5'"'"' \\\\\\n  --exclude='"'"'subjects/fsaverage6'"'"' \\\\\\n  --exclude='"'"'subjects/fsaverage_sym'"'"' \\\\\\n  --exclude='"'"'trctrain'"'"'" \
      } \
    }, \
    { \
      "name": "env", \
      "kwds": { \
        "ANTSPATH": "/opt/ants-2.4.3/", \
        "PATH": "/opt/ants-2.4.3:$PATH" \
      } \
    }, \
    { \
      "name": "run", \
      "kwds": { \
        "command": "apt-get update -qq\\napt-get install -y -q --no-install-recommends \\\\\\n    ca-certificates \\\\\\n    curl \\\\\\n    unzip\\nrm -rf /var/lib/apt/lists/*\\necho \\"Downloading ANTs ...\\"\\ncurl -fsSL -o ants.zip https://github.com/ANTsX/ANTs/releases/download/v2.4.3/ants-2.4.3-centos7-X64-gcc.zip\\nunzip ants.zip -d /opt\\nmv /opt/ants-2.4.3/bin/* /opt/ants-2.4.3\\nrm ants.zip" \
      } \
    } \
  ] \
}' > /.reproenv.json
# End saving to specification to JSON.
