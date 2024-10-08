FROM i386/debian

RUN apt update && apt install -fy gcc make

RUN mkdir -p /workdir

WORKDIR /workdir

COPY . .

RUN gcc -fno-stack-protector -D_IBMR2 -DCOMPILE_DATE="\"$(date -Ins)\"" -zexecstack -g -o ncompress compress42.c
