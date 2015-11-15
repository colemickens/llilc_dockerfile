FROM ubuntu:14.04

RUN bash -c "\
	sudo apt-get install build-essential
"

RUN bash -c "\
	git clone https://github.com/dotnet/coreclr \
	cd coreclr \ 
	./build.sh \
	cd ..
"

RUN bash -c "\
	git clone -b MS https://github.com/microsoft/llvm \
	cd llvm/tools \ 
	git clone https://github.com/dotnet/llilc \
	cd ..
"

RUN bash -c "\
	mkdir build \
	cd build \
	cmake -DWITH_CORECLR=../../coreclr/path/to/CoreCLR/binaries -DLLVM_OPTIMIZED_TABLEGEN=ON .. \
	make
"