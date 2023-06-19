project(
  'JuliaHSL',
  'fortran', 'c',
  version: '1.0.0',
)

libhsl_src = []
hsl_headers = []

subdir('fa14')
subdir('fd15')
subdir('hsl_ad02')
subdir('hsl_kb22')
subdir('hsl_ma48')
subdir('hsl_ma54')
subdir('hsl_ma57')
subdir('hsl_ma64')
subdir('hsl_ma77')
subdir('hsl_ma86')
subdir('hsl_ma87')
subdir('hsl_ma97')
subdir('hsl_mc34')
subdir('hsl_mc64')
subdir('hsl_mc65')
subdir('hsl_mc68')
subdir('hsl_mc69')
subdir('hsl_mc78')
subdir('hsl_mc80')
subdir('hsl_mi20')
subdir('hsl_mi28')
subdir('hsl_mi32')
subdir('hsl_mi35')
subdir('hsl_of01')
subdir('hsl_zb01')
subdir('juliahsl')
subdir('kb07')
subdir('la04')
subdir('la15')
subdir('ma27')
subdir('ma33')
subdir('ma48')
subdir('ma50')
subdir('ma51')
subdir('ma57')
subdir('ma61')
subdir('mc13')
subdir('mc20')
subdir('mc21')
subdir('mc22')
subdir('mc23')
subdir('mc29')
subdir('mc30')
subdir('mc34')
subdir('mc47')
subdir('mc59')
subdir('mc60')
subdir('mc61')
subdir('mc64')
subdir('mc71')
subdir('mc77')
subdir('mi21')
subdir('mi24')
subdir('mi26')
subdir('symbols')
subdir('zb01')
subdir('zd11')

# Header 
install_headers(hsl_headers)

# Fortran modules
meson.add_install_script(script_modules)

# Library libhsl
libhsl = library('hsl',
                 sources : libhsl_src,
                 install : true)
