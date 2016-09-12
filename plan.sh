pkg_origin=ourorg
pkg_name=tutorial
pkg_version=0.2.0
pkg_maintainer="Yourse1f Yourorg <yourse1f.yourorg@gmail.com>"
pkg_license=('MIT')
pkg_source=http://127.0.0.1:8088/${pkg_name}-${pkg_version}.tar.gz
pkg_shasum=ee5edaf9a320c9b7f92a69c827570464e8957b879882cba147d74638f411122c
pkg_filename=${pkg_name}-${pkg_version}.tar.gz
pkg_deps=(core/node)
pkg_expose=(8080)

do_build() {

  build_line "do_build()    > 07 > ============================================";

  # The mytutorialapp source code is unpacked into a directory,
  # mytutorialapp-0.2.0, at the root of $HAB_CACHE_SRC_PATH. If you were downloading
  # an archive that didn't match your package name and version, you would have to
  # copy the files into $HAB_CACHE_SRC_PATH.

  # This installs both npm as well as the nconf module we listed as a
  # dependency in package.json.
  npm install
  build_line "do_build()    ============================================= < < <";
}

do_install() {
  # Our source files were copied over to the HAB_CACHE_SRC_PATH in do_build(),
  # so now they need to be copied into the root directory of our package through
  # the pkg_prefix variable. This is so that we have the source files available
  # in the package.

  build_line "do_install()  > 08 > ============================================";

  echo "pwd;"
  pwd;

  echo "ls -l;"
  ls -l;

  echo "ls -l ..;"
  ls -l ..;

  echo ">>******";

  cp package.json ${pkg_prefix}
  cp server.js ${pkg_prefix}

  # Copy over the nconf module to the package that we installed in do_build().
  mkdir -p ${pkg_prefix}/node_modules/
  cp -vr node_modules/* ${pkg_prefix}/node_modules/

  build_line "do_install()  ============================================= < < <";  
}

do_nothing() {
  export pkg_name=tutorial;
  export pkg_version=0.2.0;

  tar zcvf ${pkg_name}-${pkg_version}.tar.gz ./${pkg_name}-${pkg_version};
}
