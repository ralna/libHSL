project(
  'hsl_subset',
  'c',
  'fortran',
  version: '4.0.4',
  default_options: [
    'buildtype=release',
    'libdir=lib',
    'default_library=shared',
  ],
)

# C and Fortran compilers
cc = meson.get_compiler('c')
fc = meson.get_compiler('fortran')
fc_compiler = find_program(fc.cmd_array())

# Preprocessing
if fc.get_id() == 'intel-cl' or fc.get_id() == 'intel-llvm-cl'
  output_generator = '/Fi:@OUTPUT@'
else
  output_generator = ['-o', '@OUTPUT@']
endif

pp_options = []
if fc.get_id() == 'gcc'
  pp_options += ['-cpp', '-E']
elif fc.get_id() == 'intel' or fc.get_id() == 'intel-llvm'
  pp_options += ['-fpp', '-P']
elif fc.get_id() == 'intel-cl' or fc.get_id() == 'intel-llvm-cl'
  pp_options += ['/fpp', '/P']
elif fc.get_id() == 'nagfor'
  pp_options += ['-fpp', '-F']
elif fc.get_id() == 'nvidia_hpc'
  pp_options += ['-Mcpp', '-F']
endif

# Options
build_quadruple = get_option('quadruple')

# hsl_subset
libhsl_subset_src = []
libhsl_subset_multi_src = []
libhsl_subset_f_src = []
libhsl_subset_f_multi_src = []
hsl_subset_headers = []
hsl_subset_include = include_directories('include')

libhsl_subset_src += files('hsl_kinds/hsl_kinds_real.f90',
                           'hsl_ad02/hsl_ad02r.f90',
                           'hsl_ma48/hsl_ma48r.f90',
                           'hsl_ma54/hsl_ma54r.f90',
                           'hsl_ma57/hsl_ma57r.f90',
                           'hsl_ma64/hsl_ma64r.f90',
                           'hsl_ma77/hsl_ma77r.f90',
                           'hsl_ma86/hsl_ma86r.f90',
                           'hsl_ma87/hsl_ma87r.f90',
                           'hsl_ma97/hsl_ma97r.f90',
                           'hsl_mc34/hsl_mc34r.f90',
                           'hsl_mc64/hsl_mc64r.f90',
                           'hsl_mc65/hsl_mc65r.f90',
                           'hsl_mc69/hsl_mc69r.f90',
                           'hsl_mc80/hsl_mc80r.f90',
                           'hsl_mi20/hsl_mi20r.f90',
                           'hsl_mi28/hsl_mi28r.f90',
                           'hsl_mi32/hsl_mi32r.f90',
                           'hsl_mi35/hsl_mi35r.f90',
                           'hsl_of01/hsl_of01r.f90',
                           'hsl_zb01/hsl_zb01r.f90',
                           'hsl_zd11/hsl_zd11r.f90',
                           'hsl_ma48/C/hsl_ma48r_ciface.f90',
                           'hsl_ma57/C/hsl_ma57r_ciface.f90',
                           'hsl_ma77/C/hsl_ma77r_ciface.f90',
                           'hsl_ma86/C/hsl_ma86r_ciface.f90',
                           'hsl_ma87/C/hsl_ma87r_ciface.f90',
                           'hsl_ma97/C/hsl_ma97r_ciface.f90',
                           'hsl_mc64/C/hsl_mc64r_ciface.f90',
                           'hsl_mi20/C/hsl_mi20r_ciface.f90',
                           'hsl_mi28/C/hsl_mi28r_ciface.f90')

libhsl_subset_multi_src += files('galahad/symbols.f90',
                                 'hsl_kinds/hsl_kinds.f90',
                                 'hsl_kb22/hsl_kb22l.f90',
                                 'hsl_mc68/hsl_mc68i.f90',
                                 'hsl_mc78/hsl_mc78i.f90',
                                 'hsl_of01/hsl_of01i.f90',
                                 'hsl_zb01/hsl_zb01i.f90',
                                 'hsl_mc68/C/hsl_mc68i_ciface.f90')

