// 作用：
//  lsize工具，显示路径下各文件夹内总文件数、总子文件夹数、文件夹大小
//
#include <dirent.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#include <cstdio>
#include <stack>
#include <string>

#include "DirInfo.hpp"

using namespace std;

size_t total_files = 0, total_dirs = 0;
// @depth_num : cmdline arg, show how many directories
size_t depth_num = 0;

stack<DirInfo *> st;

DirInfo *walk(string path, size_t depth);

/**
 * 工具使用方法： lsize [path] [-{depth}]
 *   @path 默认当前路径
 *   @depth 显示几层，默认为1
 */
int main(int argc, char *argv[]) {
  string path;
  if (argc == 1) {
    // lsize the current path
    char buf[512];
    getcwd(buf, 512);
    printf("%s\n", buf);
    path = string(buf) + '/';
  } else if (argc == 2) {
    if (argv[1][0] != '-') {
      // get and check path
      int ret = access(argv[1], F_OK);
      if (ret == -1) {
        printf("wrong path!\n");
        exit(0);
      }

      // remove the trailing '/'
      int len = 0;
      while (argv[1][len] != 0)
        len++;
      if (argv[1][len - 1] != '/')
        path = string(argv[1]) + '/';
      else
        path = string(argv[1]);

    } else {
      depth_num = atol(argv[1] + 1);
      char buf[512];
      getcwd(buf, 512);
      printf("%s\n", buf);
      path = string(buf) + '/';
    }
  } else if (argc == 3) {
    // check path
    int ret = access(argv[1], F_OK);
    if (ret == -1) {
      printf("wrong path!\n");
      exit(0);
    }
    // get and check depth
    if (argv[2][0] != '-') {
      printf("wrong depth\n");
      exit(0);
    }
    depth_num = atol(argv[2] + 1);
    // get path and remove the trailing '/'
    int len = 0;
    while (argv[1][len] != 0)
      len++;
    if (argv[1][len - 1] != '/')
      path = string(argv[1]) + '/';
    else
      path = string(argv[1]);
  }

  printf("   size       files    dirs\n");

  walk(path, 0);

  return 0;
}

DirInfo *walk(string path, size_t depth) {
  const char *cur_path = path.c_str();
  DIR *cur_dir = opendir(cur_path);
  if (cur_dir == NULL) {
    perror("open dir");
    exit(0);
  }
  DirInfo *info =
      new DirInfo(path, 4096, 0, 0, depth); // size of an empty dir is 4KiB

  dirent *item;
  while ((item = readdir(cur_dir)) != NULL) {
    string name{item->d_name};
    if (name == "." || name == "..")
      continue;
    if (item->d_type == DT_DIR) {
      info->increase_dirs(1);
      DirInfo *subdirinfo = walk(path + item->d_name + "/", depth + 1);
      info->increase_size(subdirinfo->get_size());
      info->increase_dirs(subdirinfo->get_dirs());
      info->increase_files(subdirinfo->get_files());
      if (subdirinfo->get_depth() > depth_num)
        delete subdirinfo;
    } else {
      info->increase_files(1);
      struct stat statbuf;
      string filepath = path + string(item->d_name);
      int ret = stat(filepath.c_str(), &statbuf);
      if (ret == -1) {
        perror("");
        exit(0);
      }
      info->increase_size(statbuf.st_size);
    }
  }
  if (info->get_depth() <= depth_num) {
    st.push(info);
  }
  if (depth == 0) {
    while (!st.empty()) {
      DirInfo *t = st.top();
      t->display_info();
      delete t;
      st.pop();
    }
    return nullptr;
  }
  closedir(cur_dir);
  return info;
}
