/*
 * SPDX-License-Identifier: MIT
 */

#include <cstdio>

#include <plog/Log.h>
#include <plog/Init.h>
#include <plog/Appenders/ColorConsoleAppender.h>
#include <plog/Appenders/RollingFileAppender.h>
#include <plog/Formatters/TxtFormatter.h>

static plog::ColorConsoleAppender<plog::TxtFormatter> console_appender;
static plog::RollingFileAppender<plog::TxtFormatter> file_appender("/var/log/le-gateway.log", 2*1024*1024, 5);

int main(void) {
  plog::init(plog::verbose, &file_appender).addAppender(&console_appender);


  return 0;
}
