project(
  'libHSL',
  'c',
  version: '4.0.0',
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
                 sources : 'libhsl.c',
                 install : true)
