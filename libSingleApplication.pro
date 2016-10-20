TEMPLATE = lib
QT += widgets core gui network
CONFIG   += staticlib 

INCLUDEPATH += ./inc ./src
MOC_DIR += ./moc

win32{
		contains(QT_ARCH, i386) {
			Platform=x86
		}else{
			Platform=x64
		}
}

QtVersionDir=forQt$${QT_MAJOR_VERSION}.$${QT_MINOR_VERSION}

message($$QtVersionDir)
CONFIG(debug, debug|release){
	TARGET = libSingleApplicationd
	OBJECTS_DIR  = ./bin/Debug
	DESTDIR += ./lib/$$QtVersionDir/$$Platform			
}

CONFIG(release, debug|release){
	TARGET = libSingleApplication
	OBJECTS_DIR += ./bin/Release
	DESTDIR = ./lib/$$QtVersionDir/$$Platform
	DEFINES     += QT_NO_DEBUG_OUTPUT
}

contains(TEMPLATE, lib):contains(CONFIG, shared):DEFINES += QT_QTSINGLEAPPLICATION_EXPORT

SOURCES += \
    src/qtlocalpeer.cpp \
    src/qtlockedfile.cpp \
	src/qtsingleapplication.cpp \
	
HEADERS += \
    src/qtlocalpeer.h \
    src/qtlockedfile.h \