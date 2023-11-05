#!/usr/bin/env bash

[[ -f "$MODULE_ROOT_DIRECTORY_PATH/.build/$MODULE_NAMESPACE_VALUE.bundle.js" ]] &&	\
npx terser "$MODULE_ROOT_DIRECTORY_PATH/.build/$MODULE_NAMESPACE_VALUE.bundle.js"	\
--compress																			\
--keep-classnames																	\
--keep-fnames																		\
--comments /^\;\!/																	\
--output "$MODULE_ROOT_DIRECTORY_PATH/.build/$MODULE_NAMESPACE_VALUE.js";
