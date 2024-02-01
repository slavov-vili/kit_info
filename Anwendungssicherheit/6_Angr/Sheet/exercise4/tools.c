#define _POSIX_C_SOURCE 200112L
#define _GNU_SOURCE

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <signal.h>


void die(const char * msg) {
	perror(msg);
	fprintf(stderr, "Error number (errno): %d.\n", errno);
	exit(1);
}


long get_file_size(FILE * file) {
	long current_pos = ftell(file);
	if (current_pos == -1) {
		die("could not get file position");
	};
	int result = fseek(file, 0, SEEK_END);
	if (result != 0) {
		die("could not seek to end of file");
	}
	long end = ftell(file);
	if (end == -1) {
		die("could not get end of file position");
	}
	result = fseek(file, current_pos, SEEK_SET);
	if (result != 0) {
		die("could not seek back to old file position while determining file size");
	}
	return end;
}

void set_signal_handler(int signo, void (*handler)(int), int flags) {
	
	int result;
	struct sigaction sighandler;
	result = sigfillset(&sighandler.sa_mask);
	if (result == -1) {
		die("could not initialize signal set");
	};
	sighandler.sa_handler = handler;
	sighandler.sa_flags = flags;
	result = sigaction(signo, &sighandler, (void*) 0);
	if (result == -1) {
		die("could not set up signal handler");
	}
	
}


void immediate_write_to_file(const char * path, const char * text) {
	int fd = open(path, O_WRONLY);
	if (fd < 0) {
		fprintf(stderr, "failed to open \"%s\": %s", path, strerror(errno));
		die("");
	};
	ssize_t result = write(fd, text, strlen(text));
	if (result < 0 || result < strlen(text)) {
		fprintf(stderr, "failed to write to \"%s\": %s", path, strerror(errno));
		/*if (errno == EPERM) {
			perror("EPERM");
		} else if (errno == EINVAL) {
			perror("EINVAL");
		} else if (errno == EBADF) {
			perror("EBADF");
		} else {
			perror("unknown errno");
		};*/
		die("");
	};
	int r2 = close(fd);
	if (r2 != 0) {
		fprintf(stderr, "failed to close \"%s\"", path);
		die("");
	};
}
