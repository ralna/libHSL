# julia --color=yes build_tarballs_metis.jl targets --verbose --debug --deploy="local" <-- Generate the JLL package in `~/.julia/dev/`
# julia --color=yes build_tarballs_metis.jl targets --verbose --debug --deploy="amontoison/HSL_jll.jl" <-- Generate and upload the JLL package to `https://github.com/amontoison/HSL_jll.jl`
# You must create a private GitHub repository before because HSL is not open source!
#
# Platforms:
#   - aarch64-linux-gnu
#   - aarch64-linux-musl
#   - armv6l-linux-gnueabihf
#   - armv6l-linux-musleabihf
#   - armv7l-linux-gnueabihf
#   - armv7l-linux-musleabihf
#   - i686-linux-gnu
#   - i686-linux-musl
#   - i686-w64-mingw32
#   - powerpc64le-linux-gnu
#   - x86_64-apple-darwin
#   - x86_64-linux-gnu
#   - x86_64-linux-musl
#   - x86_64-unknown-freebsd
#   - x86_64-w64-mingw32
#
# Targets:
#   - platform-libgfortran3
#   - platform-libgfortran4
#   - platform-libgfortran5
#
# Note: We can determine our platform and the relevant "libgfortran" with `Base.BinaryPlatforms.host_triplet()`.
#
# Examples:
# julia --color=yes build_tarballs.jl x86_64-linux-gnu-libgfortran5 --debug --verbose --deploy="amontoison/HSL_jll.jl"
# julia --color=yes build_tarballs.jl x86_64-linux-gnu-libgfortran5,x86_64-apple-darwin-libgfortran4,aarch64-apple-darwin-libgfortran5 --deploy="amontoison/HSL_jll.jl"
using BinaryBuilder, Pkg

name = "HSL"
version = v"1.0.0"

# Collection of sources required to complete build
sources = [ 
    DirectorySource("./dummy")
]

# Bash recipe for building across all platforms
script = raw"""
cd $WORKSPACE/srcdir/

meson setup builddir --cross-file=${MESON_TARGET_TOOLCHAIN} --buildtype=release --default-library=shared --prefix=$prefix
meson compile -C builddir
meson install -C builddir
"""

# These are the platforms we will build for by default, unless further
# platforms are passed in on the command line
platforms = supported_platforms()
platforms = expand_gfortran_versions(platforms)
# platforms = [HostPlatform()]  # If we want to compile JuliaHSL only for our own platform

products = [
    LibraryProduct("libhsl", :libhsl),
]

# Dependencies that must be installed before this package can be built
dependencies = [
    Dependency(PackageSpec(name="METIS_jll", uuid ="d00139f3-1899-568f-a2f0-47f597d42d70")),
    Dependency(PackageSpec(name="CompilerSupportLibraries_jll", uuid="e66e0078-7015-5450-92f7-15fbd957f2ae")),
    # Dependency(PackageSpec(name="MPICH_jll", uuid="7cb0a576-ebde-5e09-9194-50597f1243b4"); platforms=filter(!Sys.iswindows, platforms)),
    # Dependency(PackageSpec(name="MicrosoftMPI_jll", uuid="9237b28f-5490-5468-be7b-bb81f5f5e6cf"); platforms=filter(Sys.iswindows, platforms)),
    Dependency(PackageSpec(name="OpenBLAS32_jll", uuid="656ef2d0-ae68-5445-9ca0-591084a874a2"), platforms=filter(Sys.iswindows, platforms)),
    Dependency(PackageSpec(name="libblastrampoline_jll", uuid="8e850b90-86db-534c-a0d3-1478176c7d93"), platforms=filter(!Sys.iswindows, platforms))
]

# Build the tarballs, and possibly a `build.jl` as well.
build_tarballs(ARGS, name, version, sources, script, platforms, products, dependencies; preferred_gcc_version=v"9", julia_compat="1.8")
