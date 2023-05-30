#ifndef H_FIO_APP_MENU
#define H_FIO_APP_MENU

#include <ux.h>
#include <os_io_seproxyhal.h>

#if defined(TARGET_NANOS)
extern const ux_menu_entry_t menu_main[4];
#elif defined(TARGET_NANOX) || defined(TARGET_NANOS2)
extern const ux_flow_step_t* const ux_idle_flow[];
#endif

#endif  // H_FIO_APP_MENU