libhsl_subset_f_src += files('fa14/fa14r.f',
                             'fd15/fd15r.f',
                             'kb07/kb07r.f',
                             'la04/la04r.f',
                             'la15/la15r.f',
                             'ma27/ma27r.f',
                             'ma28/ma28r.f',
                             'ma30/ma30r.f',
                             'ma33/ma33r.f',
                             'ma57/ma57r.f',
                             'ma61/ma61r.f',
                             'mc13/mc13r.f',
                             'mc19/mc19r.f',
                             'mc20/mc20r.f',
                             'mc21/mc21r.f',
                             'mc22/mc22r.f',
                             'mc23/mc23r.f',
                             'mc24/mc24r.f',
                             'mc29/mc29r.f',
                             'mc30/mc30r.f',
                             'mc34/mc34r.f',
                             'mc47/mc47r.f',
                             'mc59/mc59r.f',
                             'mc60/mc60r.f',
                             'mc61/mc61r.f',
                             'mc64/mc64r.f',
                             'mc71/mc71r.f',
                             'mc77/mc77r.f',
                             'mi21/mi21r.f',
                             'mi24/mi24r.f',
                             'mi26/mi26r.f')

libhsl_subset_f_multi_src += files('kb07/kb07i.f')

hsl_subset_headers += files('include/hsl_ma48.h',
                            'include/hsl_ma57.h',
                            'include/hsl_ma77.h',
                            'include/hsl_ma86.h',
                            'include/hsl_ma87.h',
                            'include/hsl_ma97.h',
                            'include/hsl_mc64.h',
                            'include/hsl_mc68.h',
                            'include/hsl_mi20.h',
                            'include/hsl_mi28.h',
                            'include/hsl_precision.h')

gen_single = generator(fc_compiler,
                       output : 'single_int32_@BASENAME@.f90',
                       arguments : pp_options + '-DREAL_32' +
                                   ['-I', '@CURRENT_SOURCE_DIR@/include', '@INPUT@'] +
                                   output_generator)

gen_f_single = generator(fc_compiler,
                         output : 'single_int32_@BASENAME@.f',
                         arguments : pp_options + '-DREAL_32' +
                                     ['-I', '@CURRENT_SOURCE_DIR@/include', '@INPUT@'] +
                                     output_generator)

gen_double = generator(fc_compiler,
                       output : 'double_int32_@BASENAME@.f90',
                       arguments : pp_options +
                                   ['-I', '@CURRENT_SOURCE_DIR@/include', '@INPUT@'] +
                                   output_generator)

gen_f_double = generator(fc_compiler,
                         output : 'double_int32_@BASENAME@.f',
                         arguments : pp_options +
                                     ['-I', '@CURRENT_SOURCE_DIR@/include', '@INPUT@'] +
                                     output_generator)

gen_quadruple = generator(fc_compiler,
                          output : 'quadruple_int32_@BASENAME@.f90',
                          arguments : pp_options + '-DREAL_128' +
                                      ['-I', '@CURRENT_SOURCE_DIR@/include', '@INPUT@'] +
                                      output_generator)

gen_f_quadruple = generator(fc_compiler,
                            output : 'quadruple_int32_@BASENAME@.f',
                            arguments : pp_options + '-DREAL_128' +
                                        ['-I', '@CURRENT_SOURCE_DIR@/include', '@INPUT@'] +
                                        output_generator)

gen_single_64 = generator(fc_compiler,
                          output : 'single_int64_@BASENAME@.f90',
                          arguments : pp_options + '-DREAL_32' + '-DINTEGER_64' +
                                      ['-I', '@CURRENT_SOURCE_DIR@/include', '@INPUT@'] +
                                      output_generator)

gen_f_single_64 = generator(fc_compiler,
                            output : 'single_int64_@BASENAME@.f',
                            arguments : pp_options + '-DREAL_32' + '-DINTEGER_64' +
                                        ['-I', '@CURRENT_SOURCE_DIR@/include', '@INPUT@'] +
                                        output_generator)

gen_double_64 = generator(fc_compiler,
                          output : 'double_int64_@BASENAME@.f90',
                          arguments : pp_options + '-DINTEGER_64' +
                                      ['-I', '@CURRENT_SOURCE_DIR@/include', '@INPUT@'] +
                                      output_generator)

