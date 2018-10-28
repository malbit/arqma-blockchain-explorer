set(LIBS common;cryptonote_basic;cryptonote_core;
		cryptonote_protocol;daemonizer;mnemonics;epee;lmdb;
		blockchain_db;ringct;wallet;cncrypto;easylogging;version;checkpoints)

set(EDL_INCLUDE_DIRS "${CPP_EDL_DIR}")

foreach (l ${LIBS})

	string(TOUPPER ${l} L)

	find_library(EDL_${L}_LIBRARY
		NAMES ${l}
		PATHS ${CMAKE_LIBRARY_PATH}
		PATH_SUFFIXES "/src/${l}" "/src/" "/external/db_drivers/lib${l}" "/lib" "/src/crypto" "/contrib/epee/src" "/external/easylogging++/"
		NO_DEFAULT_PATH
	)

	set(EDL_${L}_LIBRARIES ${EDL_${L}_LIBRARY})

	message(STATUS Find-eDollar " EDL_${L}_LIBRARIES ${EDL_${L}_LIBRARY}")

	add_library(${l} STATIC IMPORTED)
	set_property(TARGET ${l} PROPERTY IMPORTED_LOCATION ${EDL_${L}_LIBRARIES})

endforeach()

#if (EXISTS ${EDL_BUILD_DIR}/external/easylogging++/libeasylogging.a)
#	add_library(easylogging STATIC IMPORTED)
#	set_property(TARGET easylogging
#			PROPERTY IMPORTED_LOCATION ${EDL_BUILD_DIR}/external/easylogging++/libeasylogging.a)
#endif()

message(STATUS ${EDL_SOURCE_DIR}/build)

# include eDollar headers
include_directories(
		${EDL_SOURCE_DIR}/src
		${EDL_SOURCE_DIR}/external
		${EDL_SOURCE_DIR}/build
		${EDL_SOURCE_DIR}/external/easylogging++
		${EDL_SOURCE_DIR}/contrib/epee/include
		${EDL_SOURCE_DIR}/external/db_drivers/liblmdb)
