#ifndef __DIRINFO__
#define __DIRINFO__

#include <cstddef>
#include <iostream>
#include <unistd.h>

static const char *unit[] = {"B", "KiB", "MiB", "GiB", "TiB"};

class DirInfo {
private:
  size_t depth;
  size_t total_size{0}, total_dirs{0}, total_files{0};
  std::string path;

public:
  DirInfo(std::string &path, size_t init_size, size_t init_dirs,
          size_t init_files, size_t depth)
      : path{path}, total_size{init_size}, total_dirs{init_dirs},
        total_files{init_files}, depth{depth} {};
  void increase_size(size_t num) { total_size += num; };
  void increase_dirs(size_t num) { total_dirs += num; };
  void increase_files(size_t num) { total_files += num; };
  size_t get_dirs() { return total_dirs; };
  size_t get_size() { return total_size; };
  size_t get_files() { return total_files; };
  size_t get_depth() { return depth; };
  void display_info();
};

inline void DirInfo::display_info() {
  // kB -> mB -> gB
  int idx{0};
  float res{0};
  size_t tmp_size = total_size;
  while (tmp_size >= 1024) {
    res = (float)tmp_size / 1024;
    tmp_size /= 1024;
    idx++;
  }
  printf("%6.2f %s\t%ld\t%ld\t%s\n", res, unit[idx], total_files, total_dirs,
         path.c_str());
}

#endif // !__DIRINFO__
