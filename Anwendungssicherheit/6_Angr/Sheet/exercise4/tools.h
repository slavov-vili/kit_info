void die(const char * msg);
long get_file_size(FILE * file);
void set_signal_handler(int signo, void (*handler)(int), int flags);
void immediate_write_to_file(const char * path, const char * text);
