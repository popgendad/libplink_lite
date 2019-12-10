#include "plink_lite.h"

#define xstr(s) str(s)
#define str(s) #s

#ifdef VERSION
const char p_version[] = xstr(VERSION);
#endif

const char *plink_version(void)
{
	return p_version;
}