gen_f_double_64 = generator(fc_compiler,
                            output : 'double_int64_@BASENAME@.f',
                           arguments : pp_options + '-DINTEGER_64' +
                                       ['-I', '@CURRENT_SOURCE_DIR@/include', '@INPUT@'] +
                                       output_generator)

gen_quadruple_64 = generator(fc_compiler,
                             output : 'quadruple_int64_@BASENAME@.f90',
                             arguments : pp_options + '-DREAL_128' + '-DINTEGER_64' +
                                         ['-I', '@CURRENT_SOURCE_DIR@/include', '@INPUT@'] +
                                         output_generator)

gen_f_quadruple_64 = generator(fc_compiler,
                               output : 'quadruple_int64_@BASENAME@.f',
                               arguments : pp_options + '-DREAL_128' + '-DINTEGER_64' +
                                           ['-I', '@CURRENT_SOURCE_DIR@/include', '@INPUT@'] +
                                           output_generator)

# Library libhsl_subset
pp_sources_f_single = gen_f_single.process(libhsl_subset_f_src)
pp_sources_single = gen_single.process(libhsl_subset_src)

if build_quadruple
  pp_sources_f_double = gen_f_double.process(libhsl_subset_f_src)
  pp_sources_double = gen_double.process(libhsl_subset_src)
  pp_sources_f_quadruple = gen_f_quadruple.process([libhsl_subset_f_src, libhsl_subset_f_multi_src])
  pp_sources_quadruple = gen_quadruple.process([libhsl_subset_src, libhsl_subset_multi_src])
  pp_libhsl_subset_src = [pp_sources_f_single, pp_sources_f_double, pp_sources_f_quadruple,
                          pp_sources_single, pp_sources_double, pp_sources_quadruple]
else
  pp_sources_f_double = gen_f_double.process([libhsl_subset_f_src, libhsl_subset_f_multi_src])
  pp_sources_double = gen_double.process([libhsl_subset_src, libhsl_subset_multi_src])
  pp_libhsl_subset_src = [pp_sources_f_single, pp_sources_f_double, pp_sources_single, pp_sources_double]
endif

libhsl_subset = library('hsl_subset',
                        sources : pp_libhsl_subset_src,
                        include_directories : hsl_subset_include,
                        link_language : 'fortran',
                        install : true)

# Library libhsl_subset_64
pp_sources_f_single_64 = gen_f_single_64.process(libhsl_subset_f_src)
pp_sources_single_64 = gen_single_64.process(libhsl_subset_src)

if build_quadruple
  pp_sources_f_double_64 = gen_f_double_64.process(libhsl_subset_f_src)
  pp_sources_double_64 = gen_double_64.process(libhsl_subset_src)
  pp_sources_f_quadruple_64 = gen_f_quadruple_64.process([libhsl_subset_f_src, libhsl_subset_f_multi_src])
  pp_sources_quadruple_64 = gen_quadruple_64.process([libhsl_subset_src, libhsl_subset_multi_src])
  pp_libhsl_subset_64_src = [pp_sources_f_single_64, pp_sources_f_double_64, pp_sources_f_quadruple_64,
                             pp_sources_single_64, pp_sources_double_64, pp_sources_quadruple_64]
else
  pp_sources_f_double_64 = gen_f_double_64.process([libhsl_subset_f_src, libhsl_subset_f_multi_src])
  pp_sources_double_64 = gen_double_64.process([libhsl_subset_src, libhsl_subset_multi_src])
  pp_libhsl_subset_64_src = [pp_sources_f_single_64, pp_sources_f_double_64, pp_sources_single_64, pp_sources_double_64]
endif

libhsl_subset = library('hsl_subset_64',
                        sources : pp_libhsl_subset_64_src,
                        include_directories : hsl_subset_include,
                        link_language : 'fortran',
                        install : true)

# Headers
install_headers(hsl_subset_headers)

# Fortran modules
script_modules = files('install_modules.py')
meson.add_install_script(script_modules)
