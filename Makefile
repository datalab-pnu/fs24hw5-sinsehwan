CC=g++ # 컴파일러 지정
CFLAGS= -Wall # 컴파일 경고 옵션 지정
OBJS = makerec.o recfile.o # 사용할 object 파일 지정
INCDIR=./include # 헤더 파일 위치 지정
LIBDIR=./lib # 라이브러리 위치 지정
#export LD_LIBRARY_PATH=/mnt/d/github/fs2024-code01-sinsehwan/ch05/ch5.3_RecordFile/lib:$LD_LIBRARY_PATH
#사용 필요
DIRS = buf record_file var # makefile수행할 하위 디렉토리 목록

.PHONY: all clean # all과 clean이 파일이 아니라 명령어임을 나타냄

all: RecordFileTest # RecordFileTest이 최종 타겟임을 나타냄
%.o: %.cpp # 헤더파일을 통해 cpp파일을 컴파일함
	$(CC) -c -I$(INCDIR) $(CFLAGS) -o $@ $<

RecordFileTest: $(OBJS)
	@for d in $(DIRS); \
	do \
		$(MAKE) -C $$d; \
	done
	$(CC) -o RecordFileTest $(OBJS) -L$(LIBDIR) -lmybuf -lmyrecord_file -lmyvar
	export LD_LIBRARY_PATH=$(LIBDIR)
# 디렉토리를 순회하면서 반복문 수행
# 각 디렉토리에서 makefile을 수행한다.
# -L플래그로 라이브러리 경로를 지정해주고 -l로 링크할 라이브러리를 지정해준 상태에서 RecordFileTest를 만든다.
# 동적 라이브러리 경로 지정
clean:
	@for d in $(DIRS); \
	do \
		$(MAKE) -C $$d clean; \
	done
	-rm -rf RecordFileTest $(OBJS) 
# 디렉토리를 순회하면서 make clean연산을 수행한다.
# 이후 RecordFileTest파일과 obj파일들을 삭제한다.