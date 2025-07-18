project(
  'libHSL',
  'c',
  'fortran',
  version: '4.0.4',
  default_options: [
    'buildtype=release',
    'libdir=lib',
    'default_library=shared',
  ],
)

# Header 
install_headers('libhsl.h')

# Library libhsl
libhsl = library('hsl',
                 sources : ['libhsl.c', 'ma27.f', 'ma57.f'],
                 install : true)
