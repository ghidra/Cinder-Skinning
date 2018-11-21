if( NOT TARGET Cinder-Skinning )

	#add_subdirectory("${CMAKE_CURRENT_LIST_DIR}/../../lib/assimp/lib")
	
	get_filename_component( CINDER_SKINNING_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE )
	get_filename_component( CINDER_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../.." ABSOLUTE )
	
	list( APPEND SKINNING_SOURCES
		${CINDER_SKINNING_SOURCE_PATH}/src/model/Actor.cpp
		${CINDER_SKINNING_SOURCE_PATH}/src/model/Actor.h
		${CINDER_SKINNING_SOURCE_PATH}/src/model/AMeshSection.h
		${CINDER_SKINNING_SOURCE_PATH}/src/model/AnimCurve.cpp
		${CINDER_SKINNING_SOURCE_PATH}/src/model/AnimCurve.h
		${CINDER_SKINNING_SOURCE_PATH}/src/model/AnimTrack.h
		${CINDER_SKINNING_SOURCE_PATH}/src/model/AssimpLoader.cpp
		${CINDER_SKINNING_SOURCE_PATH}/src/model/AssimpLoader.h
		${CINDER_SKINNING_SOURCE_PATH}/src/model/CustomIOStream.cpp
		${CINDER_SKINNING_SOURCE_PATH}/src/model/CustomIOStream.h
		${CINDER_SKINNING_SOURCE_PATH}/src/model/Debug.h
		${CINDER_SKINNING_SOURCE_PATH}/src/model/ModelIo.cpp
		${CINDER_SKINNING_SOURCE_PATH}/src/model/ModelIo.h
		${CINDER_SKINNING_SOURCE_PATH}/src/model/MorphedMesh.cpp
		${CINDER_SKINNING_SOURCE_PATH}/src/model/MorphedMesh.h
		${CINDER_SKINNING_SOURCE_PATH}/src/model/Node.cpp
		${CINDER_SKINNING_SOURCE_PATH}/src/model/Node.h
		${CINDER_SKINNING_SOURCE_PATH}/src/model/Renderer.cpp
		${CINDER_SKINNING_SOURCE_PATH}/src/model/Renderer.h
		${CINDER_SKINNING_SOURCE_PATH}/src/model/SkeletalMesh.cpp
		${CINDER_SKINNING_SOURCE_PATH}/src/model/SkeletalMesh.h
		${CINDER_SKINNING_SOURCE_PATH}/src/model/SkeletalTriMesh.cpp
		${CINDER_SKINNING_SOURCE_PATH}/src/model/SkeletalTriMesh.h
		${CINDER_SKINNING_SOURCE_PATH}/src/model/Skeleton.cpp
		${CINDER_SKINNING_SOURCE_PATH}/src/model/Skeleton.h
		${CINDER_SKINNING_SOURCE_PATH}/src/model/StaticMesh.cpp
		${CINDER_SKINNING_SOURCE_PATH}/src/model/StaticMesh.h
		${CINDER_SKINNING_SOURCE_PATH}/src/model/SurfacePool.cpp
		${CINDER_SKINNING_SOURCE_PATH}/src/model/SurfacePool.h

	)

	#find_library(ASSIMP_LIB NAMES libassimp HINTS "${CMAKE_CURRENT_LIST_DIR}/../../lib/assimp/lib")

  	add_library( Cinder-Skinning ${SKINNING_SOURCES} )

	target_include_directories( Cinder-Skinning PUBLIC "${CINDER_SKINNING_SOURCE_PATH}" )

  	list( APPEND SKINNING_INCLUDE_DIRS
		${CINDER_SKINNING_SOURCE_PATH}/include
		${CINDER_SKINNING_SOURCE_PATH}/src
		${CINDER_SKINNING_SOURCE_PATH}/lib/assimp/include
		${CINDER_PATH}/include
	)

  	target_include_directories( Cinder-Skinning SYSTEM BEFORE PUBLIC "${SKINNING_INCLUDE_DIRS}" )

  	#target_link_libraries(Cinder-Skinning "${ASSIMP_LIB}")

  	if( NOT TARGET cinder )
		include( "${CINDER_PATH}/proj/cmake/configure.cmake" )
		find_package( cinder REQUIRED PATHS
	  		"${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
	  		"$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}" )
  	endif()
  
  	#link_directories(${CMAKE_CURRENT_LIST_DIR}/../../lib/assimp/lib)

  	# Your-external "mylib", add GLOBAL if the imported library is located in directories above the current.
	add_library( libassimp SHARED IMPORTED )
	# You can define two import-locations: one for debug and one for release.
	set_target_properties( libassimp PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_LIST_DIR}/../../lib/assimp/lib/libassimp.so )

  	target_link_libraries( Cinder-Skinning PRIVATE cinder libassimp )
  	
endif()
